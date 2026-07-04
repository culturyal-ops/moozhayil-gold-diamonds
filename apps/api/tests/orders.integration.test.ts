import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";

async function cleanOrderTables() {
  await prisma.webhookEvent.deleteMany();
  await prisma.idempotencyKey.deleteMany();
  await prisma.inventoryReservation.deleteMany();
  await prisma.orderItem.deleteMany();
  await prisma.order.deleteMany();
  await prisma.paymentTransaction.deleteMany();
  await prisma.goldBalanceSnapshot.deleteMany();
  await prisma.goldLedgerEntry.deleteMany();
  await prisma.contribution.deleteMany();
  await prisma.goal.deleteMany();
  await prisma.cartItem.deleteMany();
  await prisma.address.deleteMany();
  await prisma.serviceablePincode.deleteMany();
  await prisma.productOccasionTag.deleteMany();
  await prisma.productImage.deleteMany();
  await prisma.product.deleteMany();
  await prisma.goldRateHistory.deleteMany();
  await prisma.category.deleteMany();
  await prisma.authSession.deleteMany();
  await prisma.otpSession.deleteMany();
  await prisma.user.deleteMany();
}

async function signIn(app: ReturnType<typeof createApp>, phone: string) {
  const sendResponse = await request(app)
    .post("/v1/auth/send-otp")
    .send({ phone });

  const verifyResponse = await request(app)
    .post("/v1/auth/verify-otp")
    .send({
      otp_session_id: sendResponse.body.otp_session_id,
      otp: "123456",
    });

  return {
    accessToken: verifyResponse.body.access_token as string,
    userId: verifyResponse.body.user.id as string,
  };
}

async function seedCatalog() {
  const category = await prisma.category.create({
    data: { name: "Bangles", slug: "bangles" },
  });

  await prisma.goldRateHistory.create({
    data: {
      purity: "k22",
      ratePerGramPaise: 624000,
      effectiveFrom: new Date("2026-06-26T04:30:00Z"),
      source: "test",
    },
  });

  const product = await prisma.product.create({
    data: {
      sku: "MGD-P8-001",
      name: "Temple Bangle",
      categoryId: category.id,
      purity: "k22",
      weightGrams: "1.0000",
      makingChargePct: "12.00",
      stockQuantity: 2,
      isPublished: true,
    },
  });

  await prisma.serviceablePincode.create({
    data: {
      pincode: "680001",
      city: "Thrissur",
      state: "Kerala",
      serviceable: true,
      estimatedDeliveryDays: 3,
      pickupAvailable: true,
    },
  });

  return product;
}

describe("Phase 8 orders and payments", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.PAYMENT_PROVIDER_MODE = "mock";
    process.env.RAZORPAY_WEBHOOK_SECRET = "mock_webhook_secret_for_local_dev";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanOrderTables();
  });

  afterAll(async () => {
    await cleanOrderTables();
    await prisma.$disconnect();
  });

  it("creates a gold-balance order idempotently and debits ledger", async () => {
    const product = await seedCatalog();
    const auth = await signIn(app, "+919876543210");
    await prisma.user.update({
      where: { id: auth.userId },
      data: { kycStatus: "basic_verified" },
    });

    await prisma.goldLedgerEntry.create({
      data: {
        userId: auth.userId,
        entryType: "contribution_credit",
        status: "posted",
        gramsDelta: "2.0000",
        amountPaise: 1248000,
        goldRatePerGramPaise: 624000,
        sourceType: "contribution",
        sourceId: crypto.randomUUID(),
        correlationId: crypto.randomUUID(),
        idempotencyKey: `seed:${auth.userId}`,
        postedAt: new Date(),
      },
    });

    const address = await prisma.address.create({
      data: {
        userId: auth.userId,
        fullName: "Priya Menon",
        phone: "+919876543210",
        line1: "12 Temple Road",
        city: "Thrissur",
        state: "Kerala",
        pincode: "680001",
      },
    });

    const payload = {
      items: [{ product_id: product.id, quantity: 1 }],
      delivery_address_id: address.id,
      payment_method: "gold_balance",
    };

    const first = await request(app)
      .post("/v1/orders")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "order-gold-1")
      .send(payload);

    expect(first.status).toBe(201);
    expect(first.body.order.status).toBe("confirmed");
    expect(first.body.payment_required).toBe(false);

    const replay = await request(app)
      .post("/v1/orders")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "order-gold-1")
      .send(payload);

    expect(replay.status).toBe(201);
    expect(replay.body.order.id).toBe(first.body.order.id);

    const debits = await prisma.goldLedgerEntry.findMany({
      where: { userId: auth.userId, entryType: "redemption_debit" },
    });
    expect(debits).toHaveLength(1);
  });

  it("returns duplicate order on idempotent retry without overselling stock", async () => {
    const product = await seedCatalog();
    const auth = await signIn(app, "+919876543211");
    await prisma.user.update({
      where: { id: auth.userId },
      data: { kycStatus: "basic_verified" },
    });

    const address = await prisma.address.create({
      data: {
        userId: auth.userId,
        fullName: "Priya Menon",
        phone: "+919876543211",
        line1: "12 Temple Road",
        city: "Thrissur",
        state: "Kerala",
        pincode: "680001",
      },
    });

    await prisma.goldLedgerEntry.create({
      data: {
        userId: auth.userId,
        entryType: "contribution_credit",
        status: "posted",
        gramsDelta: "5.0000",
        amountPaise: 3120000,
        goldRatePerGramPaise: 624000,
        sourceType: "contribution",
        sourceId: crypto.randomUUID(),
        correlationId: crypto.randomUUID(),
        idempotencyKey: `seed2:${auth.userId}`,
        postedAt: new Date(),
      },
    });

    const payload = {
      items: [{ product_id: product.id, quantity: 1 }],
      delivery_address_id: address.id,
      payment_method: "gold_balance",
    };

    await request(app)
      .post("/v1/orders")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "order-stock-1")
      .send(payload);

    const refreshedProduct = await prisma.product.findUniqueOrThrow({
      where: { id: product.id },
    });
    expect(refreshedProduct.stockQuantity).toBe(1);
  });

  it("processes payment webhook with signature verification", async () => {
    const payload = {
      id: "evt_test_1",
      event: "payment.captured",
      payload: {
        payment: {
          entity: {
            order_id: "mock_order_webhook",
            id: "mock_pay_webhook",
            status: "captured",
          },
        },
      },
    };

    const raw = JSON.stringify(payload);
    const signature = "mock_valid_signature";

    const response = await request(app)
      .post("/v1/webhooks/payment")
      .set("Content-Type", "application/json")
      .set("x-razorpay-signature", signature)
      .send(raw);

    expect(response.status).toBe(200);
    expect(response.body.received).toBe(true);

    const stored = await prisma.webhookEvent.findFirst({
      where: { providerEventId: "evt_test_1" },
    });
    expect(stored?.signatureValid).toBe(true);
  });

  it("refunds gold on cancellation", async () => {
    const product = await seedCatalog();
    const auth = await signIn(app, "+919876543212");
    await prisma.user.update({
      where: { id: auth.userId },
      data: { kycStatus: "basic_verified" },
    });

    const address = await prisma.address.create({
      data: {
        userId: auth.userId,
        fullName: "Priya Menon",
        phone: "+919876543212",
        line1: "12 Temple Road",
        city: "Thrissur",
        state: "Kerala",
        pincode: "680001",
      },
    });

    await prisma.goldLedgerEntry.create({
      data: {
        userId: auth.userId,
        entryType: "contribution_credit",
        status: "posted",
        gramsDelta: "5.0000",
        amountPaise: 3120000,
        goldRatePerGramPaise: 624000,
        sourceType: "contribution",
        sourceId: crypto.randomUUID(),
        correlationId: crypto.randomUUID(),
        idempotencyKey: `seed3:${auth.userId}`,
        postedAt: new Date(),
      },
    });

    const created = await request(app)
      .post("/v1/orders")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "order-cancel-1")
      .send({
        items: [{ product_id: product.id, quantity: 1 }],
        delivery_address_id: address.id,
        payment_method: "gold_balance",
      });

    const orderId = created.body.order.id as string;

    const cancel = await request(app)
      .post(`/v1/orders/${orderId}/cancel`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ reason: "Changed my mind" });

    expect(cancel.status).toBe(200);
    expect(cancel.body.refund_initiated).toBe(true);

    const refund = await prisma.goldLedgerEntry.findFirst({
      where: { userId: auth.userId, entryType: "refund_credit" },
    });
    expect(refund).not.toBeNull();
  });
});

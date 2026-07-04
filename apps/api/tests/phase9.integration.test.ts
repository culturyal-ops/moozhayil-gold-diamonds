import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";
import { processNotification } from "../src/jobs/processors/notification.processor";
import { notificationsService } from "../src/modules/notifications/notifications.service";

async function cleanPhase9Tables() {
  await prisma.auraMessage.deleteMany();
  await prisma.auraSession.deleteMany();
  await prisma.notification.deleteMany();
  await prisma.notificationPreference.deleteMany();
  await prisma.productView.deleteMany();
  await prisma.referral.deleteMany();
  await prisma.product.deleteMany();
  await prisma.category.deleteMany();
  await prisma.goldRateHistory.deleteMany();
  await prisma.idempotencyKey.deleteMany();
  await prisma.goldBalanceSnapshot.deleteMany();
  await prisma.goldLedgerEntry.deleteMany();
  await prisma.contribution.deleteMany();
  await prisma.goal.deleteMany();
  await prisma.authSession.deleteMany();
  await prisma.otpSession.deleteMany();
  await prisma.userDevice.deleteMany();
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

describe("Phase 9 engagement layer", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.FIREBASE_MODE = "mock";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanPhase9Tables();
  });

  afterAll(async () => {
    await cleanPhase9Tables();
    await prisma.$disconnect();
  });

  it("persists and delivers notifications with deep links", async () => {
    const auth = await signIn(app, "+919876543300");

    const notification = await notificationsService.enqueue({
      userId: auth.userId,
      type: "contribution_success",
      templateKey: "contribution_success",
      variables: {
        grams_display: "0.3g",
        goal_name: "Wedding Goal",
      },
      deepLink: "/goals/test",
    });

    expect(notification).not.toBeNull();
    await processNotification(notification!.id);

    const list = await request(app)
      .get("/v1/notifications")
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(list.status).toBe(200);
    expect(list.body.data).toHaveLength(1);
    expect(list.body.data[0].deep_link).toBe("/goals/test");
    expect(list.body.unread_count).toBe(1);

    const read = await request(app)
      .post(`/v1/notifications/${list.body.data[0].id}/read`)
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(read.status).toBe(200);
    expect(read.body.success).toBe(true);
  });

  it("filters Aura recommendations to in-stock published products", async () => {
    const auth = await signIn(app, "+919876543301");
    const category = await prisma.category.create({
      data: { name: "Rings", slug: "rings" },
    });

    await prisma.goldRateHistory.create({
      data: {
        purity: "k22",
        ratePerGramPaise: 624000,
        effectiveFrom: new Date("2026-06-26T04:30:00Z"),
        source: "test",
      },
    });

    await prisma.product.create({
      data: {
        sku: "MGD-P9-001",
        name: "In Stock Ring",
        categoryId: category.id,
        purity: "k22",
        weightGrams: "1.0000",
        makingChargePct: "12.00",
        stockQuantity: 2,
        isPublished: true,
      },
    });

    await prisma.product.create({
      data: {
        sku: "MGD-P9-002",
        name: "Out Of Stock Ring",
        categoryId: category.id,
        purity: "k22",
        weightGrams: "1.0000",
        makingChargePct: "12.00",
        stockQuantity: 0,
        isPublished: true,
      },
    });

    const response = await request(app)
      .post("/v1/aura/discover")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({
        for_person: "self",
        occasion: "anniversary",
        budget_paise: 10_000_000,
      });

    expect(response.status).toBe(200);
    expect(response.body.products.every((product: { name: string }) =>
      product.name !== "Out Of Stock Ring",
    )).toBe(true);
  });

  it("prevents self-referral", async () => {
    const auth = await signIn(app, "+919876543302");
    await prisma.user.update({
      where: { id: auth.userId },
      data: { referralCode: "PRIYA2026" },
    });

    const response = await request(app)
      .post("/v1/referrals/apply")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ referral_code: "PRIYA2026" });

    expect(response.status).toBe(422);
  });

  it("lists nearby stores and supports search", async () => {
    const list = await request(app).get("/v1/stores?lat=10.5276&lng=76.2144&radius_km=50");

    expect(list.status).toBe(200);
    expect(list.body.stores.length).toBeGreaterThan(0);
    expect(list.body.stores[0].distance_km).toBeDefined();

    const search = await request(app).get("/v1/stores?q=Thrissur");
    expect(search.status).toBe(200);
    expect(search.body.stores.length).toBeGreaterThan(0);
  });

  it("returns structured Aura insight", async () => {
    const auth = await signIn(app, "+919876543303");

    await prisma.goldRateHistory.create({
      data: {
        purity: "k22",
        ratePerGramPaise: 624000,
        effectiveFrom: new Date("2026-06-26T04:30:00Z"),
        source: "test",
      },
    });

    const response = await request(app)
      .post("/v1/aura/insight")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({});

    expect(response.status).toBe(200);
    expect(response.body.insight_text).toBeTruthy();
    expect(response.body.link_route).toMatch(/^\/aura\//);
  });
});

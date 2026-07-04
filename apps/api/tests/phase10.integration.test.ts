import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { AdminAuthService } from "../src/modules/admin/admin_auth.service";
import { signAdminToken } from "../src/modules/admin/admin.middleware";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";
import { createHmac } from "crypto";

const app = createApp();

async function cleanPhase10() {
  await prisma.auditLog.deleteMany();
  await prisma.sarReview.deleteMany();
  await prisma.ledgerAdjustment.deleteMany();
  await prisma.webhookEvent.deleteMany();
  await prisma.adminUser.deleteMany();
}

describe("Phase 10 admin platform", () => {
  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.KYC_WEBHOOK_SECRET = "test_kyc_webhook_secret_32_chars";
    process.env.GOLD_RATE_WEBHOOK_SECRET = "test_gold_rate_webhook_secret";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanPhase10();
  });

  afterAll(async () => {
    await cleanPhase10();
    await prisma.$disconnect();
  });

  it("logs in admin and lists audit logs", async () => {
    const admin = await prisma.adminUser.create({
      data: {
        email: "admin@moozhayil.com",
        name: "Super Admin",
        role: "super_admin",
        passwordHash: AdminAuthService.hashPasswordForSeed("AdminPass123!"),
      },
    });

    const login = await request(app)
      .post("/v1/admin/auth/login")
      .send({ email: admin.email, password: "AdminPass123!" });

    expect(login.status).toBe(200);
    expect(login.body.access_token).toEqual(expect.any(String));

    await prisma.auditLog.create({
      data: {
        actorType: "admin",
        actorId: admin.id,
        action: "test_action",
        entityType: "system",
      },
    });

    const logs = await request(app)
      .get("/v1/admin/audit-logs")
      .set("Authorization", `Bearer ${login.body.access_token}`);

    expect(logs.status).toBe(200);
    expect(logs.body.logs.length).toBeGreaterThan(0);
  });

  it("rejects admin routes without token", async () => {
    const response = await request(app).get("/v1/admin/dashboard");
    expect(response.status).toBe(401);
  });

  it("accepts signed KYC webhook", async () => {
    const payload = {
      id: "kyc_evt_1",
      event: "aadhaar.verified",
      user_id: "00000000-0000-4000-8000-000000000001",
    };
    const rawBody = JSON.stringify(payload);
    const signature = createHmac("sha256", process.env.KYC_WEBHOOK_SECRET!)
      .update(rawBody)
      .digest("hex");

    const response = await request(app)
      .post("/v1/webhooks/kyc")
      .set("Content-Type", "application/json")
      .set("x-kyc-signature", signature)
      .send(rawBody);

    expect(response.status).toBe(200);
    expect(response.body.received).toBe(true);
  });

  it("deduplicates webhook events", async () => {
    const payload = {
      id: "rate_evt_dup",
      event: "rate.updated",
      purity: "22k",
      rate_per_gram_paise: 650000,
    };
    const rawBody = JSON.stringify(payload);
    const signature = createHmac("sha256", process.env.GOLD_RATE_WEBHOOK_SECRET!)
      .update(rawBody)
      .digest("hex");

    const first = await request(app)
      .post("/v1/webhooks/gold-rate")
      .set("Content-Type", "application/json")
      .set("x-gold-rate-signature", signature)
      .send(rawBody);

    const second = await request(app)
      .post("/v1/webhooks/gold-rate")
      .set("Content-Type", "application/json")
      .set("x-gold-rate-signature", signature)
      .send(rawBody);

    expect(first.status).toBe(200);
    expect(second.status).toBe(200);
    expect(second.body.duplicate).toBe(true);
  });

  it("issues step-up token for authenticated admin", async () => {
    const admin = await prisma.adminUser.create({
      data: {
        email: "finance@moozhayil.com",
        name: "Finance",
        role: "finance_manager",
        passwordHash: AdminAuthService.hashPasswordForSeed("FinancePass123!"),
      },
    });

    const token = signAdminToken(admin.id, admin.role);
    const stepUp = await request(app)
      .post("/v1/admin/auth/step-up")
      .set("Authorization", `Bearer ${token}`)
      .send({ password: "FinancePass123!" });

    expect(stepUp.status).toBe(200);
    expect(stepUp.body.step_up_token).toEqual(expect.any(String));
  });
});

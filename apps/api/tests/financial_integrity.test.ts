import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";
import { contributionsService } from "../src/modules/contributions/contributions.service";
import { goldLedgerService } from "../src/modules/gold_ledger/gold_ledger.service";

async function cleanFinancialTables() {
  await prisma.idempotencyKey.deleteMany();
  await prisma.userMilestone.deleteMany();
  await prisma.goldBalanceSnapshot.deleteMany();
  await prisma.goldLedgerEntry.deleteMany();
  await prisma.contribution.deleteMany();
  await prisma.goal.deleteMany();
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

async function verifyUser(userId: string) {
  await prisma.user.update({
    where: { id: userId },
    data: { kycStatus: "basic_verified" },
  });
}

async function seedRate() {
  await prisma.goldRateHistory.create({
    data: {
      purity: "k22",
      ratePerGramPaise: 624000,
      effectiveFrom: new Date("2026-06-26T04:30:00Z"),
      source: "test",
    },
  });
}

async function createGoalForUser(app: ReturnType<typeof createApp>, token: string) {
  const response = await request(app)
    .post("/v1/goals")
    .set("Authorization", `Bearer ${token}`)
    .set("Idempotency-Key", `integrity-${token.slice(-8)}-${Date.now()}`)
    .send({
      scheme_type: "aura",
      goal_type: "investment",
      name: "Integrity Goal",
      monthly_amount_paise: 300000,
      duration_months: 11,
      start_date: "2026-07-01",
      target_amount_paise: 5000000,
    });

  return response.body.goal.id as string;
}

const INTEGRITY_CONTRIBUTION_PAISE = 300000;
const INTEGRITY_CREDITED_GRAMS = "0.4807";

describe("Financial integrity audit", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.PAYMENT_PROVIDER_MODE = "mock";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanFinancialTables();
    await seedRate();
  });

  afterAll(async () => {
    await cleanFinancialTables();
    await prisma.$disconnect();
  });

  it("posts at most one ledger credit per contribution even if completion is retried", async () => {
    const auth = await signIn(app, "+919876543210");
    await verifyUser(auth.userId);
    const goalId = await createGoalForUser(app, auth.accessToken);

    await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "integrity-double-complete")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    const contribution = await prisma.contribution.findFirstOrThrow({
      where: { goalId, type: "manual", status: "completed" },
    });

    await contributionsService.completeContribution({
      contributionId: contribution.id,
    });
    await contributionsService.completeContribution({
      contributionId: contribution.id,
    });

    const ledgerRows = await prisma.goldLedgerEntry.findMany({
      where: {
        sourceId: contribution.id,
        entryType: "contribution_credit",
        status: "posted",
      },
    });

    expect(ledgerRows).toHaveLength(1);
  });

  it("derives goal progress from posted ledger entries, not mutable contribution fields", async () => {
    const auth = await signIn(app, "+919876543211");
    await verifyUser(auth.userId);
    const goalId = await createGoalForUser(app, auth.accessToken);

    await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "integrity-progress-1")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    await prisma.contribution.updateMany({
      where: { goalId },
      data: { gramsCredited: "99.9999" },
    });

    const goalProgress = await goldLedgerService.getGoalCreditedGrams(goalId);
    expect(goalProgress.toFixed(4)).toBe(INTEGRITY_CREDITED_GRAMS);

    const detail = await request(app)
      .get(`/v1/goals/${goalId}`)
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(detail.body.goal.current_grams).toBe(INTEGRITY_CREDITED_GRAMS);
  });

  it("uses ledger aggregate for balance, not snapshots", async () => {
    const auth = await signIn(app, "+919876543212");
    await verifyUser(auth.userId);
    const goalId = await createGoalForUser(app, auth.accessToken);

    await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "integrity-balance-1")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    await prisma.goldBalanceSnapshot.create({
      data: {
        userId: auth.userId,
        totalGrams: "99.9999",
        totalValuePaise: 99_999_999,
        goldRateUsedPaise: 624000,
        snapshotAt: new Date(),
        reason: "tampered_test_snapshot",
      },
    });

    const balance = await request(app)
      .get("/v1/gold-balance")
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(balance.body.total_grams).toBe(INTEGRITY_CREDITED_GRAMS);
  });

  it("retains earned gold when a goal is cancelled", async () => {
    const auth = await signIn(app, "+919876543213");
    await verifyUser(auth.userId);
    const goalId = await createGoalForUser(app, auth.accessToken);

    await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "integrity-cancel-1")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    const cancel = await request(app)
      .delete(`/v1/goals/${goalId}`)
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(cancel.status).toBe(200);
    expect(cancel.body.gold_retained_grams).toBe(INTEGRITY_CREDITED_GRAMS);

    const balance = await request(app)
      .get("/v1/gold-balance")
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(balance.body.total_grams).toBe(INTEGRITY_CREDITED_GRAMS);

    const ledgerCount = await prisma.goldLedgerEntry.count({
      where: { userId: auth.userId, status: "posted" },
    });
    expect(ledgerCount).toBe(1);
  });

  it("scopes idempotency keys per user and replays contribute without duplicate ledger rows", async () => {
    const userA = await signIn(app, "+919876543214");
    const userB = await signIn(app, "+919876543215");
    await verifyUser(userA.userId);
    await verifyUser(userB.userId);

    const goalA = await createGoalForUser(app, userA.accessToken);
    const goalB = await createGoalForUser(app, userB.accessToken);

    const first = await request(app)
      .post(`/v1/goals/${goalA}/contribute`)
      .set("Authorization", `Bearer ${userA.accessToken}`)
      .set("Idempotency-Key", "shared-key-123")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    const replay = await request(app)
      .post(`/v1/goals/${goalA}/contribute`)
      .set("Authorization", `Bearer ${userA.accessToken}`)
      .set("Idempotency-Key", "shared-key-123")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    expect(first.status).toBe(200);
    expect(replay.status).toBe(200);
    expect(replay.body.contribution.id).toBe(first.body.contribution.id);

    const userBContrib = await request(app)
      .post(`/v1/goals/${goalB}/contribute`)
      .set("Authorization", `Bearer ${userB.accessToken}`)
      .set("Idempotency-Key", "shared-key-123")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    expect(userBContrib.status).toBe(200);
    expect(userBContrib.body.contribution.id).not.toBe(first.body.contribution.id);

    const ledgerA = await prisma.goldLedgerEntry.count({
      where: { userId: userA.userId, status: "posted" },
    });
    const ledgerB = await prisma.goldLedgerEntry.count({
      where: { userId: userB.userId, status: "posted" },
    });

    expect(ledgerA).toBe(1);
    expect(ledgerB).toBe(1);
  });

  it("rejects cross-user goal mutations and ledger reads", async () => {
    const owner = await signIn(app, "+919876543216");
    const intruder = await signIn(app, "+919876543217");
    await verifyUser(owner.userId);
    await verifyUser(intruder.userId);

    const goalId = await createGoalForUser(app, owner.accessToken);

    const contribute = await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${intruder.accessToken}`)
      .set("Idempotency-Key", "intruder-contrib")
      .send({ amount_paise: INTEGRITY_CONTRIBUTION_PAISE });

    expect(contribute.status).toBe(404);

    const detail = await request(app)
      .get(`/v1/goals/${goalId}`)
      .set("Authorization", `Bearer ${intruder.accessToken}`);

    expect(detail.status).toBe(404);

    const ledger = await request(app)
      .get(`/v1/gold-balance/ledger?goal_id=${goalId}`)
      .set("Authorization", `Bearer ${intruder.accessToken}`);

    expect(ledger.status).toBe(404);
  });

  it("requires authentication on goal, contribution, and ledger endpoints", async () => {
    const unauthenticated = [
      request(app).get("/v1/goals"),
      request(app).post("/v1/goals").send({}),
      request(app).get("/v1/gold-balance"),
      request(app).get("/v1/gold-balance/ledger"),
      request(app).get("/v1/contributions/pending"),
    ];

    for (const call of unauthenticated) {
      const response = await call;
      expect(response.status).toBe(401);
    }
  });
});

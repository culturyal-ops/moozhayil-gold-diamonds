import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";
import { processContributionDueStatuses } from "../src/jobs/processors/autopay.processor";
import {
  AURA_DURATION_MONTHS,
  AURA_MIN_INSTALLMENT_PAISE,
} from "../src/config/aura.constants";
import { addDays, addMonths, formatDateOnly, toDateOnly } from "../src/utils/dates";
import { isWithinAuraRedemptionWindow } from "../src/modules/goals/aura.service";

async function cleanTables() {
  await prisma.idempotencyKey.deleteMany();
  await prisma.userMilestone.deleteMany();
  await prisma.goldBalanceSnapshot.deleteMany();
  await prisma.goldLedgerEntry.deleteMany();
  await prisma.contribution.deleteMany();
  await prisma.goal.deleteMany();
  await prisma.paymentMethod.deleteMany();
  await prisma.auditLog.deleteMany();
  await prisma.kycAadhaarSession.deleteMany();
  await prisma.kycDocument.deleteMany();
  await prisma.authSession.deleteMany();
  await prisma.otpSession.deleteMany();
  await prisma.userIntent.deleteMany();
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

async function verifyUser(userId: string) {
  await prisma.user.update({
    where: { id: userId },
    data: { kycStatus: "basic_verified" },
  });
}

async function seedGoldRate() {
  await prisma.goldRateHistory.create({
    data: {
      purity: "k22",
      ratePerGramPaise: 624000,
      effectiveFrom: new Date("2026-06-26T04:30:00Z"),
      source: "test",
    },
  });
}

function auraCreatePayload(overrides: Record<string, unknown> = {}) {
  return {
    scheme_type: "aura",
    goal_type: "wedding",
    name: "Aura Wedding Plan",
    monthly_amount_paise: 50_000,
    duration_months: AURA_DURATION_MONTHS,
    start_date: "2026-07-01",
    ...overrides,
  };
}

describe("Aura Plan business rules", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.PAYMENT_PROVIDER_MODE = "mock";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanTables();
    await seedGoldRate();
  });

  afterAll(async () => {
    await cleanTables();
    await prisma.$disconnect();
  });

  it("requires 11-month duration and ₹500 multiples on create", async () => {
    const auth = await signIn(app, "+919876543210");
    await verifyUser(auth.userId);

    const invalidDuration = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-bad-duration")
      .send(auraCreatePayload({ duration_months: 12 }));

    expect(invalidDuration.status).toBe(422);

    const invalidAmount = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-bad-amount")
      .send(auraCreatePayload({ monthly_amount_paise: 75_000 }));

    expect(invalidAmount.status).toBe(422);

    const belowMinimum = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-below-min")
      .send(auraCreatePayload({ monthly_amount_paise: AURA_MIN_INSTALLMENT_PAISE - 1 }));

    expect(belowMinimum.status).toBe(422);

    const created = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-create-ok")
      .send(auraCreatePayload());

    expect(created.status).toBe(201);
    expect(created.body.goal.duration_months).toBe(11);
    expect(created.body.goal.scheme_type).toBe("aura");
    expect(created.body.goal.bonus_eligible).toBe(false);
    expect(created.body.goal.installments_total).toBe(11);
    expect(created.body.goal.maturity_date).toBe("2027-06-01");
    expect(created.body.goal.redemption_window_start).toBe("2027-05-29");
    expect(created.body.goal.redemption_window_end).toBe("2027-06-18");
    expect(created.body.goal.mc_waiver_eligible).toBe(false);
  });

  it("locks installment amount after enrollment", async () => {
    const auth = await signIn(app, "+919876543211");
    await verifyUser(auth.userId);

    const created = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-lock-amount")
      .send(auraCreatePayload({ monthly_amount_paise: 100_000 }));

    const goalId = created.body.goal.id as string;

    const wrongAmount = await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-wrong-amount")
      .send({ amount_paise: 50_000 });

    expect(wrongAmount.status).toBe(422);

    const ok = await request(app)
      .post(`/v1/goals/${goalId}/contribute`)
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-correct-amount")
      .send({ amount_paise: 100_000 });

    expect(ok.status).toBe(200);
    expect(ok.body.contribution.status).toBe("completed");
  });

  it("matures after 11 installments without bonus credit", async () => {
    const auth = await signIn(app, "+919876543212");
    await verifyUser(auth.userId);

    const created = await request(app)
      .post("/v1/goals")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .set("Idempotency-Key", "aura-mature")
      .send(auraCreatePayload({ monthly_amount_paise: 50_000 }));

    const goalId = created.body.goal.id as string;

    for (let i = 0; i < 11; i += 1) {
      const response = await request(app)
        .post(`/v1/goals/${goalId}/contribute`)
        .set("Authorization", `Bearer ${auth.accessToken}`)
        .set("Idempotency-Key", `aura-installment-${i}`)
        .send({ amount_paise: 50_000 });

      expect(response.status).toBe(200);
    }

    const goal = await prisma.goal.findUniqueOrThrow({ where: { id: goalId } });
    expect(goal.status).toBe("completed");
    expect(goal.bonusEligible).toBe(false);

    const bonus = await prisma.contribution.findFirst({
      where: { goalId, type: "bonus" },
    });
    expect(bonus).toBeNull();

    const detail = await request(app)
      .get(`/v1/goals/${goalId}`)
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(detail.body.goal.installments_completed).toBe(11);
    expect(detail.body.goal.mc_waiver_eligible).toBe(true);
    expect(detail.body.goal.status_label).toBe("Matured");
  });

  it("activates MC waiver only within the redemption window", async () => {
    const auth = await signIn(app, "+919876543215");
    await verifyUser(auth.userId);

    const today = toDateOnly(new Date());
    const startDate = toDateOnly(addDays(today, -340));

    const goal = await prisma.goal.create({
      data: {
        userId: auth.userId,
        name: "Window Aura Plan",
        schemeType: "aura",
        goalType: "wedding",
        monthlyAmountPaise: 50_000,
        durationMonths: 11,
        startDate,
        nextContributionDate: startDate,
        status: "completed",
        completedAt: today,
        bonusEligible: false,
      },
    });

    for (let i = 0; i < 11; i += 1) {
      await prisma.contribution.create({
        data: {
          goalId: goal.id,
          userId: auth.userId,
          amountPaise: 50_000,
          goldRatePerGramPaise: 624000,
          gramsCredited: "0.0100",
          contributionMonth: toDateOnly(addMonths(startDate, i)),
          type: "manual",
          status: "completed",
          completedAt: today,
        },
      });
    }

    expect(isWithinAuraRedemptionWindow(startDate, today)).toBe(true);

    const detail = await request(app)
      .get(`/v1/goals/${goal.id}`)
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(detail.body.goal.mc_waiver_eligible).toBe(true);
    expect(detail.body.goal.mc_waiver_active).toBe(true);
    expect(detail.body.goal.mc_waiver_max_pct).toBe(100);
  });

  it("discontinues after two consecutive missed months", async () => {
    const auth = await signIn(app, "+919876543213");
    await verifyUser(auth.userId);

    const startDate = toDateOnly(new Date("2026-04-01T00:00:00.000Z"));
    const goal = await prisma.goal.create({
      data: {
        userId: auth.userId,
        name: "Missed Aura Plan",
        schemeType: "aura",
        goalType: "wedding",
        monthlyAmountPaise: 50_000,
        durationMonths: 11,
        startDate,
        nextContributionDate: startDate,
        bonusEligible: false,
      },
    });

    await prisma.goal.update({
      where: { id: goal.id },
      data: {
        nextContributionDate: toDateOnly(addMonths(startDate, -2)),
      },
    });

    const updated = await processContributionDueStatuses();
    expect(updated).toBeGreaterThan(0);

    const refreshed = await prisma.goal.findUniqueOrThrow({
      where: { id: goal.id },
    });
    expect(refreshed.status).toBe("discontinued");
    expect(refreshed.discontinuedReason).toContain("Two consecutive");

    const ledger = await prisma.goldLedgerEntry.findMany({
      where: { userId: auth.userId },
    });
    expect(ledger.length).toBeGreaterThanOrEqual(0);
  });

  it("marks one missed month as installment due", async () => {
    const auth = await signIn(app, "+919876543214");
    await verifyUser(auth.userId);

    const today = toDateOnly(new Date());
    const dueDate = toDateOnly(addMonths(today, -1));
    const startDate = toDateOnly(addMonths(dueDate, -1));
    const goal = await prisma.goal.create({
      data: {
        userId: auth.userId,
        name: "Due Aura Plan",
        schemeType: "aura",
        goalType: "wedding",
        monthlyAmountPaise: 50_000,
        durationMonths: 11,
        startDate,
        nextContributionDate: dueDate,
        bonusEligible: false,
      },
    });

    await processContributionDueStatuses();

    const refreshed = await prisma.goal.findUniqueOrThrow({
      where: { id: goal.id },
    });
    expect(refreshed.status).toBe("contribution_due");
    expect(formatDateOnly(refreshed.nextContributionDate)).toBe(
      formatDateOnly(dueDate),
    );
  });
});

import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";

async function cleanTables() {
  await prisma.planInterest.deleteMany();
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

describe("Plan interest registration", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanTables();
  });

  afterAll(async () => {
    await cleanTables();
    await prisma.$disconnect();
  });

  it("rejects interest registration when app enrollment is live", async () => {
    const auth = await signIn(app, "+919811122233");

    await request(app)
      .post("/v1/plans/interest")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ scheme_type: "crest" })
      .expect(422);

    await request(app)
      .post("/v1/plans/interest")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ scheme_type: "dhanam" })
      .expect(422);
  });

  it("rejects interest registration for Aura (live enrollment)", async () => {
    const auth = await signIn(app, "+919822233344");

    await request(app)
      .post("/v1/plans/interest")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ scheme_type: "aura" })
      .expect(422);
  });

  it("exposes public plan catalog with all schemes enrollable", async () => {
    const response = await request(app).get("/v1/plans/catalog").expect(200);
    expect(response.body.plans).toHaveLength(4);
    expect(response.body.default_scheme_type).toBe("aura");
    for (const plan of response.body.plans) {
      expect(plan.app_enrollment_available).toBe(true);
    }
  });
});

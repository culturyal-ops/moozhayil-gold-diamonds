import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";

async function cleanIdentityTables() {
  await prisma.authSession.deleteMany();
  await prisma.otpSession.deleteMany();
  await prisma.userIntent.deleteMany();
  await prisma.userDevice.deleteMany();
  await prisma.user.deleteMany();
}

describe("Phase 3 auth and users", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.SMS_PROVIDER_MODE = "mock";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    await cleanIdentityTables();
  });

  afterAll(async () => {
    await cleanIdentityTables();
    await prisma.$disconnect();
  });

  it("sends OTP, verifies it, creates a session, and returns user profile", async () => {
    const sendResponse = await request(app)
      .post("/v1/auth/send-otp")
      .send({ phone: "+919876543210" });

    expect(sendResponse.status).toBe(200);
    expect(sendResponse.body).toMatchObject({
      expires_in_seconds: 300,
      resend_allowed_after_seconds: 30,
    });
    expect(sendResponse.body.otp_session_id).toEqual(expect.any(String));

    const verifyResponse = await request(app)
      .post("/v1/auth/verify-otp")
      .send({
        otp_session_id: sendResponse.body.otp_session_id,
        otp: "123456",
      });

    expect(verifyResponse.status).toBe(200);
    expect(verifyResponse.body.access_token).toEqual(expect.any(String));
    expect(verifyResponse.body.refresh_token).toEqual(expect.any(String));
    expect(verifyResponse.body.user).toMatchObject({
      phone: "+919876543210",
      name: null,
      kyc_status: "not_started",
      is_new_user: true,
    });

    const meResponse = await request(app)
      .get("/v1/user/me")
      .set("Authorization", `Bearer ${verifyResponse.body.access_token}`);

    expect(meResponse.status).toBe(200);
    expect(meResponse.body).toMatchObject({
      phone: "+919876543210",
      kyc_status: "not_started",
      kyc_display: "Complete KYC",
      intent_tags: [],
    });
  });

  it("updates profile, stores onboarding intents, and registers a device", async () => {
    const auth = await signIn("+919876543211");

    const profileResponse = await request(app)
      .patch("/v1/user/me")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({
        name: "Priya Menon",
        email: "priya@example.com",
        city: "Thrissur",
      });

    expect(profileResponse.status).toBe(200);
    expect(profileResponse.body).toMatchObject({
      name: "Priya Menon",
      email: "priya@example.com",
      city: "Thrissur",
    });

    const intentResponse = await request(app)
      .post("/v1/user/intent")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({ intents: ["wedding", "investment"] });

    expect(intentResponse.status).toBe(200);
    expect(intentResponse.body).toEqual({
      success: true,
      intents: ["wedding", "investment"],
    });

    const deviceResponse = await request(app)
      .post("/v1/user/devices")
      .set("Authorization", `Bearer ${auth.accessToken}`)
      .send({
        push_token: "fcm_test_token_1234567890",
        platform: "android",
        device_fingerprint: "dfp_01",
        app_version: "1.0.0",
      });

    expect(deviceResponse.status).toBe(200);
    expect(deviceResponse.body).toMatchObject({
      device_id: expect.any(String),
      success: true,
    });

    const meResponse = await request(app)
      .get("/v1/user/me")
      .set("Authorization", `Bearer ${auth.accessToken}`);

    expect(meResponse.body.intent_tags).toEqual(["wedding", "investment"]);
  });

  it("refreshes an access token and revokes the session on logout", async () => {
    const auth = await signIn("+919876543212");

    const refreshResponse = await request(app)
      .post("/v1/auth/refresh")
      .send({ refresh_token: auth.refreshToken });

    expect(refreshResponse.status).toBe(200);
    expect(refreshResponse.body.access_token).toEqual(expect.any(String));

    const logoutResponse = await request(app)
      .post("/v1/auth/logout")
      .set("Authorization", `Bearer ${refreshResponse.body.access_token}`)
      .send({});

    expect(logoutResponse.status).toBe(200);
    expect(logoutResponse.body).toEqual({ success: true });

    const meResponse = await request(app)
      .get("/v1/user/me")
      .set("Authorization", `Bearer ${refreshResponse.body.access_token}`);

    expect(meResponse.status).toBe(401);
    expect(meResponse.body.error.code).toBe("UNAUTHORIZED");
  });

  it("rate limits OTP send requests by phone", async () => {
    const phone = "+919876543213";

    for (let i = 0; i < 3; i += 1) {
      const response = await request(app).post("/v1/auth/send-otp").send({ phone });
      expect(response.status).toBe(200);
    }

    const blockedResponse = await request(app)
      .post("/v1/auth/send-otp")
      .send({ phone });

    expect(blockedResponse.status).toBe(429);
    expect(blockedResponse.body.error.code).toBe("RATE_LIMITED");
  });

  async function signIn(phone: string) {
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
      refreshToken: verifyResponse.body.refresh_token as string,
    };
  }
});

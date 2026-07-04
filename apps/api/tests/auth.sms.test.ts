import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";
import { clearRateLimitBucketsForTests } from "../src/middleware/rate_limit.middleware";

jest.mock("../src/modules/auth/sms.client", () => ({
  sendOtpSms: jest.fn(),
}));

import { sendOtpSms } from "../src/modules/auth/sms.client";

const mockedSendOtpSms = sendOtpSms as jest.MockedFunction<typeof sendOtpSms>;

describe("Auth OTP SMS dispatch", () => {
  const app = createApp();

  beforeAll(() => {
    process.env.NODE_ENV = "test";
    process.env.TEST_OTP_CODE = "123456";
    process.env.SMS_PROVIDER_MODE = "mock";
  });

  beforeEach(async () => {
    clearRateLimitBucketsForTests();
    mockedSendOtpSms.mockReset();
    mockedSendOtpSms.mockResolvedValue(undefined);
    await prisma.otpSession.deleteMany();
  });

  afterAll(async () => {
    await prisma.otpSession.deleteMany();
    await prisma.$disconnect();
  });

  it("returns otp_session_id when mock SMS dispatch succeeds", async () => {
    const response = await request(app)
      .post("/v1/auth/send-otp")
      .send({ phone: "+919876543210" });

    expect(response.status).toBe(200);
    expect(response.body.otp_session_id).toEqual(expect.any(String));
    expect(mockedSendOtpSms).toHaveBeenCalledTimes(1);
    expect(mockedSendOtpSms).toHaveBeenCalledWith({
      phone: "+919876543210",
      otp: "123456",
    });
  });

  it("deletes the session and returns PROVIDER_UNAVAILABLE when SMS dispatch fails", async () => {
    mockedSendOtpSms.mockRejectedValueOnce(new Error("MSG91 unavailable"));

    const response = await request(app)
      .post("/v1/auth/send-otp")
      .send({ phone: "+919876543211" });

    expect(response.status).toBe(503);
    expect(response.body.error).toMatchObject({
      code: "PROVIDER_UNAVAILABLE",
      message: "Could not send verification code. Please try again.",
    });

    const sessions = await prisma.otpSession.count({
      where: { phone: "+919876543211" },
    });
    expect(sessions).toBe(0);
  });
});

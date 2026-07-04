import { z } from "zod";

const indiaPhoneRegex = /^\+91[6-9]\d{9}$/;

export const sendOtpSchema = z.object({
  phone: z.string().regex(indiaPhoneRegex, "Enter a valid Indian phone number"),
});

export const verifyOtpSchema = z.object({
  otp_session_id: z.string().uuid(),
  otp: z.string().regex(/^\d{6}$/, "OTP must be 6 digits"),
});

export const refreshSchema = z.object({
  refresh_token: z.string().min(32),
});

export type SendOtpInput = z.infer<typeof sendOtpSchema>;
export type VerifyOtpInput = z.infer<typeof verifyOtpSchema>;
export type RefreshInput = z.infer<typeof refreshSchema>;

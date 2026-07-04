import { z } from "zod";

export const sendAadhaarOtpSchema = z.object({
  aadhaar_number: z
    .string()
    .regex(/^\d{12}$/, "Aadhaar must be a 12-digit number"),
});

export const verifyAadhaarOtpSchema = z.object({
  session_id: z.string().uuid(),
  otp: z.string().regex(/^\d{6}$/, "OTP must be 6 digits"),
});

export const verifyPanSchema = z.object({
  pan_number: z
    .string()
    .regex(/^[A-Z]{5}\d{4}[A-Z]$/, "PAN must match ABCDE1234F format"),
});

export type SendAadhaarOtpInput = z.infer<typeof sendAadhaarOtpSchema>;
export type VerifyAadhaarOtpInput = z.infer<typeof verifyAadhaarOtpSchema>;
export type VerifyPanInput = z.infer<typeof verifyPanSchema>;

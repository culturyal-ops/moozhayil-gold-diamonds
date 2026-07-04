import { z } from "zod";

export const applyReferralSchema = z.object({
  referral_code: z.string().trim().min(3).max(20),
  device_fingerprint: z.string().trim().max(255).optional(),
});

export type ApplyReferralInput = z.infer<typeof applyReferralSchema>;

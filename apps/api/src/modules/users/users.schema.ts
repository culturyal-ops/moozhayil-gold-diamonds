import { z } from "zod";

export const updateMeSchema = z.object({
  name: z.string().trim().min(2).max(100).optional(),
  email: z.string().email().nullable().optional(),
  city: z.string().trim().max(100).nullable().optional(),
});

export const intentTypeSchema = z.enum([
  "wedding",
  "investment",
  "festival",
  "gift",
  "family",
  "other",
]);

export const saveIntentSchema = z.object({
  intents: z.array(intentTypeSchema).min(1).max(6),
});

export const registerDeviceSchema = z.object({
  push_token: z.string().min(10).max(500),
  platform: z.enum(["ios", "android", "web"]),
  device_fingerprint: z.string().max(255).nullable().optional(),
  app_version: z.string().max(50).nullable().optional(),
});

export type UpdateMeInput = z.infer<typeof updateMeSchema>;
export type SaveIntentInput = z.infer<typeof saveIntentSchema>;
export type RegisterDeviceInput = z.infer<typeof registerDeviceSchema>;

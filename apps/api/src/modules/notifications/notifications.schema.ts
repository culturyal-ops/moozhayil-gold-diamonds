import { z } from "zod";

export const listNotificationsQuerySchema = z.object({
  unread_only: z
    .enum(["true", "false"])
    .optional()
    .transform((value) => value === "true"),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(50).default(20),
});

export const updatePreferencesSchema = z.object({
  push_enabled: z.boolean().optional(),
  contributions_enabled: z.boolean().optional(),
  milestones_enabled: z.boolean().optional(),
  orders_enabled: z.boolean().optional(),
  kyc_enabled: z.boolean().optional(),
  aura_enabled: z.boolean().optional(),
  gold_rate_alert_enabled: z.boolean().optional(),
});

export type ListNotificationsQuery = z.infer<typeof listNotificationsQuerySchema>;
export type UpdatePreferencesInput = z.infer<typeof updatePreferencesSchema>;

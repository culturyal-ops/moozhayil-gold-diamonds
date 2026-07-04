import { z } from "zod";

export const auraPlanSchema = z.object({
  occasion: z.string().trim().min(1).max(100),
  target_date: z.string().regex(/^\d{4}-\d{2}-\d{2}$/),
  budget_paise: z.number().int().positive(),
});

export const auraDiscoverSchema = z.object({
  for_person: z.enum(["self", "partner", "parent", "child", "friend"]),
  occasion: z.string().trim().min(1).max(100),
  budget_paise: z.number().int().positive(),
});

export const createAuraSessionSchema = z.object({
  flow_type: z.enum(["goal_planning", "product_discovery", "gold_insights", "chat"]),
});

export const auraMessageSchema = z.object({
  message: z.string().trim().min(1).max(500),
  context: z
    .object({
      current_goal_id: z.string().uuid().nullable().optional(),
      viewing_product_id: z.string().uuid().nullable().optional(),
    })
    .optional(),
});

export type AuraPlanInput = z.infer<typeof auraPlanSchema>;
export type AuraDiscoverInput = z.infer<typeof auraDiscoverSchema>;
export type CreateAuraSessionInput = z.infer<typeof createAuraSessionSchema>;
export type AuraMessageInput = z.infer<typeof auraMessageSchema>;

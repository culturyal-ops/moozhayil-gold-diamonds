import { z } from "zod";
import { SCHEME_TYPES } from "../../config/schemes.constants";

export const registerPlanInterestSchema = z.object({
  scheme_type: z.enum(SCHEME_TYPES),
});

export const adminPlanInterestListSchema = z.object({
  scheme_type: z.enum(SCHEME_TYPES).optional(),
  limit: z.coerce.number().int().min(1).max(100).default(50),
  cursor: z.string().uuid().optional(),
});

import { z } from "zod";
import { createGoalSchema } from "../goals/goals.schema";

export const rejectKycSchema = z.object({
  reason: z.string().min(5).max(500),
});

export type RejectKycInput = z.infer<typeof rejectKycSchema>;

export const adminLoginSchema = z.object({
  email: z.string().email(),
  password: z.string().min(8),
});

export type AdminLoginInput = z.infer<typeof adminLoginSchema>;

export const adminStepUpSchema = z.object({
  password: z.string().min(8),
});

export const auditLogQuerySchema = z.object({
  actor_type: z.enum(["admin", "user", "system"]).optional(),
  action: z.string().optional(),
  entity_type: z.string().optional(),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(100).default(50),
});

export type AuditLogQueryInput = z.infer<typeof auditLogQuerySchema>;

export const adminOrderListSchema = z.object({
  status: z
    .enum([
      "draft",
      "pending_payment",
      "confirmed",
      "processing",
      "shipped",
      "delivered",
      "delivery_failed",
      "cancelled",
      "refund_initiated",
      "refunded",
    ])
    .optional(),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(100).default(25),
});

export type AdminOrderListInput = z.infer<typeof adminOrderListSchema>;

export const adminOrderStatusSchema = z.object({
  status: z.enum([
    "processing",
    "shipped",
    "delivered",
    "delivery_failed",
    "cancelled",
  ]),
  reason: z.string().max(500).optional(),
  tracking: z.string().max(500).optional(),
});

export type AdminOrderStatusInput = z.infer<typeof adminOrderStatusSchema>;

export const adminOrderRefundSchema = z.object({
  reason: z.string().min(5).max(500).optional(),
});

export type AdminOrderRefundInput = z.infer<typeof adminOrderRefundSchema>;

export const goldRateOverrideSchema = z.object({
  purity: z.enum(["14k", "18k", "22k", "24k"]),
  rate_per_gram_paise: z.number().int().positive(),
  reason: z.string().min(5).max(500),
});

export type GoldRateOverrideInput = z.infer<typeof goldRateOverrideSchema>;

export const adminProductListSchema = z.object({
  published_only: z.coerce.boolean().optional(),
  featured_only: z.coerce.boolean().optional(),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(100).default(25),
});

export type AdminProductListInput = z.infer<typeof adminProductListSchema>;

export const adminProductCreateSchema = z.object({
  sku: z.string().min(1).max(50),
  name: z.string().min(1).max(255),
  description: z.string().optional(),
  category_id: z.string().uuid(),
  collection_id: z.string().uuid().optional(),
  purity: z.enum(["14k", "18k", "22k", "24k"]),
  weight_grams: z.string().regex(/^\d+(\.\d{1,4})?$/),
  making_charge_pct: z.string().regex(/^\d+(\.\d{1,2})?$/),
  wastage_pct: z.string().regex(/^\d+(\.\d{1,2})?$/).optional(),
  stone_value_paise: z.number().int().nonnegative().optional(),
  gst_pct: z.string().regex(/^\d+(\.\d{1,2})?$/).optional(),
  stock_quantity: z.number().int().nonnegative().optional(),
  is_featured: z.boolean().optional(),
});

export type AdminProductCreateInput = z.infer<typeof adminProductCreateSchema>;

export const adminProductUpdateSchema = adminProductCreateSchema
  .partial()
  .omit({ sku: true });

export type AdminProductUpdateInput = z.infer<typeof adminProductUpdateSchema>;

export const adminProductImageSchema = z.object({
  s3_key: z.string().min(1).max(1000),
  cdn_url: z.string().url().max(1000),
  type: z.enum(["white_background", "on_model", "detail", "lifestyle"]),
  sort_order: z.number().int().nonnegative().optional(),
  is_primary: z.boolean().optional(),
});

export type AdminProductImageInput = z.infer<typeof adminProductImageSchema>;

export const adminCatalogCreateSchema = z.object({
  name: z.string().min(1).max(255),
  slug: z.string().min(1).max(255),
  parent_id: z.string().uuid().optional(),
  icon_url: z.string().url().max(1000).optional(),
  image_url: z.string().url().max(1000).optional(),
  sort_order: z.number().int().optional(),
  is_active: z.boolean().optional(),
  description: z.string().optional(),
  is_featured: z.boolean().optional(),
});

export type AdminCatalogCreateInput = z.infer<typeof adminCatalogCreateSchema>;

export const adminCatalogUpdateSchema = adminCatalogCreateSchema.partial();

export type AdminCatalogUpdateInput = z.infer<typeof adminCatalogUpdateSchema>;

export const adminBannerCreateSchema = z.object({
  title: z.string().min(1).max(255),
  image_url: z.string().url().max(1000),
  cta_label: z.string().max(100).optional(),
  cta_route: z.string().max(500).optional(),
  placement: z.string().min(1).max(50),
  sort_order: z.number().int().optional(),
  valid_from: z.string().datetime().optional(),
  valid_to: z.string().datetime().optional(),
  is_active: z.boolean().optional(),
});

export type AdminBannerCreateInput = z.infer<typeof adminBannerCreateSchema>;

export const adminBannerUpdateSchema = adminBannerCreateSchema.partial();

export type AdminBannerUpdateInput = z.infer<typeof adminBannerUpdateSchema>;

export const ledgerAdjustmentCreateSchema = z.object({
  user_id: z.string().uuid(),
  grams_delta: z.string().regex(/^-?\d+(\.\d{1,4})?$/),
  amount_paise: z.number().int().optional(),
  reason: z.string().min(5).max(500),
});

export const sarReviewDecisionSchema = z.object({
  decision: z.enum(["approved", "rejected"]),
  reason: z.string().max(500).optional(),
});

export const inventoryStockUpdateSchema = z.object({
  stock_quantity: z.number().int().nonnegative(),
  reason: z.string().min(5).max(500),
});

export const adminUserListSchema = z.object({
  query: z.string().optional(),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(100).default(25),
});

const indiaPhoneRegex = /^\+91[6-9]\d{9}$/;

export const adminUserCreateSchema = z.object({
  phone: z.string().regex(indiaPhoneRegex, "Enter a valid Indian phone number"),
  name: z.string().trim().min(1).max(100),
  email: z.string().email().max(255).optional(),
  city: z.string().trim().max(100).optional(),
});

export type AdminUserCreateInput = z.infer<typeof adminUserCreateSchema>;

export const adminGoalCreateSchema = createGoalSchema;

export const adminShowroomPaymentSchema = z.object({
  amount_paise: z.number().int().positive(),
  payment_channel: z.enum(["cash", "upi", "bank_transfer", "cheque", "other"]),
  reference_number: z.string().trim().max(100).optional(),
  remarks: z.string().trim().max(500).optional(),
});

export type AdminShowroomPaymentInput = z.infer<typeof adminShowroomPaymentSchema>;

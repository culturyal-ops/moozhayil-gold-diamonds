import { z } from "zod";

export const puritySchema = z.enum(["14k", "18k", "22k", "24k"]);

export const productListSchema = z.object({
  category_id: z.string().uuid().optional(),
  collection_id: z.string().uuid().optional(),
  occasion_id: z.string().uuid().optional(),
  purity: puritySchema.optional(),
  min_price_paise: z.coerce.number().int().nonnegative().optional(),
  max_price_paise: z.coerce.number().int().nonnegative().optional(),
  search: z.string().trim().min(2).max(80).optional(),
  is_featured: z.coerce.boolean().optional(),
  sort: z
    .enum(["newest", "price_asc", "price_desc", "most_loved", "weight_asc"])
    .default("newest"),
  cursor: z.string().uuid().optional(),
  limit: z.coerce.number().int().min(1).max(50).default(20),
});

export const searchSchema = z.object({
  q: z.string().trim().min(2).max(80),
  limit: z.coerce.number().int().min(1).max(20).default(10),
});

export const similarSchema = z.object({
  limit: z.coerce.number().int().min(1).max(10).default(5),
});

export type ProductListInput = z.infer<typeof productListSchema>;
export type ProductSearchInput = z.infer<typeof searchSchema>;
export type SimilarProductsInput = z.infer<typeof similarSchema>;

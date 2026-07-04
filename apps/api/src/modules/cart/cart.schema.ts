import { z } from "zod";

export const addCartItemSchema = z.object({
  product_id: z.string().uuid(),
  quantity: z.coerce.number().int().min(1).max(1).default(1),
});

export type AddCartItemInput = z.infer<typeof addCartItemSchema>;

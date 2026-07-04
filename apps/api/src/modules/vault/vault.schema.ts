import { z } from "zod";

export const addVaultItemSchema = z.object({
  product_id: z.string().uuid(),
});

export type AddVaultItemInput = z.infer<typeof addVaultItemSchema>;

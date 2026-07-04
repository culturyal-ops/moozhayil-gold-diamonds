import { z } from "zod";

const phoneSchema = z
  .string()
  .regex(/^\+91[6-9]\d{9}$/, "Phone must be a valid Indian mobile number");

const pincodeSchema = z.string().regex(/^\d{6}$/, "Pincode must be 6 digits");

export const createAddressSchema = z.object({
  label: z.string().trim().max(50).optional(),
  full_name: z.string().trim().min(1).max(100),
  phone: phoneSchema,
  line1: z.string().trim().min(1).max(255),
  line2: z.string().trim().max(255).optional(),
  city: z.string().trim().min(1).max(100),
  state: z.string().trim().min(1).max(100),
  pincode: pincodeSchema,
});

export const updateAddressSchema = createAddressSchema.partial();

export const validatePincodeSchema = z.object({
  pincode: pincodeSchema,
});

export type CreateAddressInput = z.infer<typeof createAddressSchema>;
export type UpdateAddressInput = z.infer<typeof updateAddressSchema>;

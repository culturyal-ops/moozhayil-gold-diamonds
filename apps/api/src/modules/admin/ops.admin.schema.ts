import { z } from "zod";

export const adminPincodeCreateSchema = z.object({
  pincode: z.string().regex(/^\d{6}$/),
  city: z.string().min(1).max(100),
  state: z.string().min(1).max(100),
  serviceable: z.boolean().default(true),
  estimated_delivery_days: z.number().int().positive().optional(),
  pickup_available: z.boolean().default(true),
});

export const adminPincodeImportSchema = z.object({
  pincodes: z.array(adminPincodeCreateSchema).min(1).max(5000),
});

export const openingHoursSchema = z.record(
  z.string(),
  z.object({
    open: z.string(),
    close: z.string(),
    closed: z.boolean().optional(),
  }),
);

export const adminStoreCreateSchema = z.object({
  name: z.string().min(1).max(255),
  address: z.string().min(1),
  city: z.string().min(1).max(100),
  state: z.string().min(1).max(100),
  pincode: z.string().regex(/^\d{6}$/),
  phone: z.string().min(10).max(15),
  latitude: z.number(),
  longitude: z.number(),
  opening_hours: openingHoursSchema,
  is_active: z.boolean().default(true),
});

export const adminStoreUpdateSchema = adminStoreCreateSchema.partial();

export type AdminPincodeCreateInput = z.infer<typeof adminPincodeCreateSchema>;
export type AdminPincodeImportInput = z.infer<typeof adminPincodeImportSchema>;
export type AdminStoreCreateInput = z.infer<typeof adminStoreCreateSchema>;
export type AdminStoreUpdateInput = z.infer<typeof adminStoreUpdateSchema>;

import { z } from "zod";

export const listStoresQuerySchema = z.object({
  lat: z.coerce.number().optional(),
  lng: z.coerce.number().optional(),
  radius_km: z.coerce.number().positive().max(500).optional(),
  q: z.string().trim().min(1).max(100).optional(),
});

export type ListStoresQuery = z.infer<typeof listStoresQuerySchema>;

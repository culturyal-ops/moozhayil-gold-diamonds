import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import type {
  AdminPincodeCreateInput,
  AdminPincodeImportInput,
  AdminStoreCreateInput,
  AdminStoreUpdateInput,
} from "./ops.admin.schema";

export class OpsAdminService {
  async listServiceablePincodes() {
    const rows = await prisma.serviceablePincode.findMany({
      orderBy: { pincode: "asc" },
    });

    return {
      pincodes: rows.map((row) => ({
        id: row.id,
        pincode: row.pincode,
        city: row.city,
        state: row.state,
        serviceable: row.serviceable,
        estimated_delivery_days: row.estimatedDeliveryDays,
        pickup_available: row.pickupAvailable,
      })),
    };
  }

  async createServiceablePincode(input: AdminPincodeCreateInput) {
    const row = await prisma.serviceablePincode.create({
      data: {
        pincode: input.pincode,
        city: input.city,
        state: input.state,
        serviceable: input.serviceable,
        estimatedDeliveryDays: input.estimated_delivery_days,
        pickupAvailable: input.pickup_available,
      },
    });

    return { pincode: row };
  }

  async importServiceablePincodes(input: AdminPincodeImportInput) {
    let created = 0;
    let updated = 0;

    for (const item of input.pincodes) {
      const existing = await prisma.serviceablePincode.findUnique({
        where: { pincode: item.pincode },
      });

      if (existing) {
        await prisma.serviceablePincode.update({
          where: { id: existing.id },
          data: {
            city: item.city,
            state: item.state,
            serviceable: item.serviceable,
            estimatedDeliveryDays: item.estimated_delivery_days,
            pickupAvailable: item.pickup_available,
          },
        });
        updated += 1;
      } else {
        await prisma.serviceablePincode.create({
          data: {
            pincode: item.pincode,
            city: item.city,
            state: item.state,
            serviceable: item.serviceable,
            estimatedDeliveryDays: item.estimated_delivery_days,
            pickupAvailable: item.pickup_available,
          },
        });
        created += 1;
      }
    }

    return { created, updated, total: input.pincodes.length };
  }

  async deleteServiceablePincode(id: string) {
    await prisma.serviceablePincode.delete({ where: { id } });
    return { success: true };
  }

  async listStoreLocations() {
    const rows = await prisma.storeLocation.findMany({
      orderBy: { name: "asc" },
    });

    return {
      stores: rows.map((row) => ({
        id: row.id,
        name: row.name,
        address: row.address,
        city: row.city,
        state: row.state,
        pincode: row.pincode,
        phone: row.phone,
        latitude: Number(row.latitude),
        longitude: Number(row.longitude),
        opening_hours: row.openingHours,
        is_active: row.isActive,
      })),
    };
  }

  async createStoreLocation(input: AdminStoreCreateInput) {
    const row = await prisma.storeLocation.create({
      data: {
        name: input.name,
        address: input.address,
        city: input.city,
        state: input.state,
        pincode: input.pincode,
        phone: input.phone,
        latitude: input.latitude,
        longitude: input.longitude,
        openingHours: input.opening_hours,
        isActive: input.is_active,
      },
    });

    return { store: row };
  }

  async updateStoreLocation(id: string, input: AdminStoreUpdateInput) {
    const existing = await prisma.storeLocation.findUnique({ where: { id } });
    if (!existing) {
      throw new AppError(404, "NOT_FOUND", "Store location does not exist");
    }

    const row = await prisma.storeLocation.update({
      where: { id },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.address !== undefined ? { address: input.address } : {}),
        ...(input.city !== undefined ? { city: input.city } : {}),
        ...(input.state !== undefined ? { state: input.state } : {}),
        ...(input.pincode !== undefined ? { pincode: input.pincode } : {}),
        ...(input.phone !== undefined ? { phone: input.phone } : {}),
        ...(input.latitude !== undefined ? { latitude: input.latitude } : {}),
        ...(input.longitude !== undefined ? { longitude: input.longitude } : {}),
        ...(input.opening_hours !== undefined
          ? { openingHours: input.opening_hours }
          : {}),
        ...(input.is_active !== undefined ? { isActive: input.is_active } : {}),
      },
    });

    return { store: row };
  }
}

export const opsAdminService = new OpsAdminService();

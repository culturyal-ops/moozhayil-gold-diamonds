import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import type { CreateAddressInput, UpdateAddressInput } from "./addresses.schema";

function addressDto(address: {
  id: string;
  label: string | null;
  fullName: string;
  phone: string;
  line1: string;
  line2: string | null;
  city: string;
  state: string;
  pincode: string;
  isDefault: boolean;
}) {
  return {
    id: address.id,
    label: address.label,
    full_name: address.fullName,
    phone: address.phone,
    line1: address.line1,
    line2: address.line2,
    city: address.city,
    state: address.state,
    pincode: address.pincode,
    is_default: address.isDefault,
  };
}

export class AddressesService {
  async list(userId: string) {
    const addresses = await prisma.address.findMany({
      where: { userId, deletedAt: null },
      orderBy: [{ isDefault: "desc" }, { createdAt: "desc" }],
    });

    return { addresses: addresses.map(addressDto) };
  }

  async create(userId: string, input: CreateAddressInput) {
    await this.ensureServiceablePincode(input.pincode);

    const isFirst = (await prisma.address.count({
      where: { userId, deletedAt: null },
    })) === 0;

    const address = await prisma.address.create({
      data: {
        userId,
        label: input.label,
        fullName: input.full_name,
        phone: input.phone,
        line1: input.line1,
        line2: input.line2,
        city: input.city,
        state: input.state,
        pincode: input.pincode,
        isDefault: isFirst,
      },
    });

    return addressDto(address);
  }

  async update(userId: string, addressId: string, input: UpdateAddressInput) {
    const existing = await prisma.address.findFirst({
      where: { id: addressId, userId, deletedAt: null },
    });

    if (!existing) {
      throw new AppError(404, "NOT_FOUND", "Address does not exist");
    }

    if (input.pincode) {
      await this.ensureServiceablePincode(input.pincode);
    }

    const address = await prisma.address.update({
      where: { id: addressId },
      data: {
        ...(input.label !== undefined ? { label: input.label } : {}),
        ...(input.full_name !== undefined ? { fullName: input.full_name } : {}),
        ...(input.phone !== undefined ? { phone: input.phone } : {}),
        ...(input.line1 !== undefined ? { line1: input.line1 } : {}),
        ...(input.line2 !== undefined ? { line2: input.line2 } : {}),
        ...(input.city !== undefined ? { city: input.city } : {}),
        ...(input.state !== undefined ? { state: input.state } : {}),
        ...(input.pincode !== undefined ? { pincode: input.pincode } : {}),
      },
    });

    return addressDto(address);
  }

  async remove(userId: string, addressId: string) {
    const existing = await prisma.address.findFirst({
      where: { id: addressId, userId, deletedAt: null },
    });

    if (!existing) {
      throw new AppError(404, "NOT_FOUND", "Address does not exist");
    }

    await prisma.address.update({
      where: { id: addressId },
      data: { deletedAt: new Date() },
    });

    return { success: true };
  }

  async validatePincode(pincode: string) {
    const record = await prisma.serviceablePincode.findUnique({
      where: { pincode },
    });

    if (!record || !record.serviceable) {
      return {
        serviceable: false,
        city: null,
        state: null,
        estimated_delivery_days: null,
        pickup_available: false,
      };
    }

    return {
      serviceable: true,
      city: record.city,
      state: record.state,
      estimated_delivery_days: record.estimatedDeliveryDays,
      pickup_available: record.pickupAvailable,
    };
  }

  private async ensureServiceablePincode(pincode: string) {
    const result = await this.validatePincode(pincode);
    if (!result.serviceable) {
      throw new AppError(400, "BAD_REQUEST", "Pincode is not serviceable");
    }
  }
}

export const addressesService = new AddressesService();

import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import {
  createAddressSchema,
  updateAddressSchema,
  validatePincodeSchema,
} from "./addresses.schema";
import { addressesService } from "./addresses.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class AddressesController {
  async list(req: Request, res: Response): Promise<void> {
    res.status(200).json(await addressesService.list(requireUserId(req)));
  }

  async create(req: Request, res: Response): Promise<void> {
    const input = createAddressSchema.parse(req.body);
    res.status(201).json(await addressesService.create(requireUserId(req), input));
  }

  async update(req: Request, res: Response): Promise<void> {
    const addressId = z.string().uuid().parse(req.params.id);
    const input = updateAddressSchema.parse(req.body);
    res.status(200).json(await addressesService.update(requireUserId(req), addressId, input));
  }

  async remove(req: Request, res: Response): Promise<void> {
    const addressId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await addressesService.remove(requireUserId(req), addressId));
  }

  async validatePincode(req: Request, res: Response): Promise<void> {
    const input = validatePincodeSchema.parse(req.body);
    res.status(200).json(await addressesService.validatePincode(input.pincode));
  }
}

export const addressesController = new AddressesController();

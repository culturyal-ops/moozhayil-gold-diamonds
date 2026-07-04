import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import {
  registerDeviceSchema,
  saveIntentSchema,
  updateMeSchema,
} from "./users.schema";
import { usersService } from "./users.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class UsersController {
  async getMe(req: Request, res: Response): Promise<void> {
    const result = await usersService.getMe(requireUserId(req));
    res.status(200).json(result);
  }

  async updateMe(req: Request, res: Response): Promise<void> {
    const input = updateMeSchema.parse(req.body);
    const result = await usersService.updateMe(requireUserId(req), input);
    res.status(200).json(result);
  }

  async saveIntent(req: Request, res: Response): Promise<void> {
    const input = saveIntentSchema.parse(req.body);
    const result = await usersService.saveIntents(requireUserId(req), input);
    res.status(200).json(result);
  }

  async registerDevice(req: Request, res: Response): Promise<void> {
    const input = registerDeviceSchema.parse(req.body);
    const result = await usersService.registerDevice(requireUserId(req), input);
    res.status(200).json(result);
  }

  async deleteDevice(req: Request, res: Response): Promise<void> {
    const deviceId = z.string().uuid().parse(req.params.deviceId);
    const result = await usersService.deleteDevice(requireUserId(req), deviceId);
    res.status(200).json(result);
  }
}

export const usersController = new UsersController();

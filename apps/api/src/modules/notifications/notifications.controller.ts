import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import {
  listNotificationsQuerySchema,
  updatePreferencesSchema,
} from "./notifications.schema";
import { notificationsService } from "./notifications.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class NotificationsController {
  async list(req: Request, res: Response): Promise<void> {
    const query = listNotificationsQuerySchema.parse(req.query);
    res.status(200).json(
      await notificationsService.list(requireUserId(req), query),
    );
  }

  async markRead(req: Request, res: Response): Promise<void> {
    const notificationId = z.string().uuid().parse(req.params.id);
    res.status(200).json(
      await notificationsService.markRead(requireUserId(req), notificationId),
    );
  }

  async markAllRead(req: Request, res: Response): Promise<void> {
    res.status(200).json(await notificationsService.markAllRead(requireUserId(req)));
  }

  async getPreferences(req: Request, res: Response): Promise<void> {
    res.status(200).json(
      await notificationsService.getPreferences(requireUserId(req)),
    );
  }

  async updatePreferences(req: Request, res: Response): Promise<void> {
    const input = updatePreferencesSchema.parse(req.body);
    res.status(200).json(
      await notificationsService.updatePreferences(requireUserId(req), input),
    );
  }
}

export const notificationsController = new NotificationsController();

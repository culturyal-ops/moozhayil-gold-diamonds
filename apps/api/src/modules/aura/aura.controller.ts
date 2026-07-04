import type { Request, Response } from "express";
import { z } from "zod";
import { AppError } from "../../middleware/error.middleware";
import {
  auraDiscoverSchema,
  auraMessageSchema,
  auraPlanSchema,
  createAuraSessionSchema,
} from "./aura.schema";
import { auraService } from "./aura.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class AuraController {
  async insight(req: Request, res: Response): Promise<void> {
    res.status(200).json(await auraService.insight(requireUserId(req)));
  }

  async plan(req: Request, res: Response): Promise<void> {
    const input = auraPlanSchema.parse(req.body);
    res.status(200).json(await auraService.plan(requireUserId(req), input));
  }

  async discover(req: Request, res: Response): Promise<void> {
    const input = auraDiscoverSchema.parse(req.body);
    res.status(200).json(await auraService.discover(requireUserId(req), input));
  }

  async createSession(req: Request, res: Response): Promise<void> {
    const input = createAuraSessionSchema.parse(req.body);
    res.status(201).json(await auraService.createSession(requireUserId(req), input));
  }

  async postMessage(req: Request, res: Response): Promise<void> {
    const sessionId = z.string().uuid().parse(req.params.sessionId);
    const input = auraMessageSchema.parse(req.body);
    res.status(200).json(
      await auraService.postMessage(requireUserId(req), sessionId, input),
    );
  }
}

export const auraController = new AuraController();

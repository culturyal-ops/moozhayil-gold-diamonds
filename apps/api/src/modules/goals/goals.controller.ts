import type { Request, Response } from "express";
import { z } from "zod";
import type { KycStatus } from "@prisma/client";
import { AppError } from "../../middleware/error.middleware";
import {
  contributeSchema,
  createGoalSchema,
  listGoalsQuerySchema,
  patchGoalSchema,
} from "./goals.schema";
import { goalsService } from "./goals.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

function requireKycStatus(req: Request): KycStatus {
  return req.user?.kycStatus as KycStatus;
}

function requireIdempotencyKey(req: Request): string {
  const key = req.header("idempotency-key");
  if (!key?.trim()) {
    throw new AppError(
      400,
      "BAD_REQUEST",
      "Idempotency-Key header is required",
    );
  }

  return key.trim();
}

export class GoalsController {
  async list(req: Request, res: Response): Promise<void> {
    const query = listGoalsQuerySchema.parse(req.query);
    res.status(200).json(await goalsService.list(requireUserId(req), query));
  }

  async create(req: Request, res: Response): Promise<void> {
    const input = createGoalSchema.parse(req.body);
    res.status(201).json(
      await goalsService.create(
        requireUserId(req),
        requireKycStatus(req),
        input,
        requireIdempotencyKey(req),
      ),
    );
  }

  async getById(req: Request, res: Response): Promise<void> {
    const goalId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await goalsService.getById(requireUserId(req), goalId));
  }

  async patch(req: Request, res: Response): Promise<void> {
    const goalId = z.string().uuid().parse(req.params.id);
    const input = patchGoalSchema.parse(req.body);
    res.status(200).json(await goalsService.patch(requireUserId(req), goalId, input));
  }

  async remove(req: Request, res: Response): Promise<void> {
    const goalId = z.string().uuid().parse(req.params.id);
    res.status(200).json(await goalsService.cancel(requireUserId(req), goalId));
  }

  async contribute(req: Request, res: Response): Promise<void> {
    const goalId = z.string().uuid().parse(req.params.id);
    const input = contributeSchema.parse(req.body);
    res.status(200).json(
      await goalsService.contribute(
        requireUserId(req),
        requireKycStatus(req),
        goalId,
        input,
        requireIdempotencyKey(req),
      ),
    );
  }
}

export const goalsController = new GoalsController();

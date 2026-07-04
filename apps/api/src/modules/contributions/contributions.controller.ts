import type { Request, Response } from "express";
import { AppError } from "../../middleware/error.middleware";
import { contributionsService } from "./contributions.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class ContributionsController {
  async listPending(req: Request, res: Response): Promise<void> {
    res
      .status(200)
      .json(await contributionsService.listPending(requireUserId(req)));
  }
}

export const contributionsController = new ContributionsController();

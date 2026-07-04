import type { Request, Response } from "express";
import { AppError } from "../../middleware/error.middleware";
import { registerPlanInterestSchema } from "./plans.schema";
import { plansService } from "./plans.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export const plansController = {
  catalog(_req: Request, res: Response) {
    res.json(plansService.catalog());
  },

  async registerInterest(req: Request, res: Response) {
    const body = registerPlanInterestSchema.parse(req.body);
    const result = await plansService.registerInterest(
      requireUserId(req),
      body.scheme_type,
    );
    res.status(201).json(result);
  },

  async myInterests(req: Request, res: Response) {
    const result = await plansService.listMyInterests(requireUserId(req));
    res.json(result);
  },
};

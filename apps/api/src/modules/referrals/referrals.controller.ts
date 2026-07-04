import type { Request, Response } from "express";
import { AppError } from "../../middleware/error.middleware";
import { applyReferralSchema } from "./referrals.schema";
import { referralsService } from "./referrals.service";

function requireUserId(req: Request): string {
  if (!req.user) {
    throw new AppError(401, "UNAUTHORIZED", "Missing access token");
  }

  return req.user.userId;
}

export class ReferralsController {
  async myCode(req: Request, res: Response): Promise<void> {
    res.status(200).json(await referralsService.getMyCode(requireUserId(req)));
  }

  async apply(req: Request, res: Response): Promise<void> {
    const input = applyReferralSchema.parse(req.body);
    res.status(200).json(
      await referralsService.apply(
        requireUserId(req),
        input.referral_code,
        input.device_fingerprint,
      ),
    );
  }

  async history(req: Request, res: Response): Promise<void> {
    res.status(200).json(await referralsService.listHistory(requireUserId(req)));
  }
}

export const referralsController = new ReferralsController();

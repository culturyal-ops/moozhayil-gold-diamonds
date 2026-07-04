import type { Request, Response } from "express";
import { AppError } from "../../middleware/error.middleware";
import { authService } from "./auth.service";
import { refreshSchema, sendOtpSchema, verifyOtpSchema } from "./auth.schema";

export class AuthController {
  async sendOtp(req: Request, res: Response): Promise<void> {
    const input = sendOtpSchema.parse(req.body);
    const result = await authService.sendOtp(input);
    res.status(200).json(result);
  }

  async verifyOtp(req: Request, res: Response): Promise<void> {
    const input = verifyOtpSchema.parse(req.body);
    const result = await authService.verifyOtp(input);
    res.status(200).json(result);
  }

  async refresh(req: Request, res: Response): Promise<void> {
    const input = refreshSchema.parse(req.body);
    const result = await authService.refresh(input);
    res.status(200).json(result);
  }

  async logout(req: Request, res: Response): Promise<void> {
    if (!req.user) {
      throw new AppError(401, "UNAUTHORIZED", "Missing access token");
    }

    const result = await authService.logout(req.user.sessionId);
    res.status(200).json(result);
  }
}

export const authController = new AuthController();

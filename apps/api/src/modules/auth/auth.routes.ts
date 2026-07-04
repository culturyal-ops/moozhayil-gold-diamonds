import { Router } from "express";
import { authenticate } from "./auth.middleware";
import { authController } from "./auth.controller";
import { rateLimit } from "../../middleware/rate_limit.middleware";

export const authRouter = Router();

const sendOtpLimiter = rateLimit({
  windowMs: 10 * 60 * 1000,
  max: 3,
  keyGenerator: (req) => `send-otp:${String(req.body?.phone ?? req.ip)}`,
});

const verifyOtpLimiter = rateLimit({
  windowMs: 10 * 60 * 1000,
  max: 5,
  keyGenerator: (req) =>
    `verify-otp:${String(req.body?.otp_session_id ?? req.ip)}`,
});

authRouter.post("/send-otp", sendOtpLimiter, (req, res, next) => {
  void authController.sendOtp(req, res).catch(next);
});

authRouter.post("/verify-otp", verifyOtpLimiter, (req, res, next) => {
  void authController.verifyOtp(req, res).catch(next);
});

authRouter.post("/refresh", (req, res, next) => {
  void authController.refresh(req, res).catch(next);
});

authRouter.post("/logout", authenticate, (req, res, next) => {
  void authController.logout(req, res).catch(next);
});

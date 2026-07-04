import jwt from "jsonwebtoken";
import type { NextFunction, Request, Response } from "express";
import { loadEnv } from "../config/env";
import { AppError } from "./error.middleware";

interface StepUpPayload {
  admin_id: string;
  step_up: true;
}

function isStepUpPayload(value: unknown): value is StepUpPayload {
  if (!value || typeof value !== "object") {
    return false;
  }

  const payload = value as Record<string, unknown>;
  return (
    typeof payload.admin_id === "string" && payload.step_up === true
  );
}

export function requireAdminStepUp(
  req: Request,
  _res: Response,
  next: NextFunction,
): void {
  if (!req.admin) {
    next(new AppError(401, "UNAUTHORIZED", "Missing admin access token"));
    return;
  }

  const token = req.header("x-admin-step-up");
  if (!token) {
    next(new AppError(403, "FORBIDDEN", "Step-up authentication required"));
    return;
  }

  try {
    const decoded = jwt.verify(token, loadEnv().ADMIN_JWT_SECRET);
    if (
      !isStepUpPayload(decoded) ||
      decoded.admin_id !== req.admin.adminId
    ) {
      next(new AppError(403, "FORBIDDEN", "Invalid step-up token"));
      return;
    }

    next();
  } catch {
    next(new AppError(403, "FORBIDDEN", "Invalid step-up token"));
  }
}

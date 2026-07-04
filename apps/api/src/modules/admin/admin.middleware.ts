import jwt from "jsonwebtoken";
import type { AdminRole } from "@prisma/client";
import type { NextFunction, Request, Response } from "express";
import { prisma } from "../../db/prisma";
import { ADMIN_SESSION_TTL, ADMIN_STEP_UP_TTL } from "../../config/admin.constants";
import { loadEnv } from "../../config/env";
import { AppError } from "../../middleware/error.middleware";

export interface AuthenticatedAdmin {
  adminId: string;
  role: AdminRole;
}

declare module "express-serve-static-core" {
  interface Request {
    admin?: AuthenticatedAdmin;
  }
}

interface AdminTokenPayload {
  admin_id: string;
  role: AdminRole;
}

function isAdminTokenPayload(value: unknown): value is AdminTokenPayload {
  if (!value || typeof value !== "object") {
    return false;
  }

  const payload = value as Record<string, unknown>;
  return (
    typeof payload.admin_id === "string" && typeof payload.role === "string"
  );
}

export function signAdminToken(adminId: string, role: AdminRole): string {
  return jwt.sign({ admin_id: adminId, role }, loadEnv().ADMIN_JWT_SECRET, {
    expiresIn: ADMIN_SESSION_TTL,
  });
}

export function signAdminStepUpToken(adminId: string): string {
  return jwt.sign({ admin_id: adminId, step_up: true }, loadEnv().ADMIN_JWT_SECRET, {
    expiresIn: ADMIN_STEP_UP_TTL,
  });
}

export async function authenticateAdmin(
  req: Request,
  _res: Response,
  next: NextFunction,
): Promise<void> {
  try {
    const header = req.header("authorization");
    if (!header?.startsWith("Bearer ")) {
      throw new AppError(401, "UNAUTHORIZED", "Missing admin access token");
    }

    const token = header.slice("Bearer ".length);
    const decoded = jwt.verify(token, loadEnv().ADMIN_JWT_SECRET);

    if (!isAdminTokenPayload(decoded)) {
      throw new AppError(401, "UNAUTHORIZED", "Invalid admin access token");
    }

    const admin = await prisma.adminUser.findUnique({
      where: { id: decoded.admin_id },
      select: { id: true, role: true, disabledAt: true },
    });

    if (!admin || admin.disabledAt) {
      throw new AppError(401, "UNAUTHORIZED", "Invalid admin access token");
    }

    if (admin.role !== decoded.role) {
      throw new AppError(403, "FORBIDDEN", "Admin role mismatch");
    }

    req.admin = {
      adminId: admin.id,
      role: admin.role,
    };

    next();
  } catch (error) {
    if (error instanceof AppError) {
      next(error);
      return;
    }

    next(new AppError(401, "UNAUTHORIZED", "Invalid admin access token"));
  }
}

export function requireAdminRoles(...roles: AdminRole[]) {
  return (req: Request, _res: Response, next: NextFunction): void => {
    if (!req.admin) {
      next(new AppError(401, "UNAUTHORIZED", "Missing admin access token"));
      return;
    }

    if (!roles.includes(req.admin.role) && req.admin.role !== "super_admin") {
      next(new AppError(403, "FORBIDDEN", "Insufficient admin permissions"));
      return;
    }

    next();
  };
}

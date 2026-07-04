import type { RequestHandler } from "express";
import type { KycStatus } from "@prisma/client";
import { AppError } from "./error.middleware";
import { VERIFIED_KYC_STATUSES } from "../config/kyc.constants";

function isVerified(status: KycStatus | string): boolean {
  return VERIFIED_KYC_STATUSES.has(status);
}

export const requireKycBasic: RequestHandler = (req, _res, next) => {
  const status = req.user?.kycStatus;
  if (!status || !isVerified(status)) {
    next(
      new AppError(
        403,
        "KYC_REQUIRED",
        "Complete KYC verification to join a Scheme",
      ),
    );
    return;
  }

  next();
};

export const requireKycEnhanced: RequestHandler = (req, _res, next) => {
  const status = req.user?.kycStatus;
  if (status !== "enhanced_verified") {
    next(
      new AppError(
        403,
        "ENHANCED_KYC_REQUIRED",
        "Enhanced KYC verification is required for this action",
      ),
    );
    return;
  }

  next();
};

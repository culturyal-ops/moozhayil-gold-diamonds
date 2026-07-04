import type { KycStatus } from "@prisma/client";
import {
  ENHANCED_MONTHLY_CONTRIBUTION_PAISE,
  VERIFIED_KYC_STATUSES,
} from "../config/kyc.constants";
import { AppError } from "../middleware/error.middleware";
import type { ErrorCode } from "../middleware/error.middleware";

export type KycGateCode = Extract<
  ErrorCode,
  "KYC_REQUIRED" | "ENHANCED_KYC_REQUIRED" | "FORBIDDEN"
>;

export interface KycGateResult {
  allowed: boolean;
  code?: KycGateCode;
  message?: string;
}

function isVerified(status: KycStatus): boolean {
  return VERIFIED_KYC_STATUSES.has(status);
}

function isEnhancedVerified(status: KycStatus): boolean {
  return status === "enhanced_verified";
}

export function checkGoalCreationGate(kycStatus: KycStatus): KycGateResult {
  if (!isVerified(kycStatus)) {
    return {
      allowed: false,
      code: "KYC_REQUIRED",
      message: "Complete KYC verification to start a Scheme",
    };
  }

  return { allowed: true };
}

export function checkContributionGate(
  kycStatus: KycStatus,
  amountPaise: number,
): KycGateResult {
  if (!isVerified(kycStatus)) {
    return {
      allowed: false,
      code: "KYC_REQUIRED",
      message: "Complete KYC verification to contribute to a Scheme",
    };
  }

  if (
    amountPaise > ENHANCED_MONTHLY_CONTRIBUTION_PAISE &&
    !isEnhancedVerified(kycStatus)
  ) {
    return {
      allowed: false,
      code: "ENHANCED_KYC_REQUIRED",
      message:
        "Contributions above ₹50,000 require enhanced KYC with Aadhaar and PAN",
    };
  }

  return { allowed: true };
}

export function checkRedemptionGate(_kycStatus: KycStatus): KycGateResult {
  // Shop checkout and My Gold redemption do not require KYC.
  return { allowed: true };
}

export function checkCheckoutGate(
  _kycStatus: KycStatus,
  _totalPaise: number,
  _panVerified: boolean,
): KycGateResult {
  // KYC is enforced for Schemes only (goals and contributions).
  return { allowed: true };
}

export function assertKycGate(result: KycGateResult): void {
  if (result.allowed) {
    return;
  }

  throw new AppError(
    403,
    result.code ?? "KYC_REQUIRED",
    result.message ?? "KYC verification required",
  );
}

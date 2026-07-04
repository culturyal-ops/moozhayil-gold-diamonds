/** Locked architecture thresholds — integer paise / hours. */
export const ORDER_KYC_THRESHOLD_PAISE = 5_000_000;
export const PAN_REQUIRED_THRESHOLD_PAISE = 20_000_000;
export const ENHANCED_MONTHLY_CONTRIBUTION_PAISE = 5_000_000;
export const BASIC_MONTHLY_CONTRIBUTION_MAX_PAISE = 5_000_000;
export const ENHANCED_MONTHLY_CONTRIBUTION_MAX_PAISE = 20_000_000;

export const KYC_AADHAAR_OTP_TTL_SECONDS = 300;
export const KYC_RESUBMISSION_COOLDOWN_HOURS = 24;
export const KYC_MAX_AADHAAR_OTP_ATTEMPTS = 5;
export const KYC_SELFIE_MAX_BYTES = 5 * 1024 * 1024;
export const KYC_NAME_MATCH_THRESHOLD = 0.8;
export const KYC_ESTIMATED_REVIEW_MINUTES = 30;
export const KYC_MAX_REJECTIONS_BEFORE_ESCALATION = 3;

export const VERIFIED_KYC_STATUSES = new Set([
  "basic_verified",
  "enhanced_verified",
]);

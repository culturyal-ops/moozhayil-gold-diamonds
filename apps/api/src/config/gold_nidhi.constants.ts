/** Gold Nidhi — open-ended flexible gold accumulation. */
export const GOLD_NIDHI_SCHEME_TYPE = "gold_nidhi" as const;
export const GOLD_NIDHI_OPEN_DURATION_MONTHS = 999;
export const GOLD_NIDHI_MIN_DEPOSIT_PAISE = 50_000;
export const GOLD_NIDHI_DEPOSIT_STEP_PAISE = 50_000;

export const GOLD_NIDHI_STATUS_LABELS: Record<string, string> = {
  active: "Accumulating",
  contribution_due: "Deposit Due",
  paused: "Paused",
  completed: "Closed",
  cancelled: "Closed",
  discontinued: "Closed",
};

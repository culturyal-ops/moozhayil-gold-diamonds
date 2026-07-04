/** Crest — single advance payment, gold weight locked at enrollment. */
export const CREST_SCHEME_TYPE = "crest" as const;
export const CREST_DURATION_MONTHS = 1;
export const CREST_MIN_ADVANCE_PAISE = 50_000;
export const CREST_ADVANCE_STEP_PAISE = 50_000;

export const CREST_STATUS_LABELS: Record<string, string> = {
  active: "Weight Secured",
  contribution_due: "Advance Due",
  paused: "Paused",
  completed: "Advance Paid",
  cancelled: "Closed",
  discontinued: "Closed",
};

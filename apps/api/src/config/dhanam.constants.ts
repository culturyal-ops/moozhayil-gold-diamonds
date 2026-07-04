/** Dhanam — advance booking with lower-of booking vs redemption rate. */
export const DHANAM_SCHEME_TYPE = "dhanam" as const;
export const DHANAM_DURATION_MONTHS = 12;
export const DHANAM_MIN_ADVANCE_PAISE = 50_000;
export const DHANAM_ADVANCE_STEP_PAISE = 50_000;

export const DHANAM_STATUS_LABELS: Record<string, string> = {
  active: "Rate Protected",
  contribution_due: "Booking Due",
  paused: "Paused",
  completed: "Ready to Redeem",
  cancelled: "Closed",
  discontinued: "Closed",
};

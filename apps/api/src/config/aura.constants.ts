/** Moozhayil Aura Plan — monthly jewellery savings (11 installments). */
export const AURA_SCHEME_TYPE = "aura" as const;
export const AURA_DURATION_MONTHS = 11;
export const AURA_TOTAL_INSTALLMENTS = 11;
export const AURA_MIN_INSTALLMENT_PAISE = 50_000;
export const AURA_INSTALLMENT_STEP_PAISE = 50_000;
export const AURA_REDEMPTION_WINDOW_START_DAY = 332;
export const AURA_REDEMPTION_WINDOW_END_DAY = 352;
export const AURA_MISSED_MONTHS_FOR_DISCONTINUATION = 2;
/** Golden Wish brochure: 0% making charges on redemption. */
export const AURA_MC_WAIVER_MAX_PCT = 100;

export const AURA_STATUS_LABELS: Record<string, string> = {
  active: "On Track",
  contribution_due: "Installment Due",
  paused: "Paused",
  completed: "Matured",
  cancelled: "Closed Early",
  discontinued: "Discontinued",
};

export const AURA_DISCONTINUATION_REASON =
  "Two consecutive monthly installments were missed";

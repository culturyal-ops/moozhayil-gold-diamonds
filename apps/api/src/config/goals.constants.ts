export const MIN_MONTHLY_CONTRIBUTION_PAISE = 100_000;
export const BASIC_MAX_MONTHLY_CONTRIBUTION_PAISE = 5_000_000;
export const ENHANCED_MAX_MONTHLY_CONTRIBUTION_PAISE = 20_000_000;
export const MAX_ACTIVE_GOALS = 5;
export const VALID_GOAL_DURATIONS_MONTHS = [12, 18, 24, 36] as const;
export const GOAL_ACCUMULATION_PURITY = "k22" as const;
export const CONTRIBUTION_DUE_AFTER_DAYS = 7;
export const GOAL_PAUSED_AFTER_DAYS = 30;
export const BONUS_CREDIT_DELAY_HOURS = 24;

export const GOAL_STATUS_LABELS: Record<string, string> = {
  active: "On Track",
  contribution_due: "Contribution Due",
  paused: "Paused",
  completed: "Goal Achieved",
  cancelled: "Cancelled",
  discontinued: "Discontinued",
};

export const MILESTONE_GRAMS_THRESHOLDS = [
  { type: "gold_1g", grams: "1.0000" },
  { type: "gold_5g", grams: "5.0000" },
  { type: "gold_10g", grams: "10.0000" },
  { type: "gold_25g", grams: "25.0000" },
  { type: "gold_50g", grams: "50.0000" },
];

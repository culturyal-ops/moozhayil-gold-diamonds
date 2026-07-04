/**
 * Scheme catalogue for admin UI (maps to Goal.schemeType in the API).
 * Internal IDs stay aligned with backend — display names follow Moozhayil terminology.
 */

export const SCHEME_PLANS = [
  {
    id: "aura",
    name: "Aura Plan",
    tagline: "Monthly jewellery savings",
    enrollmentStatus: "live_app",
  },
  {
    id: "crest",
    name: "Crest",
    tagline: "Advance gold booking",
    enrollmentStatus: "showroom_only",
  },
  {
    id: "dhanam",
    name: "Dhanam",
    tagline: "Protected gold pricing",
    enrollmentStatus: "showroom_only",
  },
  {
    id: "gold_nidhi",
    name: "Swarna Nidhi",
    tagline: "Flexible gold savings",
    enrollmentStatus: "showroom_only",
  },
] as const;

export type SchemePlanId = (typeof SCHEME_PLANS)[number]["id"];

/** @deprecated Use SCHEME_PLANS */
export const GOLDEN_WISH_PLANS = SCHEME_PLANS;

/** @deprecated Use SchemePlanId */
export type GoldenWishPlanId = SchemePlanId;

const SCHEME_LABELS: Record<string, string> = {
  aura: "Aura Plan",
  crest: "Crest",
  dhanam: "Dhanam",
  gold_nidhi: "Swarna Nidhi",
};

/** Customer-facing scheme label for admin UI (backend may still return legacy names). */
export function formatSchemeLabel(
  schemeType: string,
  apiDisplay?: string | null,
): string {
  return SCHEME_LABELS[schemeType] ?? apiDisplay ?? schemeType;
}

export const SCHEME_ENROLLMENT_DEFAULTS: Record<
  SchemePlanId,
  {
    duration_months: number;
    monthly_amount_rupees: number;
    goal_type: "other" | "wedding" | "investment" | "festival" | "gift" | "family";
  }
> = {
  aura: { duration_months: 11, monthly_amount_rupees: 500, goal_type: "other" },
  crest: { duration_months: 1, monthly_amount_rupees: 500, goal_type: "other" },
  dhanam: { duration_months: 12, monthly_amount_rupees: 500, goal_type: "other" },
  gold_nidhi: {
    duration_months: 999,
    monthly_amount_rupees: 500,
    goal_type: "other",
  },
};

export const SHOWROOM_PAYMENT_CHANNELS = [
  { id: "cash", label: "Cash" },
  { id: "upi", label: "UPI" },
  { id: "bank_transfer", label: "Bank transfer" },
  { id: "cheque", label: "Cheque" },
  { id: "other", label: "Other" },
] as const;

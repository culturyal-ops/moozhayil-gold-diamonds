/**
 * Golden Wish purchase plan identifiers.
 * Maps to Goal.schemeType — business rules per plan land in later phases.
 */
export const SCHEME_TYPES = ["aura", "crest", "dhanam", "gold_nidhi"] as const;

export type SchemeTypeValue = (typeof SCHEME_TYPES)[number];

export const DEFAULT_SCHEME_TYPE: SchemeTypeValue = "aura";

export const SCHEME_DISPLAY_NAMES: Record<SchemeTypeValue, string> = {
  aura: "Aura Plan",
  crest: "Crest Plan",
  dhanam: "Dhanam",
  gold_nidhi: "Gold Nidhi",
};

/** All Golden Wish sub-plans support in-app enrollment. */
export const APP_ENROLLMENT_SCHEMES: SchemeTypeValue[] = [
  "aura",
  "crest",
  "dhanam",
  "gold_nidhi",
];

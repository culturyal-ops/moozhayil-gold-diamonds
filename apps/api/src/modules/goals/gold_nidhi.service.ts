import type { Goal, SchemeType } from "@prisma/client";
import { AppError } from "../../middleware/error.middleware";
import {
  GOLD_NIDHI_DEPOSIT_STEP_PAISE,
  GOLD_NIDHI_MIN_DEPOSIT_PAISE,
  GOLD_NIDHI_OPEN_DURATION_MONTHS,
  GOLD_NIDHI_SCHEME_TYPE,
} from "../../config/gold_nidhi.constants";
import { GOLDEN_WISH_MC_WAIVER_PCT } from "../../config/golden_wish.constants";
import type { CreateGoalInput } from "./goals.schema";

export function isGoldNidhiScheme(
  schemeType: SchemeType | null | undefined,
): boolean {
  return schemeType === GOLD_NIDHI_SCHEME_TYPE;
}

export function validateGoldNidhiCreateInput(input: CreateGoalInput): void {
  if (input.duration_months !== GOLD_NIDHI_OPEN_DURATION_MONTHS) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Gold Nidhi is an open-ended plan",
    );
  }

  if (input.monthly_amount_paise < GOLD_NIDHI_MIN_DEPOSIT_PAISE) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Minimum Gold Nidhi deposit is ₹500",
    );
  }

  if (input.monthly_amount_paise % GOLD_NIDHI_DEPOSIT_STEP_PAISE !== 0) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Gold Nidhi deposits must be in multiples of ₹500",
    );
  }
}

export function validateGoldNidhiContributionAmount(amountPaise: number): void {
  if (amountPaise < GOLD_NIDHI_MIN_DEPOSIT_PAISE) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Minimum Gold Nidhi deposit is ₹500",
    );
  }

  if (amountPaise % GOLD_NIDHI_DEPOSIT_STEP_PAISE !== 0) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Gold Nidhi deposits must be in multiples of ₹500",
    );
  }
}

export function mapGoldNidhiPlanFields(goal: Goal) {
  if (!isGoldNidhiScheme(goal.schemeType)) {
    return {};
  }

  return {
    open_ended: true,
    minimum_deposit_paise: GOLD_NIDHI_MIN_DEPOSIT_PAISE,
    mc_waiver_max_pct: GOLDEN_WISH_MC_WAIVER_PCT,
  };
}

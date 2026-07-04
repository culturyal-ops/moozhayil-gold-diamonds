import type { Goal, SchemeType } from "@prisma/client";
import { AppError } from "../../middleware/error.middleware";
import {
  DHANAM_ADVANCE_STEP_PAISE,
  DHANAM_DURATION_MONTHS,
  DHANAM_MIN_ADVANCE_PAISE,
  DHANAM_SCHEME_TYPE,
} from "../../config/dhanam.constants";
import { GOLDEN_WISH_MC_WAIVER_PCT } from "../../config/golden_wish.constants";
import { decimalString } from "../../utils/gold";
import type { CreateGoalInput } from "./goals.schema";

export function isDhanamScheme(
  schemeType: SchemeType | null | undefined,
): boolean {
  return schemeType === DHANAM_SCHEME_TYPE;
}

export function validateDhanamCreateInput(input: CreateGoalInput): void {
  if (input.duration_months !== DHANAM_DURATION_MONTHS) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Dhanam booking runs for 12 months",
    );
  }

  if (input.monthly_amount_paise < DHANAM_MIN_ADVANCE_PAISE) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Minimum Dhanam booking advance is ₹500",
    );
  }

  if (input.monthly_amount_paise % DHANAM_ADVANCE_STEP_PAISE !== 0) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Dhanam advance must be in multiples of ₹500",
    );
  }
}

export function resolveDhanamCreditRate(
  bookingRatePaisePerGram: number,
  currentRatePaisePerGram: number,
): number {
  return Math.min(bookingRatePaisePerGram, currentRatePaisePerGram);
}

export function validateDhanamContributionAmount(
  goal: Goal,
  amountPaise: number,
): void {
  if (amountPaise !== goal.monthlyAmountPaise) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Dhanam booking advance is locked at enrollment",
    );
  }
}

export function mapDhanamPlanFields(goal: Goal) {
  if (!isDhanamScheme(goal.schemeType)) {
    return {};
  }

  const bookingRate = goal.bookingRatePaisePerGram;

  return {
    booking_rate_paise_per_gram: bookingRate,
    booking_rate_display: bookingRate
      ? new Intl.NumberFormat("en-IN", {
          style: "currency",
          currency: "INR",
          maximumFractionDigits: 0,
        }).format(bookingRate / 100) + "/g"
      : null,
    rate_protection: "Lower of booking day or redemption day rate applies",
    mc_waiver_max_pct: GOLDEN_WISH_MC_WAIVER_PCT,
    target_grams_locked: goal.targetGrams
      ? decimalString(goal.targetGrams)
      : null,
  };
}

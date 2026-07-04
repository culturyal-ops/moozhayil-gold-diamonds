import Decimal from "decimal.js";

import type { Goal, Product } from "@prisma/client";

import {
  decimalString,
  formatGoldGrams,
  calculateValuePaiseFromGrams,
} from "../../utils/gold";
import { formatPaise } from "../../utils/money";
import { GOAL_STATUS_LABELS } from "../../config/goals.constants";
import { AURA_STATUS_LABELS } from "../../config/aura.constants";
import { CREST_STATUS_LABELS } from "../../config/crest.constants";
import { DHANAM_STATUS_LABELS } from "../../config/dhanam.constants";
import { GOLD_NIDHI_STATUS_LABELS } from "../../config/gold_nidhi.constants";
import {
  GOLDEN_WISH_MC_BENEFIT_LABEL,
  GOLDEN_WISH_SINCE_YEAR,
} from "../../config/golden_wish.constants";
import { SCHEME_DISPLAY_NAMES } from "../../config/schemes.constants";
import { addMonths, formatDateOnly, monthsRemaining } from "../../utils/dates";
import {
  computeAuraSchedule,
  isAuraScheme,
  mapAuraPlanFields,
} from "./aura.service";
import {
  isCrestScheme,
  mapCrestPlanFields,
} from "./crest.service";
import { isDhanamScheme, mapDhanamPlanFields } from "./dhanam.service";
import {
  isGoldNidhiScheme,
  mapGoldNidhiPlanFields,
} from "./gold_nidhi.service";

type GoalWithProduct = Goal & {
  targetProduct?: Pick<Product, "id" | "name"> & {
    images?: { cdnUrl: string; isPrimary: boolean }[];
  } | null;
};

function primaryImage(
  product: GoalWithProduct["targetProduct"],
): string | null {
  if (!product?.images?.length) {
    return null;
  }

  const primary =
    product.images.find((image) => image.isPrimary) ?? product.images[0];
  return primary?.cdnUrl ?? null;
}

function statusLabel(goal: Goal): string {
  if (isAuraScheme(goal.schemeType)) {
    return AURA_STATUS_LABELS[goal.status] ?? goal.status;
  }
  if (isCrestScheme(goal.schemeType)) {
    return CREST_STATUS_LABELS[goal.status] ?? goal.status;
  }
  if (isDhanamScheme(goal.schemeType)) {
    return DHANAM_STATUS_LABELS[goal.status] ?? goal.status;
  }
  if (isGoldNidhiScheme(goal.schemeType)) {
    return GOLD_NIDHI_STATUS_LABELS[goal.status] ?? goal.status;
  }

  return GOAL_STATUS_LABELS[goal.status] ?? goal.status;
}

function estimatedCompletionDate(goal: Goal): Date | null {
  if (isGoldNidhiScheme(goal.schemeType)) {
    return null;
  }

  if (isAuraScheme(goal.schemeType)) {
    return computeAuraSchedule(goal.startDate).maturityDate;
  }

  return addMonths(goal.startDate, goal.durationMonths);
}

export function mapGoalToDto(
  goal: GoalWithProduct,
  currentGrams: Decimal,
  ratePerGramPaise: number,
  completedInstallments = 0,
) {
  const targetGrams = goal.targetGrams
    ? new Decimal(goal.targetGrams.toString())
    : null;
  const currentValuePaise = calculateValuePaiseFromGrams(
    currentGrams,
    ratePerGramPaise,
  );

  let percentComplete = 0;
  if (isAuraScheme(goal.schemeType)) {
    percentComplete = Math.min(
      100,
      Math.floor((completedInstallments / goal.durationMonths) * 100),
    );
  } else if (targetGrams && targetGrams.gt(0)) {
    percentComplete = Math.min(
      100,
      currentGrams.div(targetGrams).mul(100).floor().toNumber(),
    );
  } else if (goal.targetAmountPaise) {
    percentComplete = Math.min(
      100,
      Math.floor((currentValuePaise / goal.targetAmountPaise) * 100),
    );
  }

  const completionDate = estimatedCompletionDate(goal);

  return {
    id: goal.id,
    name: goal.name,
    scheme_type: goal.schemeType,
    scheme_display_name:
      SCHEME_DISPLAY_NAMES[goal.schemeType] ?? goal.schemeType,
    goal_type: goal.goalType,
    status: goal.status,
    status_label: statusLabel(goal),
    target_product: goal.targetProduct
      ? {
          id: goal.targetProduct.id,
          name: goal.targetProduct.name,
          primary_image: primaryImage(goal.targetProduct),
        }
      : null,
    target_amount_paise: goal.targetAmountPaise,
    target_amount_display: goal.targetAmountPaise
      ? formatPaise(goal.targetAmountPaise)
      : null,
    target_grams: targetGrams ? decimalString(targetGrams) : null,
    current_grams: decimalString(currentGrams),
    current_grams_display: formatGoldGrams(currentGrams),
    current_value_paise: currentValuePaise,
    current_value_display: formatPaise(currentValuePaise),
    percent_complete: percentComplete,
    monthly_amount_paise: goal.monthlyAmountPaise,
    monthly_amount_display: isGoldNidhiScheme(goal.schemeType)
      ? `${formatPaise(goal.monthlyAmountPaise)} min deposit`
      : isCrestScheme(goal.schemeType) || isDhanamScheme(goal.schemeType)
        ? formatPaise(goal.monthlyAmountPaise)
        : `${formatPaise(goal.monthlyAmountPaise)}/mo`,
    duration_months: goal.durationMonths,
    start_date: formatDateOnly(goal.startDate),
    next_contribution_date: formatDateOnly(goal.nextContributionDate),
    estimated_completion_date: completionDate
      ? formatDateOnly(completionDate)
      : null,
    months_remaining: completionDate
      ? monthsRemaining(new Date(), completionDate)
      : null,
    bonus_eligible: goal.bonusEligible,
    golden_wish_since: GOLDEN_WISH_SINCE_YEAR,
    mc_benefit_label: GOLDEN_WISH_MC_BENEFIT_LABEL,
    ...mapAuraPlanFields(goal, completedInstallments),
    ...mapCrestPlanFields(goal, completedInstallments),
    ...mapDhanamPlanFields(goal),
    ...mapGoldNidhiPlanFields(goal),
  };
}

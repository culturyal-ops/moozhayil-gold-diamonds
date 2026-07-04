import type { Goal, SchemeType } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import {
  AURA_DISCONTINUATION_REASON,
  AURA_DURATION_MONTHS,
  AURA_INSTALLMENT_STEP_PAISE,
  AURA_MC_WAIVER_MAX_PCT,
  AURA_MIN_INSTALLMENT_PAISE,
  AURA_MISSED_MONTHS_FOR_DISCONTINUATION,
  AURA_REDEMPTION_WINDOW_END_DAY,
  AURA_REDEMPTION_WINDOW_START_DAY,
  AURA_SCHEME_TYPE,
  AURA_TOTAL_INSTALLMENTS,
} from "../../config/aura.constants";
import {
  addDays,
  addMonths,
  calendarMonthsBetween,
  formatDateOnly,
  toDateOnly,
} from "../../utils/dates";
import { notifyGoalCompleted } from "../notifications/notifications.triggers";
import type { CreateGoalInput } from "./goals.schema";

const INSTALLMENT_CONTRIBUTION_TYPES = ["manual", "autopay"] as const;

export function isAuraScheme(
  schemeType: SchemeType | null | undefined,
): boolean {
  return (schemeType ?? AURA_SCHEME_TYPE) === AURA_SCHEME_TYPE;
}

export function validateAuraCreateInput(input: CreateGoalInput): void {
  if (input.duration_months !== AURA_DURATION_MONTHS) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Aura Plan runs for 11 months",
    );
  }

  if (input.monthly_amount_paise < AURA_MIN_INSTALLMENT_PAISE) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Minimum Aura installment is ₹500",
    );
  }

  if (input.monthly_amount_paise % AURA_INSTALLMENT_STEP_PAISE !== 0) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Aura installment must be in multiples of ₹500",
    );
  }
}

export function validateAuraContributionAmount(
  goal: Goal,
  amountPaise: number,
): void {
  if (amountPaise !== goal.monthlyAmountPaise) {
    throw new AppError(
      422,
      "UNPROCESSABLE",
      "Aura installment amount is locked at enrollment",
    );
  }
}

export function computeAuraSchedule(startDate: Date) {
  return {
    maturityDate: addMonths(startDate, AURA_DURATION_MONTHS),
    redemptionWindowStart: addDays(startDate, AURA_REDEMPTION_WINDOW_START_DAY),
    redemptionWindowEnd: addDays(startDate, AURA_REDEMPTION_WINDOW_END_DAY),
  };
}

export async function countCompletedAuraInstallments(
  goalId: string,
): Promise<number> {
  return prisma.contribution.count({
    where: {
      goalId,
      status: "completed",
      type: { in: [...INSTALLMENT_CONTRIBUTION_TYPES] },
    },
  });
}

export function computeMcWaiverEligible(
  goal: Goal,
  completedInstallments: number,
): boolean {
  if (!isAuraScheme(goal.schemeType)) {
    return false;
  }

  return (
    goal.status === "completed" &&
    completedInstallments >= AURA_TOTAL_INSTALLMENTS
  );
}

export function isWithinAuraRedemptionWindow(
  startDate: Date,
  today = new Date(),
): boolean {
  const schedule = computeAuraSchedule(startDate);
  const day = toDateOnly(today);
  return (
    day >= toDateOnly(schedule.redemptionWindowStart) &&
    day <= toDateOnly(schedule.redemptionWindowEnd)
  );
}

export function mapAuraPlanFields(
  goal: Goal,
  completedInstallments: number,
) {
  if (!isAuraScheme(goal.schemeType)) {
    return {};
  }

  const schedule = computeAuraSchedule(goal.startDate);
  const eligible = computeMcWaiverEligible(goal, completedInstallments);
  const withinWindow = isWithinAuraRedemptionWindow(goal.startDate);

  return {
    installments_completed: completedInstallments,
    installments_total: AURA_TOTAL_INSTALLMENTS,
    maturity_date: formatDateOnly(schedule.maturityDate),
    redemption_window_start: formatDateOnly(schedule.redemptionWindowStart),
    redemption_window_end: formatDateOnly(schedule.redemptionWindowEnd),
    mc_waiver_eligible: eligible,
    mc_waiver_max_pct: AURA_MC_WAIVER_MAX_PCT,
    mc_waiver_within_redemption_window: withinWindow,
    mc_waiver_active: eligible && withinWindow,
    discontinued_at: goal.discontinuedAt?.toISOString() ?? null,
    discontinued_reason: goal.discontinuedReason ?? null,
  };
}

export async function evaluateAuraCompletion(goalId: string): Promise<void> {
  const goal = await prisma.goal.findUnique({ where: { id: goalId } });

  if (
    !goal ||
    !isAuraScheme(goal.schemeType) ||
    goal.status === "completed" ||
    goal.status === "cancelled" ||
    goal.status === "discontinued"
  ) {
    return;
  }

  const completedInstallments = await countCompletedAuraInstallments(goalId);

  if (completedInstallments < AURA_TOTAL_INSTALLMENTS) {
    return;
  }

  const now = new Date();

  await prisma.goal.update({
    where: { id: goalId },
    data: {
      status: "completed",
      completedAt: now,
    },
  });

  await notifyGoalCompleted({
    userId: goal.userId,
    goalId: goal.id,
    goalName: goal.name,
  });
}

export async function discontinueAuraGoal(goalId: string): Promise<boolean> {
  const goal = await prisma.goal.findUnique({ where: { id: goalId } });

  if (
    !goal ||
    !isAuraScheme(goal.schemeType) ||
    goal.status === "discontinued" ||
    goal.status === "completed" ||
    goal.status === "cancelled"
  ) {
    return false;
  }

  const now = new Date();

  await prisma.goal.update({
    where: { id: goalId },
    data: {
      status: "discontinued",
      discontinuedAt: now,
      discontinuedReason: AURA_DISCONTINUATION_REASON,
      bonusEligible: false,
    },
  });

  return true;
}

export function auraMissedInstallmentMonths(
  nextContributionDate: Date,
  today: Date,
): number {
  return calendarMonthsBetween(nextContributionDate, today);
}

export function shouldDiscontinueAuraGoal(
  nextContributionDate: Date,
  today: Date,
): boolean {
  return (
    auraMissedInstallmentMonths(nextContributionDate, today) >=
    AURA_MISSED_MONTHS_FOR_DISCONTINUATION
  );
}

export function shouldMarkAuraContributionDue(
  nextContributionDate: Date,
  today: Date,
): boolean {
  const missed = auraMissedInstallmentMonths(nextContributionDate, today);
  return missed >= 1 && missed < AURA_MISSED_MONTHS_FOR_DISCONTINUATION;
}

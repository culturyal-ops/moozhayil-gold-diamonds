import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { goldLedgerService } from "../gold_ledger/gold_ledger.service";
import { goldRatesService } from "../gold_rates/gold_rates.service";
import { GOAL_ACCUMULATION_PURITY } from "../../config/goals.constants";

export interface AuraContext {
  userId: string;
  intentTags: string[];
  activeGoals: Array<{
    id: string;
    name: string;
    currentGrams: string;
    targetGrams: string | null;
    percentComplete: number;
    nextContributionDate: string;
  }>;
  vaultProductIds: string[];
  recentProductIds: string[];
  totalGoldGrams: string;
  goldRateDisplay: string;
  rateChangePct: number;
}

export async function buildAuraContext(userId: string): Promise<AuraContext> {
  const user = await prisma.user.findUniqueOrThrow({
    where: { id: userId },
    include: {
      intents: { where: { isActive: true } },
      goals: {
        where: {
          deletedAt: null,
          status: { in: ["active", "contribution_due", "paused"] },
        },
      },
      dreamVaultItems: { where: { removedAt: null } },
    },
  });

  const since = new Date();
  since.setDate(since.getDate() - 90);

  const views = await prisma.productView.findMany({
    where: { userId, viewedAt: { gte: since } },
    orderBy: { viewedAt: "desc" },
    take: 20,
    select: { productId: true },
  });

  const totalGrams = await goldLedgerService.getPostedBalanceGrams(userId);
  const rate = await goldRatesService.currentRateForPurity(GOAL_ACCUMULATION_PURITY);
  const history = await prisma.goldRateHistory.findMany({
    where: { purity: GOAL_ACCUMULATION_PURITY },
    orderBy: { effectiveFrom: "desc" },
    take: 2,
  });

  let rateChangePct = 0;
  if (history.length >= 2) {
    const latest = history[0]!.ratePerGramPaise;
    const previous = history[1]!.ratePerGramPaise;
    rateChangePct = Number(
      new Decimal(latest - previous)
        .div(previous)
        .mul(100)
        .toFixed(1),
    );
  }

  const activeGoals = await Promise.all(
    user.goals.map(async (goal) => {
      const progress = await goldLedgerService.getGoalCreditedGrams(goal.id);
      const target = goal.targetGrams?.toString() ?? null;
      const percent = target
        ? Math.min(
            100,
            Math.floor(
              progress.div(new Decimal(target)).mul(100).toNumber(),
            ),
          )
        : 0;

      return {
        id: goal.id,
        name: goal.name,
        currentGrams: progress.toFixed(4),
        targetGrams: target,
        percentComplete: percent,
        nextContributionDate: goal.nextContributionDate.toISOString().slice(0, 10),
      };
    }),
  );

  return {
    userId,
    intentTags: user.intents.map((intent) => intent.intentType),
    activeGoals,
    vaultProductIds: user.dreamVaultItems.map((item) => item.productId),
    recentProductIds: views.map((view) => view.productId),
    totalGoldGrams: totalGrams.toFixed(4),
    goldRateDisplay: `₹${Math.round(rate.ratePerGramPaise / 100).toLocaleString("en-IN")}/g`,
    rateChangePct,
  };
}

export function redactAuraContext(context: AuraContext) {
  return {
    intent_tags: context.intentTags,
    active_goals: context.activeGoals.map((goal) => ({
      name: goal.name,
      current_grams: goal.currentGrams,
      target_grams: goal.targetGrams,
      percent_complete: goal.percentComplete,
    })),
    vault_count: context.vaultProductIds.length,
    recent_view_count: context.recentProductIds.length,
    total_gold_grams: context.totalGoldGrams,
    gold_rate_display: context.goldRateDisplay,
    rate_change_pct: context.rateChangePct,
  };
}

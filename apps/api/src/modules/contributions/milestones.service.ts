import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { MILESTONE_GRAMS_THRESHOLDS } from "../../config/goals.constants";
import { goldLedgerService } from "../gold_ledger/gold_ledger.service";
import { notifyMilestoneReached } from "../notifications/notifications.triggers";
import { formatGoldGrams } from "../../utils/gold";

export async function detectMilestones(userId: string): Promise<void> {
  const totalGrams = await goldLedgerService.getPostedBalanceGrams(userId);
  const now = new Date();

  for (const milestone of MILESTONE_GRAMS_THRESHOLDS) {
    if (totalGrams.lt(new Decimal(milestone.grams))) {
      continue;
    }

    const existing = await prisma.userMilestone.findUnique({
      where: {
        userId_milestoneType: {
          userId,
          milestoneType: milestone.type,
        },
      },
    });

    if (existing) {
      continue;
    }

    await prisma.userMilestone.create({
      data: {
        userId,
        milestoneType: milestone.type,
        reachedAt: now,
      },
    });

    await notifyMilestoneReached({
      userId,
      milestoneLabel: `${formatGoldGrams(milestone.grams)} saved`,
    });
  }
}

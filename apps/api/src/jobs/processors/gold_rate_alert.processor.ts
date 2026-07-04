import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { GOAL_ACCUMULATION_PURITY } from "../../config/goals.constants";
import { formatPaise } from "../../utils/money";
import { notificationsService } from "../../modules/notifications/notifications.service";

const ALERT_THRESHOLD_PCT = 2;

export async function processGoldRateAlerts(): Promise<number> {
  const history = await prisma.goldRateHistory.findMany({
    where: { purity: GOAL_ACCUMULATION_PURITY },
    orderBy: { effectiveFrom: "desc" },
    take: 2,
  });

  if (history.length < 2) {
    return 0;
  }

  const latest = history[0]!;
  const previous = history[1]!;

  const todayStart = new Date();
  todayStart.setHours(0, 0, 0, 0);
  if (latest.effectiveFrom < todayStart) {
    return 0;
  }

  const changePct = Number(
    new Decimal(latest.ratePerGramPaise - previous.ratePerGramPaise)
      .div(previous.ratePerGramPaise)
      .mul(100)
      .toFixed(1),
  );

  if (Math.abs(changePct) < ALERT_THRESHOLD_PCT) {
    return 0;
  }

  const preferences = await prisma.notificationPreference.findMany({
    where: { goldRateAlertEnabled: true },
    select: { userId: true },
  });

  let notified = 0;

  for (const preference of preferences) {
    const notification = await notificationsService.enqueue({
      userId: preference.userId,
      type: "gold_rate_alert",
      templateKey: "gold_rate_alert",
      variables: {
        change_pct: String(changePct),
        rate_display: formatPaise(latest.ratePerGramPaise),
      },
      deepLink: "/aura/gold-insights",
    });

    if (notification) {
      notified += 1;
    }
  }

  return notified;
}

import { prisma } from "../../db/prisma";
import { formatPaise } from "../../utils/money";
import { formatDateOnly } from "../../utils/dates";
import { notificationsService } from "../../modules/notifications/notifications.service";

const REMINDER_DAYS = [3, 1, 0] as const;

export async function processContributionReminders(): Promise<number> {
  const today = new Date();
  today.setHours(0, 0, 0, 0);

  let created = 0;

  for (const daysBefore of REMINDER_DAYS) {
    const targetDate = new Date(today);
    targetDate.setDate(targetDate.getDate() + daysBefore);

    const goals = await prisma.goal.findMany({
      where: {
        deletedAt: null,
        status: { in: ["active", "contribution_due"] },
        nextContributionDate: targetDate,
      },
      include: {
        user: true,
      },
    });

    for (const goal of goals) {
      const recentSuccess = await prisma.contribution.count({
        where: {
          goalId: goal.id,
          type: "autopay",
          status: "completed",
        },
      });

      if (goal.paymentMethodId && recentSuccess >= 3 && daysBefore > 0) {
        continue;
      }

      const dueLabel =
        daysBefore === 0
          ? "today"
          : daysBefore === 1
            ? "tomorrow"
            : `on ${formatDateOnly(targetDate)}`;

      const scheduledFor =
        daysBefore === 0
          ? new Date()
          : new Date(targetDate.getTime() - daysBefore * 24 * 60 * 60 * 1000);

      const notification = await notificationsService.enqueue({
        userId: goal.userId,
        type: "contribution_due",
        templateKey: "contribution_due",
        variables: {
          goal_name: goal.name,
          amount_display: formatPaise(goal.monthlyAmountPaise),
          due_label: dueLabel,
        },
        deepLink: `/goals/${goal.id}/contribute`,
        scheduledFor,
      });

      if (notification) {
        created += 1;
      }
    }
  }

  return created;
}

export async function processScheduledNotifications(): Promise<number> {
  return notificationsService.processDueScheduledNotifications();
}

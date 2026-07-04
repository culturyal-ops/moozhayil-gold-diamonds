import { prisma } from "../../db/prisma";
import { pushClient } from "../../modules/notifications/push.client";

export async function processNotification(notificationId: string): Promise<void> {
  const notification = await prisma.notification.findUnique({
    where: { id: notificationId },
  });

  if (!notification || notification.isSent) {
    return;
  }

  if (
    notification.scheduledFor &&
    notification.scheduledFor.getTime() > Date.now()
  ) {
    return;
  }

  const prefs = await prisma.notificationPreference.findUnique({
    where: { userId: notification.userId },
  });

  const pushAllowed = prefs?.pushEnabled ?? true;

  if (pushAllowed) {
    const devices = await prisma.userDevice.findMany({
      where: {
        userId: notification.userId,
        disabledAt: null,
      },
      select: { pushToken: true },
    });

    const tokens = devices.map((device) => device.pushToken);

    if (tokens.length > 0) {
      const result = await pushClient.sendToTokens(tokens, {
        title: notification.title,
        body: notification.body,
        deepLink: notification.deepLink,
      });

      if (result.deliverableFailure) {
        throw new Error(
          `Push delivery failed for notification ${notificationId}`,
        );
      }
    }
  }

  await prisma.notification.update({
    where: { id: notificationId },
    data: {
      isSent: true,
      sentAt: new Date(),
    },
  });
}

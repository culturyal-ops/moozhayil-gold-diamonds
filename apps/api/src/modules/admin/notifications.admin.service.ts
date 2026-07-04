import { prisma } from "../../db/prisma";

export class NotificationsAdminService {
  async listRecent() {
    const notifications = await prisma.notification.findMany({
      orderBy: { createdAt: "desc" },
      take: 50,
      select: {
        id: true,
        userId: true,
        type: true,
        title: true,
        isRead: true,
        isSent: true,
        scheduledFor: true,
        createdAt: true,
      },
    });

    return {
      notifications: notifications.map((row) => ({
        id: row.id,
        user_id: row.userId,
        type: row.type,
        title: row.title,
        is_read: row.isRead,
        is_sent: row.isSent,
        scheduled_for: row.scheduledFor?.toISOString() ?? null,
        created_at: row.createdAt.toISOString(),
      })),
    };
  }
}

export const notificationsAdminService = new NotificationsAdminService();

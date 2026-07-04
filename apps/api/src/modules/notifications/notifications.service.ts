import type { NotificationType, Prisma } from "@prisma/client";
import { enqueueNotificationSend } from "../../jobs/queues";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import {
  NOTIFICATION_TYPE_TO_PREFERENCE,
  renderNotificationTemplate,
} from "./notification.templates";
import { mapNotificationToDto, mapPreferencesToDto } from "./notification.mapper";
import type {
  ListNotificationsQuery,
  UpdatePreferencesInput,
} from "./notifications.schema";

export interface EnqueueNotificationInput {
  userId: string;
  type: NotificationType;
  templateKey: string;
  variables: Record<string, string>;
  deepLink?: string;
  metadata?: Prisma.InputJsonValue;
  scheduledFor?: Date;
  /** Pass a stable key to prevent duplicate notifications for the same event. */
  idempotencyKey?: string;
}

export class NotificationsService {
  async getOrCreatePreferences(userId: string) {
    return prisma.notificationPreference.upsert({
      where: { userId },
      create: { userId },
      update: {},
    });
  }

  async getPreferences(userId: string) {
    const prefs = await this.getOrCreatePreferences(userId);
    return mapPreferencesToDto(prefs);
  }

  async updatePreferences(userId: string, input: UpdatePreferencesInput) {
    const prefs = await prisma.notificationPreference.upsert({
      where: { userId },
      create: {
        userId,
        pushEnabled: input.push_enabled ?? true,
        contributionsEnabled: input.contributions_enabled ?? true,
        milestonesEnabled: input.milestones_enabled ?? true,
        ordersEnabled: input.orders_enabled ?? true,
        kycEnabled: input.kyc_enabled ?? true,
        auraEnabled: input.aura_enabled ?? true,
        goldRateAlertEnabled: input.gold_rate_alert_enabled ?? false,
      },
      update: {
        ...(input.push_enabled !== undefined
          ? { pushEnabled: input.push_enabled }
          : {}),
        ...(input.contributions_enabled !== undefined
          ? { contributionsEnabled: input.contributions_enabled }
          : {}),
        ...(input.milestones_enabled !== undefined
          ? { milestonesEnabled: input.milestones_enabled }
          : {}),
        ...(input.orders_enabled !== undefined
          ? { ordersEnabled: input.orders_enabled }
          : {}),
        ...(input.kyc_enabled !== undefined
          ? { kycEnabled: input.kyc_enabled }
          : {}),
        ...(input.aura_enabled !== undefined
          ? { auraEnabled: input.aura_enabled }
          : {}),
        ...(input.gold_rate_alert_enabled !== undefined
          ? { goldRateAlertEnabled: input.gold_rate_alert_enabled }
          : {}),
      },
    });

    return mapPreferencesToDto(prefs);
  }

  async list(userId: string, query: ListNotificationsQuery) {
    const rows = await prisma.notification.findMany({
      where: {
        userId,
        ...(query.unread_only ? { isRead: false } : {}),
      },
      orderBy: { createdAt: "desc" },
      take: query.limit + 1,
      ...(query.cursor ? { cursor: { id: query.cursor }, skip: 1 } : {}),
    });

    const unreadCount = await prisma.notification.count({
      where: { userId, isRead: false },
    });

    const hasMore = rows.length > query.limit;
    const data = hasMore ? rows.slice(0, query.limit) : rows;

    return {
      data: data.map(mapNotificationToDto),
      unread_count: unreadCount,
      next_cursor: hasMore ? data[data.length - 1]?.id ?? null : null,
      has_more: hasMore,
    };
  }

  async markRead(userId: string, notificationId: string) {
    const notification = await prisma.notification.findFirst({
      where: { id: notificationId, userId },
    });

    if (!notification) {
      throw new AppError(404, "NOT_FOUND", "Notification does not exist");
    }

    if (!notification.isRead) {
      await prisma.notification.update({
        where: { id: notificationId },
        data: { isRead: true, readAt: new Date() },
      });
    }

    return { success: true };
  }

  async markAllRead(userId: string) {
    const result = await prisma.notification.updateMany({
      where: { userId, isRead: false },
      data: { isRead: true, readAt: new Date() },
    });

    return { success: true, marked_count: result.count };
  }

  async enqueue(input: EnqueueNotificationInput) {
    const prefs = await this.getOrCreatePreferences(input.userId);
    const preferenceField = NOTIFICATION_TYPE_TO_PREFERENCE[input.type];
    if (!prefs[preferenceField]) {
      return null;
    }

    // Dedup: if a stable idempotency key is provided, skip if already sent.
    if (input.idempotencyKey) {
      const existing = await prisma.notification.findUnique({
        where: { idempotencyKey: input.idempotencyKey },
        select: { id: true },
      });
      if (existing) {
        return existing as unknown as (typeof existing & Record<string, unknown>);
      }
    }

    const rendered = renderNotificationTemplate(
      input.templateKey,
      input.variables,
    );

    const notification = await prisma.notification.create({
      data: {
        userId: input.userId,
        type: input.type,
        title: rendered.title,
        body: rendered.body,
        deepLink: input.deepLink ?? null,
        metadata: input.metadata ?? undefined,
        scheduledFor: input.scheduledFor ?? null,
        idempotencyKey: input.idempotencyKey ?? null,
      },
    });

    const dueNow =
      !input.scheduledFor || input.scheduledFor.getTime() <= Date.now();

    if (dueNow) {
      await enqueueNotificationSend(notification.id);
    }

    return notification;
  }

  async processDueScheduledNotifications(limit = 100) {
    const due = await prisma.notification.findMany({
      where: {
        isSent: false,
        scheduledFor: { lte: new Date() },
      },
      orderBy: { scheduledFor: "asc" },
      take: limit,
    });

    for (const notification of due) {
      await enqueueNotificationSend(notification.id);
    }

    return due.length;
  }
}

export const notificationsService = new NotificationsService();

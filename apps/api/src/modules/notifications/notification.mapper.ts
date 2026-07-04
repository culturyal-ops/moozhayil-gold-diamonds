import type { Notification } from "@prisma/client";

export function mapNotificationToDto(notification: Notification) {
  return {
    id: notification.id,
    type: notification.type,
    title: notification.title,
    body: notification.body,
    is_read: notification.isRead,
    deep_link: notification.deepLink,
    created_at: notification.createdAt.toISOString(),
  };
}

export function mapPreferencesToDto(prefs: {
  pushEnabled: boolean;
  contributionsEnabled: boolean;
  milestonesEnabled: boolean;
  ordersEnabled: boolean;
  kycEnabled: boolean;
  auraEnabled: boolean;
  goldRateAlertEnabled: boolean;
}) {
  return {
    push_enabled: prefs.pushEnabled,
    contributions_enabled: prefs.contributionsEnabled,
    milestones_enabled: prefs.milestonesEnabled,
    orders_enabled: prefs.ordersEnabled,
    kyc_enabled: prefs.kycEnabled,
    aura_enabled: prefs.auraEnabled,
    gold_rate_alert_enabled: prefs.goldRateAlertEnabled,
  };
}

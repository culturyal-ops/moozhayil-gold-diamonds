import type { NotificationPreference, NotificationType } from "@prisma/client";

type NotificationPreferenceField = keyof Pick<
  NotificationPreference,
  | "contributionsEnabled"
  | "milestonesEnabled"
  | "ordersEnabled"
  | "kycEnabled"
  | "auraEnabled"
  | "goldRateAlertEnabled"
>;

export interface NotificationTemplate {
  title: string;
  body: string;
}

export const NOTIFICATION_TEMPLATES: Record<
  string,
  (vars: Record<string, string>) => NotificationTemplate
> = {
  contribution_due: (v) => ({
    title: "Contribution reminder",
    body: `Your ${v.goal_name} contribution of ${v.amount_display} is due ${v.due_label}.`,
  }),
  contribution_success: (v) => ({
    title: "Gold credited",
    body: `${v.grams_display} added to your ${v.goal_name} goal.`,
  }),
  contribution_failed: (v) => ({
    title: "Contribution failed",
    body: `We could not process your ${v.amount_display} contribution for ${v.goal_name}.`,
  }),
  milestone_reached: (v) => ({
    title: "Milestone reached",
    body: `You have crossed ${v.milestone_label} in saved gold. Keep going.`,
  }),
  goal_completed: (v) => ({
    title: "Goal completed",
    body: `Your ${v.goal_name} goal is complete. You are ready to redeem.`,
  }),
  order_confirmed: (v) => ({
    title: "Order confirmed",
    body: `Order ${v.order_number} for ${v.total_display} is confirmed.`,
  }),
  order_shipped: (v) => ({
    title: "Order shipped",
    body: `Order ${v.order_number} is on its way.`,
  }),
  order_delivered: (v) => ({
    title: "Order delivered",
    body: `Order ${v.order_number} has been delivered.`,
  }),
  kyc_verified: () => ({
    title: "Verification complete",
    body: "Your identity verification is complete. You can now save and redeem with confidence.",
  }),
  kyc_rejected: (v) => ({
    title: "Verification needs attention",
    body: v.reason ?? "Please review your KYC details and try again.",
  }),
  gold_rate_alert: (v) => ({
    title: "Gold rate update",
    body: `22K gold moved ${v.change_pct}% today. Current rate: ${v.rate_display}.`,
  }),
  aura_suggestion: (v) => ({
    title: "Aura suggestion",
    body: v.message,
  }),
  product_back_in_stock: (v) => ({
    title: "Back in stock",
    body: `${v.product_name} is available again.`,
  }),
  refund_initiated: (v) => ({
    title: "Refund initiated",
    body: `Refund for order ${v.order_number} has been initiated.`,
  }),
  refund_completed: (v) => ({
    title: "Refund completed",
    body: `Refund for order ${v.order_number} is complete.`,
  }),
  referral_reward: (v) => ({
    title: "Referral reward",
    body: `You earned ${v.reward_display} in gold credit for a successful referral.`,
  }),
};

export function renderNotificationTemplate(
  templateKey: string,
  variables: Record<string, string>,
): NotificationTemplate {
  const renderer = NOTIFICATION_TEMPLATES[templateKey];
  if (!renderer) {
    return {
      title: variables.title ?? "Update from Moozhayil",
      body: variables.body ?? "You have a new update.",
    };
  }

  return renderer(variables);
}

export const NOTIFICATION_TYPE_TO_PREFERENCE: Record<
  NotificationType,
  NotificationPreferenceField
> = {
  contribution_due: "contributionsEnabled",
  contribution_success: "contributionsEnabled",
  contribution_failed: "contributionsEnabled",
  milestone_reached: "milestonesEnabled",
  goal_completed: "milestonesEnabled",
  order_confirmed: "ordersEnabled",
  order_shipped: "ordersEnabled",
  order_delivered: "ordersEnabled",
  kyc_verified: "kycEnabled",
  kyc_rejected: "kycEnabled",
  gold_rate_alert: "goldRateAlertEnabled",
  aura_suggestion: "auraEnabled",
  product_back_in_stock: "auraEnabled",
  refund_initiated: "ordersEnabled",
  refund_completed: "ordersEnabled",
  referral_reward: "milestonesEnabled",
};

import type { NotificationType } from "@prisma/client";
import { notificationsService } from "./notifications.service";

export async function notifyUser(input: {
  userId: string;
  type: NotificationType;
  templateKey: string;
  variables: Record<string, string>;
  deepLink?: string;
  scheduledFor?: Date;
  idempotencyKey?: string;
}) {
  return notificationsService.enqueue(input);
}

export async function notifyContributionSuccess(input: {
  userId: string;
  goalId: string;
  goalName: string;
  gramsDisplay: string;
  contributionId: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "contribution_success",
    templateKey: "contribution_success",
    variables: {
      grams_display: input.gramsDisplay,
      goal_name: input.goalName,
    },
    deepLink: `/goals/${input.goalId}`,
    idempotencyKey: `contribution_success:${input.contributionId}`,
  });
}

export async function notifyContributionFailed(input: {
  userId: string;
  goalId: string;
  goalName: string;
  amountDisplay: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "contribution_failed",
    templateKey: "contribution_failed",
    variables: {
      amount_display: input.amountDisplay,
      goal_name: input.goalName,
    },
    deepLink: `/goals/${input.goalId}/contribute`,
  });
}

export async function notifyMilestoneReached(input: {
  userId: string;
  milestoneLabel: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "milestone_reached",
    templateKey: "milestone_reached",
    variables: { milestone_label: input.milestoneLabel },
    deepLink: "/my-gold",
  });
}

export async function notifyGoalCompleted(input: {
  userId: string;
  goalId: string;
  goalName: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "goal_completed",
    templateKey: "goal_completed",
    variables: { goal_name: input.goalName },
    deepLink: `/goals/${input.goalId}`,
  });
}

export async function notifyOrderConfirmed(input: {
  userId: string;
  orderId: string;
  orderNumber: string;
  totalDisplay: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "order_confirmed",
    templateKey: "order_confirmed",
    variables: {
      order_number: input.orderNumber,
      total_display: input.totalDisplay,
    },
    deepLink: `/orders/${input.orderId}`,
    idempotencyKey: `order_confirmed:${input.orderId}`,
  });
}

export async function notifyOrderShipped(input: {
  userId: string;
  orderId: string;
  orderNumber: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "order_shipped",
    templateKey: "order_shipped",
    variables: { order_number: input.orderNumber },
    deepLink: `/orders/${input.orderId}`,
  });
}

export async function notifyOrderDelivered(input: {
  userId: string;
  orderId: string;
  orderNumber: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "order_delivered",
    templateKey: "order_delivered",
    variables: { order_number: input.orderNumber },
    deepLink: `/orders/${input.orderId}`,
  });
}

export async function notifyKycVerified(input: { userId: string }) {
  return notifyUser({
    userId: input.userId,
    type: "kyc_verified",
    templateKey: "kyc_verified",
    variables: {},
    deepLink: "/profile/kyc",
  });
}

export async function notifyKycRejected(input: {
  userId: string;
  reason: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "kyc_rejected",
    templateKey: "kyc_rejected",
    variables: { reason: input.reason },
    deepLink: "/profile/kyc",
  });
}

export async function notifyRefundInitiated(input: {
  userId: string;
  orderId: string;
  orderNumber: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "refund_initiated",
    templateKey: "refund_initiated",
    variables: { order_number: input.orderNumber },
    deepLink: `/orders/${input.orderId}`,
  });
}

export async function notifyRefundCompleted(input: {
  userId: string;
  orderId: string;
  orderNumber: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "refund_completed",
    templateKey: "refund_completed",
    variables: { order_number: input.orderNumber },
    deepLink: `/orders/${input.orderId}`,
  });
}

export async function notifyReferralReward(input: {
  userId: string;
  rewardDisplay: string;
}) {
  return notifyUser({
    userId: input.userId,
    type: "referral_reward",
    templateKey: "referral_reward",
    variables: { reward_display: input.rewardDisplay },
    deepLink: "/referrals",
  });
}

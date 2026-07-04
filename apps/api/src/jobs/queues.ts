import { Queue, Worker, type ConnectionOptions } from "bullmq";
import { loadEnv } from "../config/env";
import { processNotification } from "./processors/notification.processor";
import { processAuraInsight } from "./processors/aura_insight.processor";
import {
  processContributionReminders,
  processScheduledNotifications,
} from "./processors/notification_reminder.processor";
import { processGoldRateAlerts } from "./processors/gold_rate_alert.processor";
import {
  processContributionDueStatuses,
  processDueAutopayContributions,
} from "./processors/autopay.processor";
import { processExpiredPendingOrders } from "./processors/pending_order_expiry.processor";
import { refreshBalanceSnapshots } from "./processors/balance_snapshot.processor";

export const QUEUE_NAMES = {
  notifications: "notifications",
  aura: "aura",
  operations: "operations",
} as const;

export type NotificationJobName =
  | "send"
  | "contribution_reminders"
  | "scheduled"
  | "gold_rate_alerts";

export type AuraJobName = "insight";

export type OperationsJobName =
  | "autopay"
  | "contribution_due_statuses"
  | "pending_order_expiry"
  | "balance_snapshots";

function isTestEnv(): boolean {
  return process.env.NODE_ENV === "test" || Boolean(process.env.JEST_WORKER_ID);
}

export function getQueueConnection(): ConnectionOptions | null {
  if (isTestEnv()) {
    return null;
  }

  try {
    return {
      url: loadEnv().REDIS_URL,
      maxRetriesPerRequest: null,
    };
  } catch {
    return null;
  }
}

let notificationsQueue: Queue | null | undefined;
let auraQueue: Queue | null | undefined;
let operationsQueue: Queue | null | undefined;

export function getNotificationsQueue(): Queue | null {
  if (isTestEnv()) {
    return null;
  }

  if (notificationsQueue !== undefined) {
    return notificationsQueue;
  }

  const connection = getQueueConnection();
  if (!connection) {
    notificationsQueue = null;
    return null;
  }

  notificationsQueue = new Queue(QUEUE_NAMES.notifications, { connection });
  return notificationsQueue;
}

export function getAuraQueue(): Queue | null {
  if (isTestEnv()) {
    return null;
  }

  if (auraQueue !== undefined) {
    return auraQueue;
  }

  const connection = getQueueConnection();
  if (!connection) {
    auraQueue = null;
    return null;
  }

  auraQueue = new Queue(QUEUE_NAMES.aura, { connection });
  return auraQueue;
}

export function getOperationsQueue(): Queue | null {
  if (isTestEnv()) {
    return null;
  }

  if (operationsQueue !== undefined) {
    return operationsQueue;
  }

  const connection = getQueueConnection();
  if (!connection) {
    operationsQueue = null;
    return null;
  }

  operationsQueue = new Queue(QUEUE_NAMES.operations, { connection });
  return operationsQueue;
}

export async function enqueueNotificationSend(
  notificationId: string,
): Promise<void> {
  if (isTestEnv()) {
    await processNotification(notificationId);
    return;
  }

  const queue = getNotificationsQueue();
  if (!queue) {
    await processNotification(notificationId);
    return;
  }

  await queue.add(
    "send",
    { notificationId },
    {
      jobId: `notification:send:${notificationId}`,
      removeOnComplete: true,
      removeOnFail: 100,
    },
  );
}

export async function enqueueAuraInsight(userId: string): Promise<void> {
  if (isTestEnv()) {
    await processAuraInsight(userId);
    return;
  }

  const queue = getAuraQueue();
  if (!queue) {
    await processAuraInsight(userId);
    return;
  }

  await queue.add(
    "insight",
    { userId },
    {
      jobId: `aura:insight:${userId}`,
      removeOnComplete: true,
      removeOnFail: 50,
    },
  );
}

export async function scheduleRepeatableNotificationJobs(): Promise<void> {
  const queue = getNotificationsQueue();
  if (!queue) {
    return;
  }

  await queue.add(
    "contribution_reminders",
    {},
    {
      repeat: { pattern: "0 6 * * *" },
      jobId: "notification:contribution_reminders",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );

  await queue.add(
    "scheduled",
    {},
    {
      repeat: { pattern: "*/15 * * * *" },
      jobId: "notification:scheduled",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );

  await queue.add(
    "gold_rate_alerts",
    {},
    {
      repeat: { pattern: "0 7 * * *" },
      jobId: "notification:gold_rate_alerts",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );
}

export async function scheduleRepeatableOperationsJobs(): Promise<void> {
  const queue = getOperationsQueue();
  if (!queue) {
    return;
  }

  await queue.add(
    "contribution_due_statuses",
    {},
    {
      repeat: { pattern: "0 5 * * *" },
      jobId: "operations:contribution_due_statuses",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );

  await queue.add(
    "autopay",
    {},
    {
      repeat: { pattern: "0 8 * * *" },
      jobId: "operations:autopay",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );

  await queue.add(
    "pending_order_expiry",
    {},
    {
      repeat: { pattern: "*/5 * * * *" },
      jobId: "operations:pending_order_expiry",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );

  await queue.add(
    "balance_snapshots",
    {},
    {
      repeat: { pattern: "0 2 * * *" },
      jobId: "operations:balance_snapshots",
      removeOnComplete: true,
      removeOnFail: 20,
    },
  );
}

export function startWorkers(): Worker[] {
  const connection = getQueueConnection();
  if (!connection) {
    return [];
  }

  const notificationWorker = new Worker(
    QUEUE_NAMES.notifications,
    async (job) => {
      switch (job.name as NotificationJobName) {
        case "send":
          await processNotification(job.data.notificationId as string);
          break;
        case "contribution_reminders":
          await processContributionReminders();
          break;
        case "scheduled":
          await processScheduledNotifications();
          break;
        case "gold_rate_alerts":
          await processGoldRateAlerts();
          break;
        default:
          break;
      }
    },
    { connection },
  );

  const auraWorker = new Worker(
    QUEUE_NAMES.aura,
    async (job) => {
      if (job.name === "insight") {
        await processAuraInsight(job.data.userId as string);
      }
    },
    { connection },
  );

  const operationsWorker = new Worker(
    QUEUE_NAMES.operations,
    async (job) => {
      switch (job.name as OperationsJobName) {
        case "autopay":
          await processDueAutopayContributions();
          break;
        case "contribution_due_statuses":
          await processContributionDueStatuses();
          break;
        case "pending_order_expiry":
          await processExpiredPendingOrders();
          break;
        case "balance_snapshots":
          await refreshBalanceSnapshots();
          break;
        default:
          break;
      }
    },
    { connection },
  );

  for (const worker of [notificationWorker, auraWorker, operationsWorker]) {
    worker.on("failed", (job, error) => {
      console.error(
        `[worker] job ${job?.queueName}:${job?.id ?? "unknown"} failed:`,
        error.message,
      );
    });
  }

  return [notificationWorker, auraWorker, operationsWorker];
}

export async function closeQueues(): Promise<void> {
  await notificationsQueue?.close();
  await auraQueue?.close();
  await operationsQueue?.close();
  notificationsQueue = undefined;
  auraQueue = undefined;
  operationsQueue = undefined;
}

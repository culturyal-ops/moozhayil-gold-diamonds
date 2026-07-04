import { loadEnv } from "../../config/env";
import { prisma } from "../../db/prisma";
import { withRetry } from "../../utils/retry";
import { getFirebaseMessaging } from "./firebase.admin";

export interface PushPayload {
  title: string;
  body: string;
  deepLink?: string | null;
}

export interface PushSendResult {
  successCount: number;
  failureCount: number;
  invalidTokens: string[];
  deliverableFailure: boolean;
}

const INVALID_TOKEN_ERRORS = new Set([
  "messaging/invalid-registration-token",
  "messaging/registration-token-not-registered",
]);

export class PushClient {
  async sendToTokens(
    tokens: string[],
    payload: PushPayload,
  ): Promise<PushSendResult> {
    const env = loadEnv();
    if (env.NODE_ENV === "test" || env.FIREBASE_MODE === "mock") {
      void payload;
      return {
        successCount: tokens.length,
        failureCount: 0,
        invalidTokens: [],
        deliverableFailure: false,
      };
    }

    if (tokens.length === 0) {
      return {
        successCount: 0,
        failureCount: 0,
        invalidTokens: [],
        deliverableFailure: false,
      };
    }

    const messaging = getFirebaseMessaging();
    const invalidTokens: string[] = [];
    let successCount = 0;
    let deliverableFailure = false;

    for (const token of tokens) {
      try {
        await withRetry(
          async () => {
            await messaging.send({
              token,
              notification: {
                title: payload.title,
                body: payload.body,
              },
              data: payload.deepLink
                ? { deep_link: payload.deepLink }
                : undefined,
            });
          },
          {
            maxAttempts: 3,
            initialDelayMs: 300,
            maxDelayMs: 3_000,
          },
        );
        successCount += 1;
      } catch (error) {
        const code =
          typeof error === "object" &&
          error !== null &&
          "code" in error &&
          typeof error.code === "string"
            ? error.code
            : null;

        if (code && INVALID_TOKEN_ERRORS.has(code)) {
          invalidTokens.push(token);
          continue;
        }

        deliverableFailure = true;
      }
    }

    if (invalidTokens.length > 0) {
      await prisma.userDevice.updateMany({
        where: { pushToken: { in: invalidTokens } },
        data: { disabledAt: new Date() },
      });
    }

    return {
      successCount,
      failureCount: tokens.length - successCount,
      invalidTokens,
      deliverableFailure,
    };
  }
}

export const pushClient = new PushClient();

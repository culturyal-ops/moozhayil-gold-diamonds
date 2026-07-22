import { loadEnv } from "../config/env";
import { logger } from "./logger";

/**
 * Error monitoring — Sentry integration.
 *
 * To activate:
 *   1. npm install @sentry/node --save  (in apps/api)
 *   2. Set SENTRY_DSN in your environment file.
 *   3. Uncomment the Sentry import and init block below.
 *
 * import * as Sentry from "@sentry/node";
 */

let sentryInitialized = false;

export function initMonitoring(): void {
  const env = loadEnv();

  if (!env.SENTRY_DSN || sentryInitialized) {
    if (!env.SENTRY_DSN) {
      logger.warn("[monitoring] SENTRY_DSN not set — error reporting disabled");
    }
    return;
  }

  /**
   * Uncomment when @sentry/node is installed:
   *
   * Sentry.init({
   *   dsn: env.SENTRY_DSN,
   *   environment: env.NODE_ENV,
   *   tracesSampleRate: env.NODE_ENV === "production" ? 0.1 : 1.0,
   *   integrations: [
   *     Sentry.httpIntegration(),
   *     Sentry.expressIntegration(),
   *   ],
   * });
   */

  logger.info("[monitoring] Sentry DSN configured — install @sentry/node to activate", {
    environment: env.NODE_ENV,
  });
  sentryInitialized = true;
}

export function captureException(error: unknown, context?: Record<string, unknown>): void {
  const env = loadEnv();

  /**
   * Uncomment when @sentry/node is installed:
   *
   * if (env.SENTRY_DSN) {
   *   Sentry.withScope((scope) => {
   *     if (context) scope.setExtras(context);
   *     Sentry.captureException(error);
   *   });
   * }
   */

  logger.error("[monitoring] captured exception", {
    error: error instanceof Error ? error.message : String(error),
    stack: error instanceof Error ? error.stack : undefined,
    ...context,
    sentryConfigured: Boolean(env.SENTRY_DSN),
  });
}

export function captureMessage(message: string, context?: Record<string, unknown>): void {
  /**
   * Uncomment when @sentry/node is installed:
   *
   * if (loadEnv().SENTRY_DSN) {
   *   Sentry.captureMessage(message, { extra: context });
   * }
   */

  logger.warn("[monitoring] captured message", {
    message,
    ...context,
  });
}

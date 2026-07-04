import { loadEnv } from "../config/env";
import { logger } from "./logger";

let sentryInitialized = false;

export function initMonitoring(): void {
  const env = loadEnv();

  if (!env.SENTRY_DSN || sentryInitialized) {
    return;
  }

  logger.info("[monitoring] Sentry DSN configured; hook ready for SDK wiring", {
    environment: env.NODE_ENV,
  });
  sentryInitialized = true;
}

export function captureException(error: unknown, context?: Record<string, unknown>): void {
  const env = loadEnv();

  logger.error("[monitoring] captured exception", {
    error: error instanceof Error ? error.message : String(error),
    stack: error instanceof Error ? error.stack : undefined,
    ...context,
    sentryConfigured: Boolean(env.SENTRY_DSN),
  });
}

export function captureMessage(message: string, context?: Record<string, unknown>): void {
  logger.warn("[monitoring] captured message", {
    message,
    ...context,
  });
}

import { createHmac, timingSafeEqual } from "crypto";
import { loadEnv } from "../../config/env";

export function verifyWebhookSignature(
  rawBody: string,
  signature: string | undefined,
  secret: string | undefined,
): boolean {
  if (!secret || !signature) {
    return process.env.NODE_ENV !== "production";
  }

  const digest = createHmac("sha256", secret).update(rawBody).digest("hex");
  const expected = Buffer.from(digest);
  const provided = Buffer.from(signature);

  if (expected.length !== provided.length) {
    return false;
  }

  return timingSafeEqual(expected, provided);
}

export function verifyKycWebhookSignature(
  rawBody: string,
  signature: string | undefined,
): boolean {
  const env = loadEnv();
  if (env.NODE_ENV === "production" && !env.KYC_WEBHOOK_SECRET) {
    return false;
  }

  return verifyWebhookSignature(
    rawBody,
    signature,
    env.KYC_WEBHOOK_SECRET,
  );
}

export function verifyGoldRateWebhookSignature(
  rawBody: string,
  signature: string | undefined,
): boolean {
  const env = loadEnv();
  if (env.NODE_ENV === "production" && !env.GOLD_RATE_WEBHOOK_SECRET) {
    return false;
  }

  return verifyWebhookSignature(
    rawBody,
    signature,
    env.GOLD_RATE_WEBHOOK_SECRET,
  );
}

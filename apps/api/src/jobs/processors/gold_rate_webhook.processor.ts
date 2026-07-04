import { prisma } from "../../db/prisma";
import { goldRateOverrideService } from "../../modules/admin/gold_rate_override.service";

export async function processGoldRateWebhookEvent(
  eventId: string,
): Promise<void> {
  const event = await prisma.webhookEvent.findUnique({
    where: { id: eventId },
  });

  if (!event || !event.signatureValid) {
    return;
  }

  const payload = event.payload as Record<string, unknown>;
  const data =
    payload.data && typeof payload.data === "object"
      ? (payload.data as Record<string, unknown>)
      : payload;

  const purity =
    typeof data.purity === "string"
      ? data.purity
      : typeof payload.purity === "string"
        ? payload.purity
        : null;
  const ratePaise =
    typeof data.rate_per_gram_paise === "number"
      ? data.rate_per_gram_paise
      : typeof payload.rate_per_gram_paise === "number"
        ? payload.rate_per_gram_paise
        : null;

  if (!purity || ratePaise === null) {
    await prisma.webhookEvent.update({
      where: { id: eventId },
      data: {
        status: "failed",
        processedAt: new Date(),
        errorMessage: "Missing purity or rate in gold-rate webhook payload",
      },
    });
    return;
  }

  try {
    await goldRateOverrideService.applyWebhookRate({
      purity,
      ratePerGramPaise: ratePaise,
      source: "provider_webhook",
      corrected: event.eventType === "rate.corrected",
    });

    await prisma.webhookEvent.update({
      where: { id: eventId },
      data: { status: "processed", processedAt: new Date() },
    });
  } catch (error) {
    await prisma.webhookEvent.update({
      where: { id: eventId },
      data: {
        status: "failed",
        processedAt: new Date(),
        errorMessage:
          error instanceof Error
            ? error.message
            : "Gold rate webhook processing failed",
      },
    });
    throw error;
  }
}

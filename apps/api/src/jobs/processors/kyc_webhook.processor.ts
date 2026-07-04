import { prisma } from "../../db/prisma";
import { kycService } from "../../modules/kyc/kyc.service";

export async function processKycWebhookEvent(eventId: string): Promise<void> {
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

  const userId =
    typeof data.user_id === "string"
      ? data.user_id
      : typeof payload.user_id === "string"
        ? payload.user_id
        : null;

  if (!userId) {
    await prisma.webhookEvent.update({
      where: { id: eventId },
      data: {
        status: "failed",
        processedAt: new Date(),
        errorMessage: "Missing user_id in KYC webhook payload",
      },
    });
    return;
  }

  try {
    switch (event.eventType) {
      case "aadhaar.verified":
        await prisma.kycDocument.updateMany({
          where: { userId },
          data: { aadhaarVerified: true },
        });
        break;
      case "pan.verified":
        await prisma.kycDocument.updateMany({
          where: { userId },
          data: { panVerified: true },
        });
        break;
      case "selfie.verified":
        await prisma.kycDocument.updateMany({
          where: { userId },
          data: { selfieVerified: true },
        });
        break;
      case "kyc.approved": {
        const doc = await prisma.kycDocument.findUnique({ where: { userId } });
        if (doc) {
          const tier = kycService.resolveVerifiedTier(doc);
          await prisma.user.update({
            where: { id: userId },
            data: { kycStatus: tier, kycVerifiedAt: new Date() },
          });
        }
        break;
      }
      case "kyc.rejected":
        await prisma.user.update({
          where: { id: userId },
          data: { kycStatus: "rejected" },
        });
        break;
      default:
        break;
    }

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
          error instanceof Error ? error.message : "KYC webhook processing failed",
      },
    });
    throw error;
  }
}

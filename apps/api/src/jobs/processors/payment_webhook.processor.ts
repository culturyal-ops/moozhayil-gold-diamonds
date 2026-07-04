import { prisma } from "../../db/prisma";
import {
  applyPaymentCaptureByProviderOrder,
  applyPaymentFailure,
} from "../../modules/payments/payment_completion.service";
import { processRefundCompleted } from "./refund.processor";

export async function processPaymentWebhookEvent(eventId: string): Promise<void> {
  const event = await prisma.webhookEvent.findUnique({
    where: { id: eventId },
  });

  if (!event || !event.signatureValid) {
    return;
  }

  await prisma.webhookEvent.update({
    where: { id: eventId },
    data: { status: "processing" },
  });

  try {
    const payload = event.payload as {
      event?: string;
      payload?: {
        payment?: {
          entity?: {
            order_id?: string;
            id?: string;
            status?: string;
          };
        };
        refund?: {
          entity?: {
            payment_id?: string;
            id?: string;
            status?: string;
          };
        };
      };
    };

    if (payload.event === "payment.captured") {
      const providerOrderId = payload.payload?.payment?.entity?.order_id;
      const providerPaymentId = payload.payload?.payment?.entity?.id;

      if (providerOrderId) {
        await applyPaymentCaptureByProviderOrder({
          providerOrderId,
          providerPaymentId,
          finalStatus: "captured",
        });
      }
    }

    if (payload.event === "payment.failed") {
      const providerOrderId = payload.payload?.payment?.entity?.order_id;
      if (providerOrderId) {
        await applyPaymentFailure(providerOrderId);
      }
    }

    if (payload.event === "refund.processed") {
      const providerPaymentId = payload.payload?.refund?.entity?.payment_id;
      if (providerPaymentId) {
        const paymentTx = await prisma.paymentTransaction.findFirst({
          where: { providerPaymentId },
        });

        if (paymentTx) {
          const order = await prisma.order.findFirst({
            where: { paymentTransactionId: paymentTx.id },
          });

          if (order) {
            await processRefundCompleted(order.id);
          }
        }
      }
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
        errorMessage: error instanceof Error ? error.message : "Webhook failed",
      },
    });
  }
}

export async function processMockWebhookCapture(paymentTransactionId: string) {
  const paymentTx = await prisma.paymentTransaction.findUnique({
    where: { id: paymentTransactionId },
  });

  if (!paymentTx?.providerOrderId) {
    return;
  }

  await processPaymentWebhookEvent(
    (
      await prisma.webhookEvent.create({
        data: {
          provider: "razorpay",
          providerEventId: `mock_evt_${paymentTransactionId}`,
          eventType: "payment.captured",
          status: "received",
          payload: {
            event: "payment.captured",
            payload: {
              payment: {
                entity: {
                  order_id: paymentTx.providerOrderId,
                  id: `mock_pay_${paymentTransactionId}`,
                  status: "captured",
                },
              },
            },
          },
          signatureValid: true,
          receivedAt: new Date(),
        },
      })
    ).id,
  );
}

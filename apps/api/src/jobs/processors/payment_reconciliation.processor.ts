import { randomUUID } from "crypto";
import { prisma } from "../../db/prisma";
import { paymentProviderClient } from "../../modules/payments/payment_provider.client";
import { applyPaymentCapture } from "../../modules/payments/payment_completion.service";

export async function processPaymentReconciliation(
  paymentTransactionId: string,
): Promise<string> {
  const jobId = `job_${randomUUID()}`;

  const paymentTx = await prisma.paymentTransaction.findUnique({
    where: { id: paymentTransactionId },
  });

  if (!paymentTx) {
    return jobId;
  }

  if (paymentTx.status === "captured" || paymentTx.status === "reconciled") {
    return jobId;
  }

  if (paymentTx.providerOrderId) {
    const capture = await paymentProviderClient.capturePayment(
      paymentTx.providerOrderId,
    );

    if (capture.status === "captured") {
      await applyPaymentCapture({
        paymentTransactionId: paymentTx.id,
        providerPaymentId: capture.providerPaymentId,
        finalStatus: "reconciled",
      });
    } else {
      await prisma.paymentTransaction.update({
        where: { id: paymentTx.id },
        data: {
          status: "failed",
          providerPaymentId: capture.providerPaymentId,
        },
      });
    }
  }

  return jobId;
}

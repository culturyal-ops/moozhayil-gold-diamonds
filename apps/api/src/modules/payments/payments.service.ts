import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { applyPaymentCapture } from "../payments/payment_completion.service";
import { paymentProviderClient } from "./payment_provider.client";
import type { CaptureCheckoutInput, CreatePaymentMethodInput } from "./payments.schema";
import { processPaymentReconciliation } from "../../jobs/processors/payment_reconciliation.processor";

function paymentMethodDto(method: {
  id: string;
  type: string;
  displayLabel: string;
  isDefault: boolean;
  isAutopayEnabled: boolean;
}) {
  return {
    id: method.id,
    type: method.type,
    display_label: method.displayLabel,
    is_default: method.isDefault,
    is_autopay_enabled: method.isAutopayEnabled,
  };
}

export class PaymentsService {
  verifyUpi(upiId: string) {
    const verified = paymentProviderClient.verifyUpiId(upiId);
    if (!verified) {
      throw new AppError(422, "UNPROCESSABLE", "Invalid UPI ID format");
    }

    return {
      verified: true,
      display_label: `UPI: ${upiId}`,
    };
  }

  async listMethods(userId: string) {
    const methods = await prisma.paymentMethod.findMany({
      where: { userId, deletedAt: null },
      orderBy: [{ isDefault: "desc" }, { createdAt: "desc" }],
    });

    return { payment_methods: methods.map(paymentMethodDto) };
  }

  async createMethod(userId: string, input: CreatePaymentMethodInput) {
    if (input.is_default) {
      await prisma.paymentMethod.updateMany({
        where: { userId, deletedAt: null },
        data: { isDefault: false },
      });
    }

    const existingCount = await prisma.paymentMethod.count({
      where: { userId, deletedAt: null },
    });

    const method = await prisma.paymentMethod.create({
      data: {
        userId,
        type: input.type,
        providerToken: input.provider_token,
        displayLabel: input.display_label,
        isDefault: input.is_default ?? existingCount === 0,
      },
    });

    return paymentMethodDto(method);
  }

  async deleteMethod(userId: string, methodId: string) {
    const method = await prisma.paymentMethod.findFirst({
      where: { id: methodId, userId, deletedAt: null },
    });

    if (!method) {
      throw new AppError(404, "NOT_FOUND", "Payment method does not exist");
    }

    await prisma.paymentMethod.update({
      where: { id: methodId },
      data: { deletedAt: new Date(), isDefault: false },
    });

    return { success: true };
  }

  async reconcilePayment(paymentTransactionId: string) {
    const jobId = await processPaymentReconciliation(paymentTransactionId);
    return { success: true, job_id: jobId };
  }

  async captureCheckout(userId: string, input: CaptureCheckoutInput) {
    const paymentTx = await prisma.paymentTransaction.findFirst({
      where: { id: input.payment_session_id, userId },
    });

    if (!paymentTx) {
      throw new AppError(404, "NOT_FOUND", "Payment session not found");
    }

    if (paymentTx.status === "captured" || paymentTx.status === "reconciled") {
      return { success: true, already_captured: true };
    }

    const signatureValid = paymentProviderClient.verifyCheckoutSignature({
      orderId: input.razorpay_order_id,
      paymentId: input.razorpay_payment_id,
      signature: input.razorpay_signature,
    });

    if (!signatureValid) {
      throw new AppError(400, "BAD_REQUEST", "Invalid payment signature");
    }

    await applyPaymentCapture({
      paymentTransactionId: paymentTx.id,
      providerPaymentId: input.razorpay_payment_id,
    });

    return { success: true, already_captured: false };
  }
}

export const paymentsService = new PaymentsService();

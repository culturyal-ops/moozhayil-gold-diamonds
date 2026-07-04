import { randomUUID } from "crypto";
import { loadEnv } from "../../config/env";
import {
  captureRazorpayPayment,
  createRazorpayOrder,
  createRazorpayRefund,
  verifyRazorpayCheckoutSignature,
  verifyRazorpayWebhookSignature,
} from "./razorpay.client";

export interface ProviderOrderResult {
  providerOrderId: string;
  amountPaise: number;
}

export interface ProviderPaymentCaptureResult {
  providerPaymentId: string;
  status: "captured" | "failed";
}

export interface ProviderRefundResult {
  providerRefundId: string;
  status: string;
}

export class PaymentProviderClient {
  verifyWebhookSignature(payload: string, signature: string | undefined): boolean {
    const env = loadEnv();

    if (env.PAYMENT_PROVIDER_MODE === "mock") {
      if (env.NODE_ENV === "production") {
        return false;
      }

      return (
        signature === "mock_valid_signature" ||
        signature === env.RAZORPAY_WEBHOOK_SECRET
      );
    }

    return verifyRazorpayWebhookSignature(payload, signature);
  }

  verifyCheckoutSignature(input: {
    orderId: string;
    paymentId: string;
    signature: string;
  }): boolean {
    const env = loadEnv();

    if (env.PAYMENT_PROVIDER_MODE === "mock") {
      return env.NODE_ENV !== "production";
    }

    return verifyRazorpayCheckoutSignature(input);
  }

  async createOrder(input: {
    amountPaise: number;
    receipt: string;
  }): Promise<ProviderOrderResult> {
    const env = loadEnv();

    if (env.PAYMENT_PROVIDER_MODE === "mock") {
      return {
        providerOrderId: `mock_order_${randomUUID()}`,
        amountPaise: input.amountPaise,
      };
    }

    return createRazorpayOrder(input);
  }

  async capturePayment(
    providerOrderId: string,
  ): Promise<ProviderPaymentCaptureResult> {
    const env = loadEnv();

    if (env.PAYMENT_PROVIDER_MODE === "mock") {
      return {
        providerPaymentId: `mock_pay_${providerOrderId}`,
        status: "captured",
      };
    }

    return captureRazorpayPayment(providerOrderId);
  }

  verifyUpiId(upiId: string): boolean {
    return /^[a-zA-Z0-9._-]{2,}@[a-zA-Z0-9.-]+$/.test(upiId);
  }

  async createRefund(input: {
    providerPaymentId: string;
    amountPaise: number;
  }): Promise<ProviderRefundResult> {
    const env = loadEnv();

    if (env.PAYMENT_PROVIDER_MODE === "mock") {
      if (env.NODE_ENV === "production") {
        throw new Error("Mock refunds are disabled in production");
      }

      return {
        providerRefundId: `mock_refund_${randomUUID()}`,
        status: "processed",
      };
    }

    return createRazorpayRefund(input);
  }
}

export const paymentProviderClient = new PaymentProviderClient();

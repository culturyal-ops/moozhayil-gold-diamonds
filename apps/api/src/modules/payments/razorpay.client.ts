import { createHmac, timingSafeEqual } from "crypto";
import { loadEnv } from "../../config/env";
import { AppError } from "../../middleware/error.middleware";
import { withRetry } from "../../utils/retry";

const RAZORPAY_API_BASE = "https://api.razorpay.com/v1";

interface RazorpayOrderResponse {
  id: string;
  amount: number;
  currency: string;
  receipt?: string;
}

interface RazorpayPaymentEntity {
  id: string;
  status: string;
  order_id?: string;
  amount?: number;
}

interface RazorpayPaymentListResponse {
  items: RazorpayPaymentEntity[];
}

interface RazorpayCaptureResponse {
  id: string;
  status: string;
}

function requireRazorpayCredentials() {
  const env = loadEnv();

  if (!env.RAZORPAY_KEY_ID || !env.RAZORPAY_KEY_SECRET) {
    throw new AppError(
      503,
      "PROVIDER_UNAVAILABLE",
      "Razorpay credentials are not configured",
    );
  }

  return {
    keyId: env.RAZORPAY_KEY_ID,
    keySecret: env.RAZORPAY_KEY_SECRET,
    webhookSecret: env.RAZORPAY_WEBHOOK_SECRET,
  };
}

function authorizationHeader(keyId: string, keySecret: string): string {
  return `Basic ${Buffer.from(`${keyId}:${keySecret}`).toString("base64")}`;
}

async function razorpayRequest<T>(
  method: "GET" | "POST",
  path: string,
  body?: Record<string, unknown>,
): Promise<T> {
  const { keyId, keySecret } = requireRazorpayCredentials();

  return withRetry(async () => {
    const response = await fetch(`${RAZORPAY_API_BASE}${path}`, {
      method,
      headers: {
        Authorization: authorizationHeader(keyId, keySecret),
        "Content-Type": "application/json",
      },
      body: body ? JSON.stringify(body) : undefined,
    });

    if (!response.ok) {
      const errorBody = await response.text();
      throw new Error(
        `Razorpay ${method} ${path} failed (${response.status}): ${errorBody}`,
      );
    }

    return (await response.json()) as T;
  });
}

export async function createRazorpayOrder(input: {
  amountPaise: number;
  receipt: string;
}): Promise<{ providerOrderId: string; amountPaise: number }> {
  const order = await razorpayRequest<RazorpayOrderResponse>("POST", "/orders", {
    amount: input.amountPaise,
    currency: "INR",
    receipt: input.receipt,
    payment_capture: 1,
  });

  return {
    providerOrderId: order.id,
    amountPaise: order.amount,
  };
}

export async function captureRazorpayPayment(
  providerOrderId: string,
): Promise<{ providerPaymentId: string; status: "captured" | "failed" }> {
  const payments = await razorpayRequest<RazorpayPaymentListResponse>(
    "GET",
    `/orders/${providerOrderId}/payments`,
  );

  const payment =
    payments.items.find((item) => item.status === "authorized") ??
    payments.items.find((item) => item.status === "created") ??
    payments.items[0];

  if (!payment) {
    const captured = payments.items.find((item) => item.status === "captured");
    if (captured) {
      return {
        providerPaymentId: captured.id,
        status: "captured",
      };
    }

    return {
      providerPaymentId: `missing_${providerOrderId}`,
      status: "failed",
    };
  }

  if (payment.status === "captured") {
    return {
      providerPaymentId: payment.id,
      status: "captured",
    };
  }

  const capture = await razorpayRequest<RazorpayCaptureResponse>(
    "POST",
    `/payments/${payment.id}/capture`,
    {
      amount: payment.amount,
      currency: "INR",
    },
  );

  return {
    providerPaymentId: capture.id,
    status: capture.status === "captured" ? "captured" : "failed",
  };
}

interface RazorpayRefundResponse {
  id: string;
  status: string;
  amount: number;
}

export async function createRazorpayRefund(input: {
  providerPaymentId: string;
  amountPaise: number;
}): Promise<{ providerRefundId: string; status: string }> {
  const refund = await razorpayRequest<RazorpayRefundResponse>(
    "POST",
    `/payments/${input.providerPaymentId}/refund`,
    {
      amount: input.amountPaise,
    },
  );

  return {
    providerRefundId: refund.id,
    status: refund.status,
  };
}

export function verifyRazorpayWebhookSignature(
  payload: string,
  signature: string | undefined,
): boolean {
  const { webhookSecret } = requireRazorpayCredentials();

  if (!signature || !webhookSecret) {
    return false;
  }

  const expected = createHmac("sha256", webhookSecret)
    .update(payload)
    .digest("hex");

  const expectedBuffer = Buffer.from(expected, "utf8");
  const signatureBuffer = Buffer.from(signature, "utf8");

  if (expectedBuffer.length !== signatureBuffer.length) {
    return false;
  }

  return timingSafeEqual(expectedBuffer, signatureBuffer);
}

export function verifyRazorpayCheckoutSignature(input: {
  orderId: string;
  paymentId: string;
  signature: string;
}): boolean {
  const { keySecret } = requireRazorpayCredentials();
  const expected = createHmac("sha256", keySecret)
    .update(`${input.orderId}|${input.paymentId}`)
    .digest("hex");

  const expectedBuffer = Buffer.from(expected, "utf8");
  const signatureBuffer = Buffer.from(input.signature, "utf8");

  if (expectedBuffer.length !== signatureBuffer.length) {
    return false;
  }

  return timingSafeEqual(expectedBuffer, signatureBuffer);
}

import { loadEnv } from "../../config/env";
import { AppError } from "../../middleware/error.middleware";
import { withRetry } from "../../utils/retry";

const MSG91_OTP_URL = "https://control.msg91.com/api/v5/otp";

function requireMsg91Credentials() {
  const env = loadEnv();

  if (!env.MSG91_AUTH_KEY || !env.MSG91_OTP_TEMPLATE_ID) {
    throw new AppError(
      503,
      "PROVIDER_UNAVAILABLE",
      "SMS provider credentials are not configured",
    );
  }

  return {
    authKey: env.MSG91_AUTH_KEY,
    templateId: env.MSG91_OTP_TEMPLATE_ID,
  };
}

/** MSG91 expects mobile as 91XXXXXXXXXX (no + prefix). */
export function formatPhoneForMsg91(phone: string): string {
  const digits = phone.replace(/\D/g, "");
  if (digits.length === 10) {
    return `91${digits}`;
  }
  if (digits.length === 12 && digits.startsWith("91")) {
    return digits;
  }

  throw new AppError(
    422,
    "UNPROCESSABLE",
    "Enter a valid Indian phone number",
  );
}

export async function sendMsg91Otp(input: {
  phone: string;
  otp: string;
}): Promise<void> {
  const { authKey, templateId } = requireMsg91Credentials();
  const mobile = formatPhoneForMsg91(input.phone);

  await withRetry(async () => {
    const url = new URL(MSG91_OTP_URL);
    url.searchParams.set("otp", input.otp);
    url.searchParams.set("mobile", mobile);

    const response = await fetch(url, {
      method: "POST",
      headers: {
        authkey: authKey,
        "content-type": "application/json",
        accept: "application/json",
      },
      body: JSON.stringify({
        template_id: templateId,
      }),
    });

    if (!response.ok) {
      const body = await response.text().catch(() => "");
      throw new Error(
        `MSG91 OTP request failed (${response.status}): ${body.slice(0, 200)}`,
      );
    }

    let payload: unknown;
    try {
      payload = await response.json();
    } catch {
      return;
    }

    if (
      payload &&
      typeof payload === "object" &&
      "type" in payload &&
      payload.type === "error"
    ) {
      const message =
        "message" in payload && typeof payload.message === "string"
          ? payload.message
          : "MSG91 rejected OTP dispatch";
      throw new Error(message);
    }
  });
}

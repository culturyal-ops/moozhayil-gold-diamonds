import { api } from "../api";
import type { SchemePlanId } from "../config/schemes";

export interface EnrollSchemePayload {
  scheme_type: SchemePlanId;
  goal_type: "wedding" | "investment" | "festival" | "gift" | "family" | "other";
  name: string;
  monthly_amount_paise: number;
  duration_months: number;
  start_date: string;
  target_amount_paise?: number;
  target_product_id?: string;
}

export interface EnrollSchemeResponse {
  goal: {
    id: string;
    name: string;
    scheme_type: string;
    status: string;
    monthly_amount_paise: number;
  };
  first_contribution_scheduled: string;
}

export interface ShowroomPaymentPayload {
  amount_paise: number;
  payment_channel: "cash" | "upi" | "bank_transfer" | "cheque" | "other";
  reference_number?: string;
  remarks?: string;
}

export interface GoalContributionsResponse {
  goal: {
    id: string;
    name: string;
    scheme_type: string;
    user_id: string;
    status: string;
  };
  contributions: Array<{
    id: string;
    amount_paise: number;
    amount_display: string;
    status: string;
    type: string;
    contribution_month: string;
    completed_at: string | null;
    grams_credited: string | null;
  }>;
}

function adminHeaders(idempotencyKey: string, stepUp = false): HeadersInit {
  const headers: Record<string, string> = {
    "Idempotency-Key": idempotencyKey,
  };
  if (stepUp) {
    headers["X-Admin-Step-Up"] = localStorage.getItem("moozhayil_step_up") ?? "";
  }
  return headers;
}

export async function enrollCustomerInScheme(
  userId: string,
  payload: EnrollSchemePayload,
  idempotencyKey: string,
) {
  return api<EnrollSchemeResponse>(`/v1/admin/users/${userId}/goals`, {
    method: "POST",
    headers: adminHeaders(idempotencyKey),
    body: JSON.stringify(payload),
  });
}

export async function recordShowroomPayment(
  goalId: string,
  payload: ShowroomPaymentPayload,
  idempotencyKey: string,
) {
  return api<{ contribution: { id: string; status: string; amount_display: string } }>(
    `/v1/admin/goals/${goalId}/contributions/manual`,
    {
      method: "POST",
      headers: adminHeaders(idempotencyKey, true),
      body: JSON.stringify(payload),
    },
  );
}

export async function listGoalContributions(goalId: string) {
  return api<GoalContributionsResponse>(`/v1/admin/goals/${goalId}/contributions`);
}

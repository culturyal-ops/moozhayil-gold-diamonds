import { api } from "../api";

function stepUpHeaders(): HeadersInit {
  return {
    "X-Admin-Step-Up": localStorage.getItem("moozhayil_step_up") ?? "",
  };
}

export interface SarReview {
  id: string;
  order_id: string;
  order_number: string;
  total_paise: number;
  order_status: string;
  user_id: string;
  status: string;
  created_at: string;
}

export async function listSarReviews() {
  return api<{ reviews: SarReview[] }>("/v1/admin/sar-reviews");
}

export async function decideSarReview(
  reviewId: string,
  decision: "approved" | "rejected",
  reason?: string,
) {
  return api<{ success: boolean; status: string }>(
    `/v1/admin/sar-reviews/${reviewId}/decision`,
    {
      method: "POST",
      headers: stepUpHeaders(),
      body: JSON.stringify({ decision, reason }),
    },
  );
}

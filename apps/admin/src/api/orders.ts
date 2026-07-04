import { api } from "../api";

export interface OrderListItem {
  id: string;
  order_number: string;
  status: string;
  status_display: string;
  total_paise: number;
  total_display: string;
  ordered_at: string;
  sar_review_status: string | null;
  sar_required: boolean;
}

export interface OrderDetail {
  order: OrderListItem & {
    shipped_at: string | null;
    delivered_at: string | null;
    cancelled_at: string | null;
    cancellation_reason: string | null;
    notes: string | null;
    gold_value_paise: number;
    making_charges_paise: number;
    gst_paise: number;
    making_charge_waiver_display: string | null;
    payment_method: string;
    gold_balance_used_grams: string;
    allowed_status_transitions: string[];
    items: Array<{
      product_id: string;
      product_name: string;
      product_image: string | null;
      quantity: number;
      unit_price_paise: number;
      unit_price_display: string;
    }>;
  };
  customer: {
    id: string;
    name: string | null;
    phone: string;
    kyc_status: string;
  };
  delivery_address: {
    full_name: string | null;
    phone: string | null;
    line1: string | null;
    line2: string | null;
    city: string | null;
    state: string | null;
    pincode: string | null;
  } | null;
}

export async function listOrders(params?: { status?: string; cursor?: string }) {
  const search = new URLSearchParams();
  if (params?.status) search.set("status", params.status);
  if (params?.cursor) search.set("cursor", params.cursor);
  const suffix = search.toString() ? `?${search.toString()}` : "";
  return api<{ orders: OrderListItem[]; next_cursor: string | null }>(
    `/v1/admin/orders${suffix}`,
  );
}

export async function getOrder(id: string) {
  return api<OrderDetail>(`/v1/admin/orders/${id}`);
}

export async function updateOrderStatus(
  id: string,
  payload: { status: string; reason?: string; tracking?: string },
) {
  return api(`/v1/admin/orders/${id}/status`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

export async function refundOrder(id: string, reason: string) {
  return api(`/v1/admin/orders/${id}/refund`, {
    method: "POST",
    headers: {
      "Idempotency-Key": `refund:${id}:${Date.now()}`,
      "X-Admin-Step-Up": localStorage.getItem("moozhayil_step_up") ?? "",
    },
    body: JSON.stringify({ reason }),
  });
}

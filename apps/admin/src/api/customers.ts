import { api } from "../api";

export interface CustomerListItem {
  id: string;
  name: string | null;
  phone: string;
  kyc_status: string;
  member_since: string;
  last_active_at: string | null;
  active_schemes: number;
  orders_count: number;
  gold_balance_grams: string;
}

export interface CustomerListResponse {
  users: CustomerListItem[];
  next_cursor: string | null;
}

export interface CustomerDetail {
  user: {
    id: string;
    name: string | null;
    phone_masked: string;
    email: string | null;
    city: string | null;
    kyc_status: string;
    kyc_verified_at: string | null;
    member_since: string;
    last_active_at: string | null;
    referral_code: string | null;
    created_at: string;
  };
  my_gold: {
    balance_grams: string;
  };
  active_schemes: Array<{
    id: string;
    name: string;
    scheme_type: string;
    scheme_display: string;
    status: string;
    monthly_amount_paise: number;
    start_date: string;
    next_contribution_date: string;
  }>;
  schemes: Array<{
    id: string;
    name: string;
    scheme_type: string;
    scheme_display: string;
    status: string;
    monthly_amount_paise: number;
    start_date: string;
  }>;
  orders: Array<{
    id: string;
    order_number: string;
    status: string;
    status_display: string;
    total_paise: number;
    total_display: string;
    ordered_at: string;
  }>;
  orders_by_status: Record<string, number>;
  addresses: Array<{
    id: string;
    label: string | null;
    full_name: string;
    phone: string;
    line1: string;
    line2: string | null;
    city: string;
    state: string;
    pincode: string;
    is_default: boolean;
  }>;
  dream_vault_items: number;
  ledger_entries: Array<{
    id: string;
    entry_type: string;
    grams_delta: string;
    amount_paise: number | null;
    posted_at: string | null;
    source_type: string;
  }>;
}

export async function listCustomers(params: {
  query?: string;
  cursor?: string;
  limit?: number;
}) {
  const search = new URLSearchParams();
  if (params.query) search.set("query", params.query);
  if (params.cursor) search.set("cursor", params.cursor);
  if (params.limit) search.set("limit", String(params.limit));
  const suffix = search.toString() ? `?${search.toString()}` : "";
  return api<CustomerListResponse>(`/v1/admin/users${suffix}`);
}

export async function getCustomer(id: string) {
  return api<CustomerDetail>(`/v1/admin/users/${id}`);
}

export async function createCustomer(payload: {
  phone: string;
  name: string;
  email?: string;
  city?: string;
}) {
  return api<{ user: CustomerListItem }>("/v1/admin/users", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

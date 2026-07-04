import { api } from "../api";

export interface InventoryItem {
  id: string;
  sku: string;
  name: string;
  stock_quantity: number;
  is_published: boolean;
}

export interface InventoryReservation {
  id: string;
  product_id: string;
  product_sku: string;
  product_name: string;
  user_id: string;
  order_id: string | null;
  quantity: number;
  status: string;
  expires_at: string;
}

export async function listInventory(params?: {
  lowStockOnly?: boolean;
  cursor?: string;
}) {
  const search = new URLSearchParams();
  if (params?.lowStockOnly) search.set("low_stock_only", "true");
  if (params?.cursor) search.set("cursor", params.cursor);
  const suffix = search.toString() ? `?${search.toString()}` : "";
  return api<{ inventory: InventoryItem[]; next_cursor: string | null }>(
    `/v1/admin/inventory${suffix}`,
  );
}

export async function updateInventoryStock(
  productId: string,
  payload: { stock_quantity: number; reason: string },
) {
  return api<{ product: { id: string; sku: string; stock_quantity: number } }>(
    `/v1/admin/inventory/${productId}`,
    {
      method: "PATCH",
      body: JSON.stringify(payload),
    },
  );
}

export async function listInventoryReservations() {
  return api<{ reservations: InventoryReservation[] }>(
    "/v1/admin/inventory/reservations",
  );
}

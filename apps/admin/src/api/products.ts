import { api } from "../api";
import type { AdminProduct } from "../config/catalog";

export async function listProducts(query = "") {
  return api<{ products: AdminProduct[]; next_cursor: string | null }>(
    `/v1/admin/products${query}`,
  );
}

export async function getProduct(id: string) {
  return api<{ product: AdminProduct }>(`/v1/admin/products/${id}`);
}

export async function createProduct(payload: Record<string, unknown>) {
  return api<{ product: AdminProduct }>("/v1/admin/products", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

export async function updateProduct(id: string, payload: Record<string, unknown>) {
  return api<{ product: AdminProduct }>(`/v1/admin/products/${id}`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

export async function publishProduct(id: string) {
  return api<{ product: AdminProduct }>(`/v1/admin/products/${id}/publish`, {
    method: "POST",
  });
}

export async function addProductImage(
  productId: string,
  payload: Record<string, unknown>,
) {
  return api<{ image: ProductImageResponse }>(
    `/v1/admin/products/${productId}/images`,
    {
      method: "POST",
      body: JSON.stringify(payload),
    },
  );
}

interface ProductImageResponse {
  id: string;
  url: string;
  type: string;
  sort_order: number;
  is_primary: boolean;
}

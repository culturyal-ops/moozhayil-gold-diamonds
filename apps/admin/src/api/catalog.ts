import { api } from "../api";
import type {
  CategoryRecord,
  CollectionRecord,
  OccasionRecord,
} from "../config/catalog";

export async function listCategories() {
  return api<{ categories: CategoryRecord[] }>("/v1/admin/categories");
}

export async function createCategory(payload: Record<string, unknown>) {
  return api<{ category: CategoryRecord }>("/v1/admin/categories", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

export async function updateCategory(id: string, payload: Record<string, unknown>) {
  return api<{ category: CategoryRecord }>(`/v1/admin/categories/${id}`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

export async function listCollections() {
  return api<{ collections: CollectionRecord[] }>("/v1/admin/collections");
}

export async function createCollection(payload: Record<string, unknown>) {
  return api<{ collection: CollectionRecord }>("/v1/admin/collections", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

export async function updateCollection(id: string, payload: Record<string, unknown>) {
  return api<{ collection: CollectionRecord }>(`/v1/admin/collections/${id}`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

export async function listOccasions() {
  return api<{ occasions: OccasionRecord[] }>("/v1/admin/occasions");
}

export async function createOccasion(payload: Record<string, unknown>) {
  return api<{ occasion: OccasionRecord }>("/v1/admin/occasions", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

export async function updateOccasion(id: string, payload: Record<string, unknown>) {
  return api<{ occasion: OccasionRecord }>(`/v1/admin/occasions/${id}`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

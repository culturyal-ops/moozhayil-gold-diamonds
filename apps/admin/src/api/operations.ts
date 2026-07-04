import { api } from "../api";

export interface ServiceablePincode {
  id: string;
  pincode: string;
  city: string;
  state: string;
  serviceable: boolean;
  estimated_delivery_days: number | null;
  pickup_available: boolean;
}

export interface StoreLocation {
  id: string;
  name: string;
  address: string;
  city: string;
  state: string;
  pincode: string;
  phone: string;
  latitude: number;
  longitude: number;
  opening_hours: Record<string, unknown>;
  is_active: boolean;
}

export async function listServiceablePincodes() {
  return api<{ pincodes: ServiceablePincode[] }>("/v1/admin/operations/pincodes");
}

export async function createServiceablePincode(input: {
  pincode: string;
  city: string;
  state: string;
  serviceable: boolean;
  estimated_delivery_days?: number;
  pickup_available: boolean;
}) {
  return api<{ pincode: ServiceablePincode }>("/v1/admin/operations/pincodes", {
    method: "POST",
    body: JSON.stringify(input),
  });
}

export async function importServiceablePincodes(
  pincodes: Array<{
    pincode: string;
    city: string;
    state: string;
    serviceable: boolean;
    estimated_delivery_days?: number;
    pickup_available: boolean;
  }>,
) {
  return api<{ created: number; updated: number; total: number }>(
    "/v1/admin/operations/pincodes/import",
    {
      method: "POST",
      body: JSON.stringify({ pincodes }),
    },
  );
}

export async function deleteServiceablePincode(id: string) {
  return api<{ success: boolean }>(`/v1/admin/operations/pincodes/${id}`, {
    method: "DELETE",
  });
}

export async function listStoreLocations() {
  return api<{ stores: StoreLocation[] }>("/v1/admin/operations/stores");
}

export async function createStoreLocation(input: {
  name: string;
  address: string;
  city: string;
  state: string;
  pincode: string;
  phone: string;
  latitude: number;
  longitude: number;
  opening_hours: Record<string, unknown>;
  is_active: boolean;
}) {
  return api<{ store: StoreLocation }>("/v1/admin/operations/stores", {
    method: "POST",
    body: JSON.stringify(input),
  });
}

export async function updateStoreLocation(
  id: string,
  input: Partial<{
    name: string;
    address: string;
    city: string;
    state: string;
    pincode: string;
    phone: string;
    latitude: number;
    longitude: number;
    opening_hours: Record<string, unknown>;
    is_active: boolean;
  }>,
) {
  return api<{ store: StoreLocation }>(`/v1/admin/operations/stores/${id}`, {
    method: "PATCH",
    body: JSON.stringify(input),
  });
}

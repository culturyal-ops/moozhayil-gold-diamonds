import { api } from "../api";
import type { AdminBanner } from "../config/cms";

export async function listBanners() {
  return api<{ banners: AdminBanner[] }>("/v1/admin/banners");
}

export async function createBanner(payload: Record<string, unknown>) {
  return api<{ banner: AdminBanner }>("/v1/admin/banners", {
    method: "POST",
    body: JSON.stringify(payload),
  });
}

export async function updateBanner(id: string, payload: Record<string, unknown>) {
  return api<{ banner: AdminBanner }>(`/v1/admin/banners/${id}`, {
    method: "PATCH",
    body: JSON.stringify(payload),
  });
}

export async function setBannerActive(id: string, isActive: boolean) {
  return updateBanner(id, { is_active: isActive });
}

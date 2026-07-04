import { ApiError, loadSession } from "../api";

const API_BASE = import.meta.env.VITE_API_BASE ?? "";

export async function uploadAdminMedia(
  file: File,
  folder: "banners" | "products",
): Promise<{ url: string; path: string }> {
  const session = loadSession();
  const form = new FormData();
  form.append("file", file);

  const response = await fetch(
    `${API_BASE}/v1/admin/uploads?folder=${folder}`,
    {
      method: "POST",
      headers: session?.accessToken
        ? { Authorization: `Bearer ${session.accessToken}` }
        : undefined,
      body: form,
    },
  );

  if (!response.ok) {
    const body = (await response.json().catch(() => ({}))) as {
      message?: string;
    };
    throw new ApiError(body.message ?? `Upload failed (${response.status})`, response.status);
  }

  return response.json() as Promise<{ url: string; path: string }>;
}

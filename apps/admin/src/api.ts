const API_BASE = import.meta.env.VITE_API_BASE ?? "";

export interface AdminSession {
  accessToken: string;
  admin: {
    id: string;
    email: string;
    name: string;
    role: string;
  };
}

const TOKEN_KEY = "moozhayil_admin_token";
const ADMIN_KEY = "moozhayil_admin_profile";
const STEP_UP_KEY = "moozhayil_step_up";

export class ApiError extends Error {
  status: number;

  constructor(message: string, status: number) {
    super(message);
    this.name = "ApiError";
    this.status = status;
  }
}

export function loadSession(): AdminSession | null {
  const accessToken = localStorage.getItem(TOKEN_KEY);
  const adminRaw = localStorage.getItem(ADMIN_KEY);
  if (!accessToken || !adminRaw) return null;
  return { accessToken, admin: JSON.parse(adminRaw) as AdminSession["admin"] };
}

export function saveSession(session: AdminSession) {
  localStorage.setItem(TOKEN_KEY, session.accessToken);
  localStorage.setItem(ADMIN_KEY, JSON.stringify(session.admin));
}

export function clearSession() {
  localStorage.removeItem(TOKEN_KEY);
  localStorage.removeItem(ADMIN_KEY);
  localStorage.removeItem(STEP_UP_KEY);
}

function redirectToLogin() {
  if (window.location.pathname !== "/login") {
    window.location.replace("/login");
  }
}

export async function api<T>(
  path: string,
  options: RequestInit = {},
): Promise<T> {
  const session = loadSession();
  const headers = new Headers(options.headers);
  headers.set("Content-Type", "application/json");
  if (session?.accessToken) {
    headers.set("Authorization", `Bearer ${session.accessToken}`);
  }

  const response = await fetch(`${API_BASE}${path}`, {
    ...options,
    headers,
  });

  if (!response.ok) {
    const body = (await response.json().catch(() => ({}))) as {
      message?: string;
    };
    const message = body.message ?? `Request failed (${response.status})`;

    if (response.status === 401 && !path.includes("/auth/login")) {
      clearSession();
      redirectToLogin();
    }

    throw new ApiError(message, response.status);
  }

  return response.json() as Promise<T>;
}

export async function login(email: string, password: string) {
  const result = await api<{
    access_token: string;
    admin: AdminSession["admin"];
  }>("/v1/admin/auth/login", {
    method: "POST",
    body: JSON.stringify({ email, password }),
  });

  const session = { accessToken: result.access_token, admin: result.admin };
  saveSession(session);
  return session;
}

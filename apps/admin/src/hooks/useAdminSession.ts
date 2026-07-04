import { loadSession } from "../api";
import {
  canAccessNav,
  canAccessPath,
  getVisibleNavItems,
  type AdminRole,
  type NavItem,
} from "../config/navigation";

export function useAdminSession() {
  const session = loadSession();
  const role = session?.admin.role ?? null;

  return {
    session,
    role,
    isAuthenticated: Boolean(session),
    visibleNavItems: role ? getVisibleNavItems(role) : ([] as NavItem[]),
    canAccess: (allowedRoles: AdminRole[]) =>
      role ? canAccessNav(role, allowedRoles) : false,
    canAccessPath: (pathname: string) =>
      role ? canAccessPath(role, pathname) : false,
  };
}

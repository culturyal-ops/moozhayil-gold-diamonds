import { Navigate } from "react-router-dom";
import { canAccessNav } from "../config/navigation";
import { useAdminSession } from "../hooks/useAdminSession";
import { DashboardPage } from "../pages/dashboard";

const DASHBOARD_ROLES = [
  "super_admin",
  "catalog_manager",
  "order_manager",
  "finance_manager",
  "auditor",
  "support_agent",
] as const;

/** Sends roles without dashboard access (e.g. kyc_reviewer) to their first nav item. */
export function HomeRoute() {
  const { role, visibleNavItems } = useAdminSession();

  if (!role) {
    return <Navigate to="/login" replace />;
  }

  if (!canAccessNav(role, [...DASHBOARD_ROLES])) {
    const fallback = visibleNavItems.find((item) => item.to !== "/");
    if (fallback) {
      return <Navigate to={fallback.to} replace />;
    }
  }

  return <DashboardPage />;
}

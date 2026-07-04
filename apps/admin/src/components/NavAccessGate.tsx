import type { ReactNode } from "react";
import { useLocation } from "react-router-dom";
import { canAccessPath } from "../config/navigation";
import { useAdminSession } from "../hooks/useAdminSession";
import { EmptyState } from "./EmptyState";

interface NavAccessGateProps {
  children: ReactNode;
}

/** Blocks pages the signed-in admin role cannot view (matches API RBAC). */
export function NavAccessGate({ children }: NavAccessGateProps) {
  const { role } = useAdminSession();
  const { pathname } = useLocation();

  if (!role || !canAccessPath(role, pathname)) {
    return (
      <div className="page">
        <EmptyState
          title="Access restricted"
          description="Your admin role does not include this section. Use the sidebar to open an available area, or contact a super admin if you need access."
        />
      </div>
    );
  }

  return <>{children}</>;
}

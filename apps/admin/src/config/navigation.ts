/**
 * Admin navigation — labels and role visibility aligned with GET routes in
 * apps/api/src/modules/admin/admin.routes.ts (super_admin bypasses all checks).
 */

export type AdminRole =
  | "super_admin"
  | "catalog_manager"
  | "kyc_reviewer"
  | "order_manager"
  | "finance_manager"
  | "support_agent"
  | "auditor";

export type NavGroup = "core" | "operations" | "finance" | "system";

export interface NavItem {
  to: string;
  label: string;
  end?: boolean;
  group: NavGroup;
  roles: AdminRole[];
}

const ALL_ROLES: AdminRole[] = [
  "super_admin",
  "catalog_manager",
  "kyc_reviewer",
  "order_manager",
  "finance_manager",
  "support_agent",
  "auditor",
];

export const NAV_GROUP_LABELS: Record<NavGroup, string> = {
  core: "Core",
  operations: "Operations",
  finance: "Finance & compliance",
  system: "System",
};

/** Order matches the operational sidebar spec. */
export const NAV_ITEMS: NavItem[] = [
  {
    to: "/",
    label: "Dashboard",
    end: true,
    group: "core",
    roles: [
      "super_admin",
      "catalog_manager",
      "order_manager",
      "finance_manager",
      "auditor",
      "support_agent",
    ],
  },
  {
    to: "/catalogue",
    label: "Catalogue",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/cms",
    label: "Banners / CMS",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/products",
    label: "Products",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/categories",
    label: "Categories",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/collections",
    label: "Collections",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/occasions",
    label: "Occasions",
    group: "core",
    roles: ["catalog_manager", "auditor"],
  },
  {
    to: "/inventory",
    label: "Inventory",
    group: "core",
    roles: ["catalog_manager", "order_manager", "auditor"],
  },
  {
    to: "/operations",
    label: "Operations",
    group: "operations",
    roles: ["order_manager", "super_admin", "catalog_manager"],
  },
  {
    to: "/orders",
    label: "Orders",
    group: "operations",
    roles: ["order_manager", "support_agent", "auditor"],
  },
  {
    to: "/users",
    label: "Customers",
    group: "operations",
    roles: ["support_agent", "auditor"],
  },
  {
    to: "/plans",
    label: "Schemes",
    group: "operations",
    roles: ["support_agent", "order_manager"],
  },
  {
    to: "/kyc",
    label: "KYC Reviews",
    group: "operations",
    roles: ["kyc_reviewer", "auditor"],
  },
  {
    to: "/gold-rates",
    label: "Gold Rates",
    group: "finance",
    roles: ["finance_manager", "auditor"],
  },
  {
    to: "/refunds",
    label: "Refunds",
    group: "finance",
    roles: ["finance_manager", "auditor"],
  },
  {
    to: "/sar-reviews",
    label: "SAR Reviews",
    group: "finance",
    roles: ["finance_manager", "super_admin", "auditor"],
  },
  {
    to: "/audit-logs",
    label: "Audit Logs",
    group: "finance",
    roles: ["auditor"],
  },
  {
    to: "/notifications",
    label: "Notifications",
    group: "system",
    roles: ["support_agent", "auditor"],
  },
  {
    to: "/settings",
    label: "Settings",
    group: "system",
    roles: ALL_ROLES,
  },
];

export function canAccessNav(role: string, allowedRoles: AdminRole[]): boolean {
  if (role === "super_admin") {
    return true;
  }

  return allowedRoles.includes(role as AdminRole);
}

export function getVisibleNavItems(role: string): NavItem[] {
  return NAV_ITEMS.filter((item) => canAccessNav(role, item.roles));
}

export function getNavItemByPath(pathname: string): NavItem | undefined {
  if (pathname === "/") {
    return NAV_ITEMS.find((item) => item.to === "/");
  }

  return NAV_ITEMS.find(
    (item) => item.to !== "/" && pathname.startsWith(item.to),
  );
}

export function canAccessPath(role: string, pathname: string): boolean {
  const item = getNavItemByPath(pathname);
  if (!item) {
    return true;
  }

  return canAccessNav(role, item.roles);
}

export function formatAdminRole(role: string): string {
  return role.replace(/_/g, " ").replace(/\b\w/g, (char) => char.toUpperCase());
}

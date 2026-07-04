import { NavLink, useNavigate } from "react-router-dom";
import { clearSession } from "../api";
import {
  NAV_GROUP_LABELS,
  formatAdminRole,
  type NavGroup,
  type NavItem,
} from "../config/navigation";
import { useAdminSession } from "../hooks/useAdminSession";
import { BrandMark } from "./BrandMark";
import { getNavIconName, NavIcon, UserAvatar } from "./NavIcon";

interface SidebarProps {
  onNavigate?: () => void;
}

export function Sidebar({ onNavigate }: SidebarProps) {
  const { session, visibleNavItems } = useAdminSession();
  const navigate = useNavigate();
  const groupedItems = groupNavItems(visibleNavItems);

  return (
    <aside className="sidebar">
      <div className="sidebar__brand">
        <BrandMark compact variant="inverse" />
        <p className="sidebar__brand-tag">Private office</p>
      </div>

      <nav className="sidebar__nav" aria-label="Admin navigation">
        {groupedItems.map(({ group, items }) => (
          <div key={group} className="sidebar__group">
            <p className="sidebar__group-label">{NAV_GROUP_LABELS[group]}</p>
            <ul className="sidebar__list">
              {items.map((item) => (
                <li key={item.to}>
                  <NavLink
                    to={item.to}
                    end={item.end}
                    className={({ isActive }) =>
                      `sidebar__link${isActive ? " sidebar__link--active" : ""}`
                    }
                    onClick={onNavigate}
                  >
                    <span className="sidebar__link-icon">
                      <NavIcon name={getNavIconName(item.to)} />
                    </span>
                    <span className="sidebar__link-text">{item.label}</span>
                  </NavLink>
                </li>
              ))}
            </ul>
          </div>
        ))}
      </nav>

      <div className="sidebar__footer">
        {session ? (
          <div className="sidebar__user-card">
            <UserAvatar name={session.admin.name} />
            <div className="sidebar__user-meta">
              <p className="sidebar__user-name">{session.admin.name}</p>
              <p className="sidebar__user-role">
                {formatAdminRole(session.admin.role)}
              </p>
            </div>
          </div>
        ) : null}

        <button
          type="button"
          className="sidebar__sign-out"
          onClick={() => {
            clearSession();
            navigate("/login");
          }}
        >
          Sign out
        </button>
      </div>
    </aside>
  );
}

function groupNavItems(items: NavItem[]): Array<{ group: NavGroup; items: NavItem[] }> {
  const order: NavGroup[] = ["core", "operations", "finance", "system"];

  return order
    .map((group) => ({
      group,
      items: items.filter((item) => item.group === group),
    }))
    .filter((entry) => entry.items.length > 0);
}

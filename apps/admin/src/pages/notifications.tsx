import { useCallback, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { api } from "../api";
import { EmptyState } from "../components/EmptyState";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { StatusBadge } from "../components/StatusBadge";

interface NotificationRow {
  id: string;
  user_id: string;
  type: string;
  title: string;
  is_sent: boolean;
  created_at: string;
}

export function NotificationsPage() {
  const [notifications, setNotifications] = useState<NotificationRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const result = await api<{ notifications: NotificationRow[] }>(
        "/v1/admin/notifications",
      );
      setNotifications(result.notifications);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load notifications");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void load();
  }, [load]);

  return (
    <div className="page">
      <PageHeader
        eyebrow="System"
        title="Notifications"
        subtitle="Recent outbound customer notifications and delivery status."
      />

      {loading ? <LoadingState label="Loading notifications…" /> : null}
      {error ? <p className="error">{error}</p> : null}

      {!loading && !error ? (
        <Panel title="Recent notifications">
          {notifications.length === 0 ? (
            <EmptyState
              title="No notifications"
              description="Triggered notifications will appear here."
            />
          ) : (
            <table className="data-table">
              <thead>
                <tr>
                  <th>Time</th>
                  <th>Customer</th>
                  <th>Type</th>
                  <th>Title</th>
                  <th>Sent</th>
                </tr>
              </thead>
              <tbody>
                {notifications.map((row) => (
                  <tr key={row.id}>
                    <td>{new Date(row.created_at).toLocaleString()}</td>
                    <td>
                      <Link to={`/users/${row.user_id}`}>View customer</Link>
                    </td>
                    <td>{row.type.replace(/_/g, " ")}</td>
                    <td>{row.title}</td>
                    <td>
                      <StatusBadge tone={row.is_sent ? "success" : "pending"}>
                        {row.is_sent ? "Sent" : "Queued"}
                      </StatusBadge>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </Panel>
      ) : null}
    </div>
  );
}

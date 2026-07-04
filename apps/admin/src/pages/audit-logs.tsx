import { useCallback, useEffect, useState } from "react";
import { api } from "../api";
import { EmptyState } from "../components/EmptyState";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";

interface AuditLog {
  id: string;
  action: string;
  entity_type: string;
  actor_type: string;
  created_at: string;
}

export function AuditLogsPage() {
  const [logs, setLogs] = useState<AuditLog[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const result = await api<{ logs: AuditLog[] }>("/v1/admin/audit-logs");
      setLogs(result.logs);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load audit logs");
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
        eyebrow="Finance & compliance"
        title="Audit Logs"
        subtitle="Immutable record of admin, system, and customer-impacting actions."
      />

      {loading ? <LoadingState label="Loading audit trail…" /> : null}
      {error ? <p className="error">{error}</p> : null}

      {!loading && !error ? (
        <Panel title="Recent events">
          {logs.length === 0 ? (
            <EmptyState title="No audit events" description="Activity will appear here." />
          ) : (
            <table className="data-table">
              <thead>
                <tr>
                  <th>Time</th>
                  <th>Actor</th>
                  <th>Action</th>
                  <th>Entity</th>
                </tr>
              </thead>
              <tbody>
                {logs.map((log) => (
                  <tr key={log.id}>
                    <td>{new Date(log.created_at).toLocaleString()}</td>
                    <td>{log.actor_type}</td>
                    <td>{log.action.replace(/_/g, " ")}</td>
                    <td>{log.entity_type}</td>
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

import { useCallback, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import { api } from "../api";
import { Button } from "../components/Button";
import { EmptyState } from "../components/EmptyState";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { StatusBadge } from "../components/StatusBadge";

interface Adjustment {
  id: string;
  user_id: string;
  grams_delta: string;
  status: string;
  reason: string;
}

export function RefundsPage() {
  const [orders, setOrders] = useState<
    Array<{ id: string; order_number: string; status: string }>
  >([]);
  const [adjustments, setAdjustments] = useState<Adjustment[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const [orderResult, adjustmentResult] = await Promise.all([
        api<{ orders: Array<{ id: string; order_number: string; status: string }> }>(
          "/v1/admin/orders?status=confirmed",
        ),
        api<{ adjustments: Adjustment[] }>("/v1/admin/ledger-adjustments"),
      ]);
      setOrders(orderResult.orders);
      setAdjustments(adjustmentResult.adjustments);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load finance data");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void load();
  }, [load]);

  const initiateRefund = async (orderId: string) => {
    setMessage(null);
    try {
      await api(`/v1/admin/orders/${orderId}/refund`, {
        method: "POST",
        headers: {
          "Idempotency-Key": `refund:${orderId}`,
          "X-Admin-Step-Up": localStorage.getItem("moozhayil_step_up") ?? "",
        },
        body: JSON.stringify({ reason: "Admin refund" }),
      });
      setMessage("Refund initiated.");
      await load();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : "Refund failed");
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Finance & compliance"
        title="Refunds & Ledger"
        subtitle="Initiate order refunds and review pending My Gold ledger adjustments."
      />

      {loading ? <LoadingState label="Loading finance data…" /> : null}
      {error ? <p className="error">{error}</p> : null}
      {message ? <p className="muted">{message}</p> : null}

      {!loading && !error ? (
        <>
          <Panel title="Recent confirmed orders">
            {orders.length === 0 ? (
              <EmptyState
                title="No confirmed orders"
                description="Confirmed orders eligible for refund appear here."
              />
            ) : (
              <table className="data-table">
                <thead>
                  <tr>
                    <th>Order</th>
                    <th>Status</th>
                    <th>Refund</th>
                  </tr>
                </thead>
                <tbody>
                  {orders.map((order) => (
                    <tr key={order.id}>
                      <td>
                        <Link to={`/orders/${order.id}`}>{order.order_number}</Link>
                      </td>
                      <td>
                        <StatusBadge tone="pending">
                          {order.status.replace(/_/g, " ")}
                        </StatusBadge>
                      </td>
                      <td>
                        <Button
                          type="button"
                          variant="secondary"
                          onClick={() => void initiateRefund(order.id)}
                        >
                          Initiate refund
                        </Button>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </Panel>

          <Panel title="Ledger adjustments">
            {adjustments.length === 0 ? (
              <EmptyState
                title="No adjustments"
                description="Manual gram adjustments requested by finance appear here."
              />
            ) : (
              <table className="data-table">
                <thead>
                  <tr>
                    <th>Customer</th>
                    <th>Grams</th>
                    <th>Status</th>
                    <th>Reason</th>
                  </tr>
                </thead>
                <tbody>
                  {adjustments.map((row) => (
                    <tr key={row.id}>
                      <td>
                        <Link to={`/users/${row.user_id}`}>{row.user_id}</Link>
                      </td>
                      <td>{row.grams_delta} g</td>
                      <td>{row.status.replace(/_/g, " ")}</td>
                      <td>{row.reason}</td>
                    </tr>
                  ))}
                </tbody>
              </table>
            )}
          </Panel>
        </>
      ) : null}
    </div>
  );
}

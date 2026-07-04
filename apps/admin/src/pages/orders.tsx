import { useCallback, useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import {
  getOrder,
  listOrders,
  refundOrder,
  updateOrderStatus,
  type OrderDetail,
  type OrderListItem,
} from "../api/orders";
import { Button } from "../components/Button";
import { EmptyState } from "../components/EmptyState";
import { Input } from "../components/Input";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { StatusBadge } from "../components/StatusBadge";

const STATUS_FILTER_OPTIONS = [
  { value: "", label: "All statuses" },
  { value: "confirmed", label: "Confirmed" },
  { value: "processing", label: "Processing" },
  { value: "shipped", label: "Shipped" },
  { value: "delivered", label: "Delivered" },
  { value: "cancelled", label: "Cancelled" },
];

function orderStatusTone(status: string): "success" | "pending" | "error" {
  if (status === "delivered") return "success";
  if (status === "cancelled" || status === "delivery_failed") return "error";
  return "pending";
}

export function OrdersPage() {
  const [orders, setOrders] = useState<OrderListItem[]>([]);
  const [statusFilter, setStatusFilter] = useState("");
  const [nextCursor, setNextCursor] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const loadOrders = useCallback(
    async (cursor?: string, append = false) => {
      if (append) setLoadingMore(true);
      else setLoading(true);
      setError(null);

      try {
        const result = await listOrders({
          status: statusFilter || undefined,
          cursor,
        });
        setOrders((current) =>
          append ? [...current, ...result.orders] : result.orders,
        );
        setNextCursor(result.next_cursor);
      } catch (err) {
        setError(err instanceof Error ? err.message : "Failed to load orders");
      } finally {
        setLoading(false);
        setLoadingMore(false);
      }
    },
    [statusFilter],
  );

  useEffect(() => {
    void loadOrders();
  }, [loadOrders]);

  return (
    <div className="page">
      <PageHeader
        eyebrow="Operations"
        title="Orders"
        subtitle="Track fulfilment, SAR holds, and delivery status."
      />

      <Panel title="Order list">
        <div className="page-toolbar">
          <label className="field">
            <span className="field__label">Filter by status</span>
            <select
              value={statusFilter}
              onChange={(event) => setStatusFilter(event.target.value)}
            >
              {STATUS_FILTER_OPTIONS.map((option) => (
                <option key={option.value || "all"} value={option.value}>
                  {option.label}
                </option>
              ))}
            </select>
          </label>
        </div>

        {loading ? <LoadingState label="Loading orders…" /> : null}
        {error ? <p className="error">{error}</p> : null}

        {!loading && !error && orders.length === 0 ? (
          <EmptyState title="No orders" description="No orders match this filter." />
        ) : null}

        {!loading && orders.length > 0 ? (
          <>
            <table className="data-table">
              <thead>
                <tr>
                  <th>Order</th>
                  <th>Status</th>
                  <th>Total</th>
                  <th>Ordered</th>
                  <th>SAR</th>
                  <th />
                </tr>
              </thead>
              <tbody>
                {orders.map((order) => (
                  <tr key={order.id}>
                    <td>{order.order_number}</td>
                    <td>
                      <StatusBadge tone={orderStatusTone(order.status)}>
                        {order.status_display}
                      </StatusBadge>
                    </td>
                    <td>{order.total_display}</td>
                    <td>{new Date(order.ordered_at).toLocaleString()}</td>
                    <td>
                      {order.sar_required
                        ? (order.sar_review_status ?? "pending")
                        : "—"}
                    </td>
                    <td>
                      <Link to={`/orders/${order.id}`} className="btn btn--secondary">
                        View
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>

            {nextCursor ? (
              <div className="page-toolbar">
                <Button
                  type="button"
                  variant="secondary"
                  loading={loadingMore}
                  onClick={() => void loadOrders(nextCursor, true)}
                >
                  Load more
                </Button>
              </div>
            ) : null}
          </>
        ) : null}
      </Panel>
    </div>
  );
}

export function OrderDetailPage() {
  const { id } = useParams<{ id: string }>();
  const [detail, setDetail] = useState<OrderDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [actionError, setActionError] = useState<string | null>(null);
  const [nextStatus, setNextStatus] = useState("");
  const [tracking, setTracking] = useState("");
  const [reason, setReason] = useState("");
  const [saving, setSaving] = useState(false);

  const load = useCallback(async () => {
    if (!id) return;
    setLoading(true);
    setError(null);
    try {
      const result = await getOrder(id);
      setDetail(result);
      setNextStatus(result.order.allowed_status_transitions[0] ?? "");
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load order");
    } finally {
      setLoading(false);
    }
  }, [id]);

  useEffect(() => {
    void load();
  }, [load]);

  const handleStatusUpdate = async () => {
    if (!id || !nextStatus) return;
    setSaving(true);
    setActionError(null);
    try {
      await updateOrderStatus(id, {
        status: nextStatus,
        tracking: tracking.trim() || undefined,
        reason: reason.trim() || undefined,
      });
      await load();
    } catch (err) {
      setActionError(err instanceof Error ? err.message : "Status update failed");
    } finally {
      setSaving(false);
    }
  };

  const handleRefund = async () => {
    if (!id) return;
    setSaving(true);
    setActionError(null);
    try {
      await refundOrder(id, reason.trim() || "Admin refund");
      await load();
    } catch (err) {
      setActionError(err instanceof Error ? err.message : "Refund failed");
    } finally {
      setSaving(false);
    }
  };

  const order = detail?.order;
  const address = detail?.delivery_address;

  return (
    <div className="page">
      <PageHeader
        eyebrow="Operations"
        title={order?.order_number ?? "Order"}
        subtitle={order?.status_display ?? "Order detail"}
        action={
          <Link to="/orders" className="btn btn--secondary">
            Back to orders
          </Link>
        }
      />

      {loading ? <LoadingState label="Loading order…" /> : null}
      {error ? <p className="error">{error}</p> : null}
      {actionError ? <p className="error">{actionError}</p> : null}

      {detail ? (
        <>
          {order?.sar_required && order.sar_review_status !== "approved" ? (
            <div className="login-card__alert" role="alert">
              SAR review must be approved before processing, shipping, or delivery.
            </div>
          ) : null}

          <div className="grid-2">
            <Panel title="Summary">
              <dl className="detail-list">
                <DetailRow
                  label="Status"
                  value={
                    <StatusBadge tone={orderStatusTone(order!.status)}>
                      {order!.status_display}
                    </StatusBadge>
                  }
                />
                <DetailRow label="Total" value={order!.total_display} />
                <DetailRow label="Gold value" value={`₹${(order!.gold_value_paise / 100).toFixed(2)}`} />
                <DetailRow label="Making charges" value={`₹${(order!.making_charges_paise / 100).toFixed(2)}`} />
                <DetailRow label="GST" value={`₹${(order!.gst_paise / 100).toFixed(2)}`} />
                <DetailRow
                  label="My Gold used"
                  value={`${order!.gold_balance_used_grams} g`}
                />
                <DetailRow label="Payment method" value={order!.payment_method} />
                <DetailRow
                  label="Ordered"
                  value={new Date(order!.ordered_at).toLocaleString()}
                />
                {order!.shipped_at ? (
                  <DetailRow
                    label="Shipped"
                    value={new Date(order!.shipped_at).toLocaleString()}
                  />
                ) : null}
                {order!.delivered_at ? (
                  <DetailRow
                    label="Delivered"
                    value={new Date(order!.delivered_at).toLocaleString()}
                  />
                ) : null}
              </dl>
            </Panel>

            <Panel title="Customer">
              <dl className="detail-list">
                <DetailRow
                  label="Name"
                  value={
                    <Link to={`/users/${detail.customer.id}`}>
                      {detail.customer.name ?? "Member"}
                    </Link>
                  }
                />
                <DetailRow label="Phone" value={detail.customer.phone} />
                <DetailRow label="KYC" value={detail.customer.kyc_status.replace(/_/g, " ")} />
              </dl>
            </Panel>
          </div>

          <div className="grid-2">
            <Panel title="Delivery address">
              {address ? (
                <dl className="detail-list">
                  <DetailRow label="Name" value={address.full_name ?? "—"} />
                  <DetailRow label="Phone" value={address.phone ?? "—"} />
                  <DetailRow label="Address" value={address.line1 ?? "—"} />
                  {address.line2 ? (
                    <DetailRow label="Line 2" value={address.line2} />
                  ) : null}
                  <DetailRow
                    label="City"
                    value={`${address.city ?? "—"}, ${address.state ?? "—"} ${address.pincode ?? ""}`}
                  />
                </dl>
              ) : (
                <p className="muted">No delivery address on file.</p>
              )}
            </Panel>

            <Panel title="Update status">
              {order!.allowed_status_transitions.length > 0 ? (
                <div className="banner-form">
                  <label className="field">
                    <span className="field__label">Next status</span>
                    <select
                      value={nextStatus}
                      onChange={(event) => setNextStatus(event.target.value)}
                      disabled={saving}
                    >
                      {order!.allowed_status_transitions.map((status) => (
                        <option key={status} value={status}>
                          {status.replace(/_/g, " ")}
                        </option>
                      ))}
                    </select>
                  </label>
                  {nextStatus === "shipped" ? (
                    <Input
                      label="Tracking notes"
                      value={tracking}
                      onChange={(event) => setTracking(event.target.value)}
                      disabled={saving}
                    />
                  ) : null}
                  {nextStatus === "cancelled" ? (
                    <Input
                      label="Cancellation reason"
                      value={reason}
                      onChange={(event) => setReason(event.target.value)}
                      disabled={saving}
                    />
                  ) : null}
                  <div className="banner-form__actions">
                    <Button
                      type="button"
                      loading={saving}
                      onClick={() => void handleStatusUpdate()}
                    >
                      Update status
                    </Button>
                  </div>
                </div>
              ) : (
                <p className="muted">No further status transitions available.</p>
              )}

              {!["cancelled", "refunded", "refund_initiated"].includes(order!.status) ? (
                <div className="banner-form__actions">
                  <Button
                    type="button"
                    variant="danger"
                    loading={saving}
                    onClick={() => void handleRefund()}
                  >
                    Initiate refund
                  </Button>
                  <p className="muted">Requires step-up token from Settings.</p>
                </div>
              ) : null}
            </Panel>
          </div>

          <Panel title="Line items">
            <table className="data-table">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Qty</th>
                  <th>Unit price</th>
                </tr>
              </thead>
              <tbody>
                {order!.items.map((item) => (
                  <tr key={`${item.product_id}-${item.unit_price_paise}`}>
                    <td>{item.product_name}</td>
                    <td>{item.quantity}</td>
                    <td>{item.unit_price_display}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </Panel>
        </>
      ) : null}
    </div>
  );
}

function DetailRow({
  label,
  value,
}: {
  label: string;
  value: import("react").ReactNode;
}) {
  return (
    <div className="detail-list__row">
      <dt>{label}</dt>
      <dd>{value}</dd>
    </div>
  );
}

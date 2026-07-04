import { useCallback, useEffect, useState } from "react";
import { Link } from "react-router-dom";
import {
  decideSarReview,
  listSarReviews,
  type SarReview,
} from "../api/sar";
import { Button } from "../components/Button";
import { EmptyState } from "../components/EmptyState";
import { Input } from "../components/Input";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { StatusBadge } from "../components/StatusBadge";

function formatRupees(paise: number): string {
  return `₹${(paise / 100).toLocaleString("en-IN")}`;
}

export function SarReviewsPage() {
  const [reviews, setReviews] = useState<SarReview[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [actionError, setActionError] = useState<string | null>(null);
  const [actingOn, setActingOn] = useState<string | null>(null);
  const [rejectingId, setRejectingId] = useState<string | null>(null);
  const [rejectReason, setRejectReason] = useState("");

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const result = await listSarReviews();
      setReviews(result.reviews);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load SAR queue");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void load();
  }, [load]);

  const handleDecision = async (
    reviewId: string,
    decision: "approved" | "rejected",
    reason?: string,
  ) => {
    setActingOn(reviewId);
    setActionError(null);
    try {
      await decideSarReview(reviewId, decision, reason);
      setRejectingId(null);
      setRejectReason("");
      await load();
    } catch (err) {
      setActionError(err instanceof Error ? err.message : "Decision failed");
    } finally {
      setActingOn(null);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Finance & compliance"
        title="SAR Reviews"
        subtitle="Review high-value orders flagged for suspicious activity reporting. Decisions require a step-up token from Settings."
      />

      {loading ? <LoadingState label="Loading SAR queue…" /> : null}
      {error ? <p className="error">{error}</p> : null}
      {actionError ? <p className="error">{actionError}</p> : null}

      {!loading && !error && reviews.length === 0 ? (
        <EmptyState
          title="Queue clear"
          description="No orders awaiting SAR review."
        />
      ) : null}

      {!loading && reviews.length > 0 ? (
        <Panel title="Pending reviews">
          <table className="data-table">
            <thead>
              <tr>
                <th>Order</th>
                <th>Customer</th>
                <th>Total</th>
                <th>Order status</th>
                <th>Flagged</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {reviews.map((review) => (
                <tr key={review.id}>
                  <td>
                    <Link to={`/orders/${review.order_id}`}>
                      {review.order_number}
                    </Link>
                  </td>
                  <td>
                    <Link to={`/users/${review.user_id}`}>View customer</Link>
                  </td>
                  <td>{formatRupees(review.total_paise)}</td>
                  <td>
                    <StatusBadge tone="pending">
                      {review.order_status.replace(/_/g, " ")}
                    </StatusBadge>
                  </td>
                  <td>{new Date(review.created_at).toLocaleString()}</td>
                  <td>
                    <div className="table-actions">
                      <Button
                        type="button"
                        loading={actingOn === review.id}
                        onClick={() =>
                          void handleDecision(review.id, "approved")
                        }
                      >
                        Approve
                      </Button>
                      <Button
                        type="button"
                        variant="secondary"
                        onClick={() => {
                          setRejectingId(
                            rejectingId === review.id ? null : review.id,
                          );
                          setRejectReason("");
                        }}
                      >
                        Reject
                      </Button>
                    </div>
                    {rejectingId === review.id ? (
                      <div className="inline-form">
                        <Input
                          label="Rejection reason (optional)"
                          value={rejectReason}
                          onChange={(event) =>
                            setRejectReason(event.target.value)
                          }
                          placeholder="Note for audit trail"
                        />
                        <Button
                          type="button"
                          variant="danger"
                          loading={actingOn === review.id}
                          onClick={() =>
                            void handleDecision(
                              review.id,
                              "rejected",
                              rejectReason.trim() || undefined,
                            )
                          }
                        >
                          Confirm reject
                        </Button>
                      </div>
                    ) : null}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      ) : null}
    </div>
  );
}

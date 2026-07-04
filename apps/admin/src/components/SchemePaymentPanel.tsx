import { useEffect, useState, type FormEvent } from "react";
import {
  listGoalContributions,
  recordShowroomPayment,
} from "../api/schemes";
import { SHOWROOM_PAYMENT_CHANNELS, formatSchemeLabel } from "../config/schemes";
import { Button } from "./Button";
import { Input } from "./Input";
import { LoadingState } from "./LoadingState";
import { Panel } from "./Panel";

interface SchemePaymentPanelProps {
  goalId: string;
  defaultAmountRupees?: string;
  onRecorded?: () => void;
}

function rupeesToPaise(rupees: string): number {
  const parsed = Number.parseFloat(rupees);
  if (!Number.isFinite(parsed) || parsed <= 0) return 0;
  return Math.round(parsed * 100);
}

export function SchemePaymentPanel({
  goalId,
  defaultAmountRupees = "500",
  onRecorded,
}: SchemePaymentPanelProps) {
  const [amountRupees, setAmountRupees] = useState(defaultAmountRupees);
  const [paymentChannel, setPaymentChannel] =
    useState<(typeof SHOWROOM_PAYMENT_CHANNELS)[number]["id"]>("cash");
  const [referenceNumber, setReferenceNumber] = useState("");
  const [remarks, setRemarks] = useState("");
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);
  const [loadingHistory, setLoadingHistory] = useState(true);
  const [historyError, setHistoryError] = useState<string | null>(null);
  const [goalName, setGoalName] = useState("");
  const [schemeType, setSchemeType] = useState("");
  const [contributions, setContributions] = useState<
    Array<{
      id: string;
      amount_display: string;
      status: string;
      contribution_month: string;
      completed_at: string | null;
    }>
  >([]);

  async function loadHistory() {
    setLoadingHistory(true);
    setHistoryError(null);
    try {
      const result = await listGoalContributions(goalId);
      setGoalName(result.goal.name);
      setSchemeType(result.goal.scheme_type);
      setContributions(result.contributions);
    } catch (err) {
      setHistoryError(err instanceof Error ? err.message : "Failed to load history");
    } finally {
      setLoadingHistory(false);
    }
  }

  useEffect(() => {
    void loadHistory();
  }, [goalId]);

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();
    setError(null);
    setSuccess(null);

    const amountPaise = rupeesToPaise(amountRupees);
    if (amountPaise <= 0) {
      setError("Enter a valid payment amount.");
      return;
    }

    setSaving(true);
    try {
      const paymentKey = `admin-pay:${goalId}:${Date.now()}`;
      const result = await recordShowroomPayment(
        goalId,
        {
          amount_paise: amountPaise,
          payment_channel: paymentChannel,
          reference_number: referenceNumber.trim() || undefined,
          remarks: remarks.trim() || undefined,
        },
        paymentKey,
      );
      setSuccess(`Payment recorded: ${result.contribution.amount_display}`);
      setReferenceNumber("");
      setRemarks("");
      await loadHistory();
      onRecorded?.();
    } catch (err) {
      setError(err instanceof Error ? err.message : "Payment failed");
    } finally {
      setSaving(false);
    }
  }

  return (
    <Panel
      title={
        goalName
          ? `Record payment — ${goalName} (${formatSchemeLabel(schemeType)})`
          : "Record showroom payment"
      }
    >
      <form className="banner-form" onSubmit={(event) => void handleSubmit(event)}>
        <p className="muted">
          Posts a manual contribution through the ledger engine. Requires a valid
          step-up token from Settings.
        </p>

        {error ? (
          <div className="login-card__alert" role="alert">
            {error}
          </div>
        ) : null}
        {success ? <p className="success-text">{success}</p> : null}

        <div className="banner-form__row">
          <Input
            label="Amount (₹)"
            type="number"
            min="500"
            step="500"
            value={amountRupees}
            onChange={(event) => setAmountRupees(event.target.value)}
            required
            disabled={saving}
          />
          <label className="field">
            <span className="field__label">Payment channel</span>
            <select
              value={paymentChannel}
              onChange={(event) =>
                setPaymentChannel(
                  event.target.value as (typeof SHOWROOM_PAYMENT_CHANNELS)[number]["id"],
                )
              }
              disabled={saving}
            >
              {SHOWROOM_PAYMENT_CHANNELS.map((channel) => (
                <option key={channel.id} value={channel.id}>
                  {channel.label}
                </option>
              ))}
            </select>
          </label>
        </div>

        <div className="banner-form__row">
          <Input
            label="Reference (optional)"
            value={referenceNumber}
            onChange={(event) => setReferenceNumber(event.target.value)}
            disabled={saving}
          />
          <Input
            label="Remarks (optional)"
            value={remarks}
            onChange={(event) => setRemarks(event.target.value)}
            disabled={saving}
          />
        </div>

        <div className="banner-form__actions">
          <Button type="submit" disabled={saving}>
            {saving ? "Recording…" : "Record payment"}
          </Button>
        </div>
      </form>

      {loadingHistory ? <LoadingState label="Loading contribution history…" /> : null}
      {historyError ? <p className="error">{historyError}</p> : null}

      {!loadingHistory && contributions.length > 0 ? (
        <table className="data-table">
          <thead>
            <tr>
              <th>Month</th>
              <th>Amount</th>
              <th>Status</th>
              <th>Completed</th>
            </tr>
          </thead>
          <tbody>
            {contributions.map((row) => (
              <tr key={row.id}>
                <td>{row.contribution_month}</td>
                <td>{row.amount_display}</td>
                <td>{row.status.replace(/_/g, " ")}</td>
                <td>
                  {row.completed_at
                    ? new Date(row.completed_at).toLocaleString()
                    : "—"}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      ) : null}

      {!loadingHistory && !historyError && contributions.length === 0 ? (
        <p className="muted">No contributions recorded yet.</p>
      ) : null}
    </Panel>
  );
}

import { useEffect, useMemo, useState, type FormEvent } from "react";
import { listCustomers, type CustomerListItem } from "../api/customers";
import {
  enrollCustomerInScheme,
  recordShowroomPayment,
  type EnrollSchemePayload,
} from "../api/schemes";
import {
  SCHEME_ENROLLMENT_DEFAULTS,
  SCHEME_PLANS,
  SHOWROOM_PAYMENT_CHANNELS,
  formatSchemeLabel,
  type SchemePlanId,
} from "../config/schemes";
import { Button } from "./Button";
import { Input } from "./Input";
import { Panel } from "./Panel";

function todayIsoDate(): string {
  return new Date().toISOString().slice(0, 10);
}

function rupeesToPaise(rupees: string): number {
  const parsed = Number.parseFloat(rupees);
  if (!Number.isFinite(parsed) || parsed <= 0) return 0;
  return Math.round(parsed * 100);
}

interface SchemeEnrollPanelProps {
  initialCustomerId?: string;
  initialCustomerLabel?: string;
  onEnrolled?: (goalId: string) => void;
}

export function SchemeEnrollPanel({
  initialCustomerId = "",
  initialCustomerLabel = "",
  onEnrolled,
}: SchemeEnrollPanelProps) {
  const [customerQuery, setCustomerQuery] = useState(initialCustomerLabel);
  const [customerId, setCustomerId] = useState(initialCustomerId);
  const [customerResults, setCustomerResults] = useState<CustomerListItem[]>([]);
  const [schemeType, setSchemeType] = useState<SchemePlanId>("crest");
  const defaults = SCHEME_ENROLLMENT_DEFAULTS[schemeType];
  const [name, setName] = useState("");
  const [goalType, setGoalType] = useState(defaults.goal_type);
  const [monthlyRupees, setMonthlyRupees] = useState(
    String(defaults.monthly_amount_rupees),
  );
  const [startDate, setStartDate] = useState(todayIsoDate());
  const [recordInitialPayment, setRecordInitialPayment] = useState(true);
  const [paymentChannel, setPaymentChannel] =
    useState<(typeof SHOWROOM_PAYMENT_CHANNELS)[number]["id"]>("cash");
  const [referenceNumber, setReferenceNumber] = useState("");
  const [remarks, setRemarks] = useState("");
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<string | null>(null);

  useEffect(() => {
    const nextDefaults = SCHEME_ENROLLMENT_DEFAULTS[schemeType];
    setGoalType(nextDefaults.goal_type);
    setMonthlyRupees(String(nextDefaults.monthly_amount_rupees));
  }, [schemeType]);

  useEffect(() => {
    if (initialCustomerId) {
      setCustomerId(initialCustomerId);
    }
    if (initialCustomerLabel) {
      setCustomerQuery(initialCustomerLabel);
    }
  }, [initialCustomerId, initialCustomerLabel]);

  useEffect(() => {
    if (customerQuery.trim().length < 3) {
      setCustomerResults([]);
      return;
    }

    let cancelled = false;
    const timer = window.setTimeout(() => {
      void listCustomers({ query: customerQuery.trim(), limit: 8 })
        .then((result) => {
          if (!cancelled) setCustomerResults(result.users);
        })
        .catch(() => {
          if (!cancelled) setCustomerResults([]);
        });
    }, 300);

    return () => {
      cancelled = true;
      window.clearTimeout(timer);
    };
  }, [customerQuery]);

  const selectedCustomer = useMemo(
    () => customerResults.find((row) => row.id === customerId) ?? null,
    [customerId, customerResults],
  );

  const schemeLabel = formatSchemeLabel(schemeType);

  async function handleSubmit(event: FormEvent) {
    event.preventDefault();
    setError(null);
    setSuccess(null);

    if (!customerId) {
      setError("Select a customer before enrolling.");
      return;
    }

    const monthlyAmountPaise = rupeesToPaise(monthlyRupees);
    if (monthlyAmountPaise <= 0) {
      setError("Enter a valid installment or advance amount.");
      return;
    }

    const payload: EnrollSchemePayload = {
      scheme_type: schemeType,
      goal_type: goalType,
      name: name.trim() || `${schemeLabel} — ${selectedCustomer?.name ?? "Customer"}`,
      monthly_amount_paise: monthlyAmountPaise,
      duration_months: defaults.duration_months,
      start_date: startDate,
    };

    setSaving(true);
    try {
      const enrollKey = `admin-enroll:${customerId}:${schemeType}:${Date.now()}`;
      const enrolled = await enrollCustomerInScheme(customerId, payload, enrollKey);

      let message = `Enrolled in ${schemeLabel}. Goal ID: ${enrolled.goal.id}.`;

      if (recordInitialPayment) {
        const paymentKey = `admin-pay:${enrolled.goal.id}:${Date.now()}`;
        const payment = await recordShowroomPayment(
          enrolled.goal.id,
          {
            amount_paise: monthlyAmountPaise,
            payment_channel: paymentChannel,
            reference_number: referenceNumber.trim() || undefined,
            remarks: remarks.trim() || undefined,
          },
          paymentKey,
        );
        message += ` Initial payment recorded (${payment.contribution.amount_display}).`;
      }

      setSuccess(message);
      onEnrolled?.(enrolled.goal.id);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Enrollment failed");
    } finally {
      setSaving(false);
    }
  }

  return (
    <Panel title="Showroom enrollment">
      <form className="banner-form" onSubmit={(event) => void handleSubmit(event)}>
        <p className="muted">
          Enroll a customer into Aura Plan, Crest, Dhanam, or Swarna Nidhi. KYC gates
          are bypassed for showroom operations; all actions are audited.
        </p>

        {error ? (
          <div className="login-card__alert" role="alert">
            {error}
          </div>
        ) : null}
        {success ? <p className="success-text">{success}</p> : null}

        <div className="banner-form__row">
          <Input
            label="Find customer"
            value={customerQuery}
            onChange={(event) => {
              setCustomerQuery(event.target.value);
              setCustomerId("");
            }}
            placeholder="Name or phone"
            disabled={saving}
          />
          {customerResults.length > 0 ? (
            <label className="field">
              <span className="field__label">Select customer</span>
              <select
                value={customerId}
                onChange={(event) => setCustomerId(event.target.value)}
                disabled={saving}
              >
                <option value="">Choose…</option>
                {customerResults.map((row) => (
                  <option key={row.id} value={row.id}>
                    {row.name ?? "Member"} · {row.phone} · KYC {row.kyc_status}
                  </option>
                ))}
              </select>
            </label>
          ) : null}
        </div>

        <div className="banner-form__row">
          <label className="field">
            <span className="field__label">Scheme</span>
            <select
              value={schemeType}
              onChange={(event) => setSchemeType(event.target.value as SchemePlanId)}
              disabled={saving}
            >
              {SCHEME_PLANS.map((plan) => (
                <option key={plan.id} value={plan.id}>
                  {plan.name}
                </option>
              ))}
            </select>
          </label>
          <label className="field">
            <span className="field__label">Goal type</span>
            <select
              value={goalType}
              onChange={(event) =>
                setGoalType(event.target.value as typeof goalType)
              }
              disabled={saving}
            >
              <option value="other">Other</option>
              <option value="wedding">Wedding</option>
              <option value="investment">Investment</option>
              <option value="festival">Festival</option>
              <option value="gift">Gift</option>
              <option value="family">Family</option>
            </select>
          </label>
        </div>

        <div className="banner-form__row">
          <Input
            label="Scheme name"
            value={name}
            onChange={(event) => setName(event.target.value)}
            placeholder={`${schemeLabel} savings`}
            disabled={saving}
          />
          <Input
            label={schemeType === "crest" ? "Advance (₹)" : "Installment (₹)"}
            type="number"
            min="500"
            step="500"
            value={monthlyRupees}
            onChange={(event) => setMonthlyRupees(event.target.value)}
            required
            disabled={saving}
          />
          <Input
            label="Start date"
            type="date"
            value={startDate}
            onChange={(event) => setStartDate(event.target.value)}
            required
            disabled={saving}
          />
        </div>

        <div className="banner-form__row">
          <label className="field field--checkbox">
            <input
              type="checkbox"
              checked={recordInitialPayment}
              onChange={(event) => setRecordInitialPayment(event.target.checked)}
              disabled={saving}
            />
            Record initial showroom payment now (requires step-up token)
          </label>
        </div>

        {recordInitialPayment ? (
          <div className="banner-form__row">
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
            <Input
              label="Reference (optional)"
              value={referenceNumber}
              onChange={(event) => setReferenceNumber(event.target.value)}
              placeholder="UPI ref / receipt no."
              disabled={saving}
            />
            <Input
              label="Remarks (optional)"
              value={remarks}
              onChange={(event) => setRemarks(event.target.value)}
              disabled={saving}
            />
          </div>
        ) : null}

        <div className="banner-form__actions">
          <Button type="submit" disabled={saving}>
            {saving ? "Saving…" : "Enroll customer"}
          </Button>
        </div>
      </form>
    </Panel>
  );
}

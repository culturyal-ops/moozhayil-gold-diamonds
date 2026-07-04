import { useState } from "react";
import { Link } from "react-router-dom";
import type { CustomerDetail } from "../api/customers";
import { formatSchemeLabel } from "../config/schemes";
import { Button } from "./Button";
import { Panel } from "./Panel";
import { SchemeEnrollPanel } from "./SchemeEnrollPanel";
import { SchemePaymentPanel } from "./SchemePaymentPanel";
import { StatusBadge } from "./StatusBadge";

interface CustomerDetailViewProps {
  detail: CustomerDetail;
  onRefresh?: () => void;
}

export function CustomerDetailView({ detail, onRefresh }: CustomerDetailViewProps) {
  const { user } = detail;
  const [paymentGoalId, setPaymentGoalId] = useState<string | null>(null);

  return (
    <div className="customer-detail">
      <SchemeEnrollPanel
        initialCustomerId={user.id}
        initialCustomerLabel={user.name ?? user.phone_masked}
        onEnrolled={() => onRefresh?.()}
      />

      {paymentGoalId ? (
        <SchemePaymentPanel
          goalId={paymentGoalId}
          defaultAmountRupees={String(
            (detail.active_schemes.find((scheme) => scheme.id === paymentGoalId)
              ?.monthly_amount_paise ?? 50000) / 100,
          )}
          onRecorded={() => onRefresh?.()}
        />
      ) : null}

      <div className="grid-2">
        <Panel title="Profile">
          <dl className="detail-list">
            <DetailRow label="Name" value={user.name ?? "Member"} />
            <DetailRow label="Phone" value={user.phone_masked} />
            <DetailRow label="Email" value={user.email ?? "—"} />
            <DetailRow label="City" value={user.city ?? "—"} />
            <DetailRow label="Member since" value={user.member_since} />
            <DetailRow
              label="Last active"
              value={
                user.last_active_at
                  ? new Date(user.last_active_at).toLocaleString()
                  : "—"
              }
            />
            <DetailRow label="Referral code" value={user.referral_code ?? "—"} />
          </dl>
        </Panel>

        <Panel title="KYC & My Gold">
          <dl className="detail-list">
            <DetailRow
              label="KYC status"
              value={
                <StatusBadge tone={user.kyc_status.includes("verified") ? "success" : "pending"}>
                  {user.kyc_status.replace(/_/g, " ")}
                </StatusBadge>
              }
            />
            <DetailRow
              label="Verified at"
              value={
                user.kyc_verified_at
                  ? new Date(user.kyc_verified_at).toLocaleString()
                  : "—"
              }
            />
            <DetailRow
              label="My Gold balance"
              value={`${detail.my_gold.balance_grams} g`}
            />
            <DetailRow
              label="Dream Vault items"
              value={String(detail.dream_vault_items)}
            />
          </dl>
        </Panel>
      </div>

      <Panel title="Active schemes">
        {detail.active_schemes.length === 0 ? (
          <p className="muted">No active schemes.</p>
        ) : (
          <table className="data-table">
            <thead>
              <tr>
                <th>Scheme</th>
                <th>Name</th>
                <th>Status</th>
                <th>Monthly</th>
                <th>Next due</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {detail.active_schemes.map((scheme) => (
                <tr key={scheme.id}>
                  <td>
                    {formatSchemeLabel(scheme.scheme_type, scheme.scheme_display)}
                  </td>
                  <td>{scheme.name}</td>
                  <td>{scheme.status.replace(/_/g, " ")}</td>
                  <td>₹{(scheme.monthly_amount_paise / 100).toFixed(2)}</td>
                  <td>{scheme.next_contribution_date}</td>
                  <td>
                    <Button
                      type="button"
                      variant="secondary"
                      onClick={() =>
                        setPaymentGoalId(
                          paymentGoalId === scheme.id ? null : scheme.id,
                        )
                      }
                    >
                      {paymentGoalId === scheme.id ? "Hide payment" : "Record payment"}
                    </Button>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </Panel>

      <Panel title="Orders">
        {detail.orders.length === 0 ? (
          <p className="muted">No orders yet.</p>
        ) : (
          <table className="data-table">
            <thead>
              <tr>
                <th>Order</th>
                <th>Status</th>
                <th>Total</th>
                <th>Date</th>
              </tr>
            </thead>
            <tbody>
              {detail.orders.map((order) => (
                <tr key={order.id}>
                  <td>
                    <Link to={`/orders/${order.id}`}>{order.order_number}</Link>
                  </td>
                  <td>{order.status_display}</td>
                  <td>{order.total_display}</td>
                  <td>{new Date(order.ordered_at).toLocaleString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </Panel>

      <div className="grid-2">
        <Panel title="Addresses">
          {detail.addresses.length === 0 ? (
            <p className="muted">No saved addresses.</p>
          ) : (
            <div className="address-list">
              {detail.addresses.map((address) => (
                <div key={address.id} className="address-card">
                  <strong>
                    {address.label ?? "Address"}
                    {address.is_default ? " · Default" : ""}
                  </strong>
                  <p>{address.full_name}</p>
                  <p className="muted">
                    {address.line1}
                    {address.line2 ? `, ${address.line2}` : ""}
                  </p>
                  <p className="muted">
                    {address.city}, {address.state} {address.pincode}
                  </p>
                </div>
              ))}
            </div>
          )}
        </Panel>

        <Panel title="Recent ledger entries">
          {detail.ledger_entries.length === 0 ? (
            <p className="muted">No ledger activity yet.</p>
          ) : (
            <table className="data-table">
              <thead>
                <tr>
                  <th>Type</th>
                  <th>Grams</th>
                  <th>Posted</th>
                </tr>
              </thead>
              <tbody>
                {detail.ledger_entries.map((entry) => (
                  <tr key={entry.id}>
                    <td>{entry.entry_type.replace(/_/g, " ")}</td>
                    <td>{entry.grams_delta} g</td>
                    <td>
                      {entry.posted_at
                        ? new Date(entry.posted_at).toLocaleString()
                        : "—"}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          )}
        </Panel>
      </div>
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

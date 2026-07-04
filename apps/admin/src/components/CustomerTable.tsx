import { Link } from "react-router-dom";
import type { CustomerListItem } from "../api/customers";
import { StatusBadge } from "./StatusBadge";

interface CustomerTableProps {
  customers: CustomerListItem[];
}

export function CustomerTable({ customers }: CustomerTableProps) {
  return (
    <div className="banner-table-wrap">
      <table className="data-table">
        <thead>
          <tr>
            <th>Customer</th>
            <th>Phone</th>
            <th>KYC</th>
            <th>My Gold</th>
            <th>Schemes</th>
            <th>Orders</th>
            <th>Last activity</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {customers.map((customer) => (
            <tr key={customer.id}>
              <td>
                <strong>{customer.name ?? "Member"}</strong>
                <div className="muted">Since {customer.member_since}</div>
              </td>
              <td>{customer.phone}</td>
              <td>
                <StatusBadge tone={kycTone(customer.kyc_status)}>
                  {formatKycStatus(customer.kyc_status)}
                </StatusBadge>
              </td>
              <td>{customer.gold_balance_grams} g</td>
              <td>{customer.active_schemes}</td>
              <td>{customer.orders_count}</td>
              <td>
                {customer.last_active_at
                  ? new Date(customer.last_active_at).toLocaleString()
                  : "—"}
              </td>
              <td>
                <Link to={`/users/${customer.id}`} className="btn btn--ghost btn--sm">
                  View
                </Link>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}

function kycTone(status: string): "success" | "pending" | "neutral" | "warning" {
  if (status.includes("verified")) return "success";
  if (status === "in_review") return "pending";
  if (status === "rejected") return "warning";
  return "neutral";
}

function formatKycStatus(status: string): string {
  return status.replace(/_/g, " ");
}

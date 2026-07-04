import { useState } from "react";
import { api, loadSession } from "../api";
import { Button } from "../components/Button";
import { Input } from "../components/Input";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { formatAdminRole } from "../config/navigation";

export function SettingsPage({
  onSessionChange,
}: {
  onSessionChange: () => void;
}) {
  const session = loadSession();
  const [password, setPassword] = useState("");
  const [message, setMessage] = useState<string | null>(null);

  return (
    <div className="page">
      <PageHeader
        eyebrow="System"
        title="Settings"
        subtitle="Session details and step-up authentication for sensitive actions."
      />

      <div className="grid-2">
        <Panel title="Session">
          <dl className="detail-list">
            <div className="detail-list__row">
              <dt>Email</dt>
              <dd>{session?.admin.email}</dd>
            </div>
            <div className="detail-list__row">
              <dt>Role</dt>
              <dd>{session ? formatAdminRole(session.admin.role) : "—"}</dd>
            </div>
          </dl>
        </Panel>

        <Panel title="Step-up authentication">
          <p className="muted">
            Required for refunds, SAR decisions, gold rate overrides, ledger
            adjustments, showroom scheme payments, and KYC approve/reject.
          </p>
          <Input
            label="Confirm password"
            type="password"
            value={password}
            onChange={(event) => setPassword(event.target.value)}
            placeholder="Re-enter your admin password"
          />
          <Button
            type="button"
            onClick={() =>
              void api<{ step_up_token: string }>("/v1/admin/auth/step-up", {
                method: "POST",
                body: JSON.stringify({ password }),
              })
                .then((result) => {
                  localStorage.setItem("moozhayil_step_up", result.step_up_token);
                  setMessage("Step-up token issued (valid 5 minutes).");
                  onSessionChange();
                })
                .catch((err: Error) => setMessage(err.message))
            }
          >
            Issue step-up token
          </Button>
          {message ? <p className="muted">{message}</p> : null}
        </Panel>
      </div>
    </div>
  );
}

import { useCallback, useEffect, useState } from "react";
import { api } from "../api";
import { Button } from "../components/Button";
import { Input } from "../components/Input";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";

interface RateHistoryRow {
  id: string;
  purity: string;
  rate_per_gram_paise: number;
  source: string;
  effective_from: string;
}

export function GoldRatesPage() {
  const [history, setHistory] = useState<RateHistoryRow[]>([]);
  const [purity, setPurity] = useState("22k");
  const [rate, setRate] = useState("650000");
  const [reason, setReason] = useState("Manual override");
  const [loading, setLoading] = useState(true);
  const [saving, setSaving] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [message, setMessage] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const result = await api<{ history: RateHistoryRow[] }>(
        "/v1/admin/gold-rates/history",
      );
      setHistory(result.history);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load gold rates");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void load();
  }, [load]);

  const applyOverride = async () => {
    setSaving(true);
    setMessage(null);
    try {
      await api("/v1/admin/gold-rates/override", {
        method: "POST",
        headers: {
          "X-Admin-Step-Up": localStorage.getItem("moozhayil_step_up") ?? "",
        },
        body: JSON.stringify({
          purity,
          rate_per_gram_paise: Number(rate),
          reason,
        }),
      });
      setMessage("Gold rate override applied.");
      await load();
    } catch (err) {
      setMessage(err instanceof Error ? err.message : "Override failed");
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Finance & compliance"
        title="Gold Rates"
        subtitle="Override live rates for pricing and My Gold valuations. Requires step-up auth."
      />

      <Panel title="Override rate">
        <div className="banner-form__row">
          <div className="field">
            <label className="field__label" htmlFor="purity">
              Purity
            </label>
            <select
              id="purity"
              className="field__input"
              value={purity}
              onChange={(event) => setPurity(event.target.value)}
            >
              <option value="14k">14k</option>
              <option value="18k">18k</option>
              <option value="22k">22k</option>
              <option value="24k">24k</option>
            </select>
          </div>
          <Input
            label="Rate per gram (paise)"
            value={rate}
            onChange={(event) => setRate(event.target.value)}
          />
          <Input
            label="Reason"
            value={reason}
            onChange={(event) => setReason(event.target.value)}
          />
        </div>
        <Button type="button" loading={saving} onClick={() => void applyOverride()}>
          Apply override
        </Button>
        {message ? <p className="muted">{message}</p> : null}
      </Panel>

      {loading ? <LoadingState label="Loading rate history…" /> : null}
      {error ? <p className="error">{error}</p> : null}

      {!loading && !error ? (
        <Panel title="Rate history">
          <table className="data-table">
            <thead>
              <tr>
                <th>Purity</th>
                <th>Rate (paise)</th>
                <th>Source</th>
                <th>Effective from</th>
              </tr>
            </thead>
            <tbody>
              {history.map((row) => (
                <tr key={row.id}>
                  <td>{row.purity}</td>
                  <td>{row.rate_per_gram_paise.toLocaleString("en-IN")}</td>
                  <td>{row.source}</td>
                  <td>{new Date(row.effective_from).toLocaleString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </Panel>
      ) : null}
    </div>
  );
}

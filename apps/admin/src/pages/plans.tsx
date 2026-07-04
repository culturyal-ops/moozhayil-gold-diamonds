import { useEffect, useState } from "react";

import { api } from "../api";

import { LoadingState } from "../components/LoadingState";

import { PageHeader } from "../components/PageHeader";

import { Panel } from "../components/Panel";

import { SchemeEnrollPanel } from "../components/SchemeEnrollPanel";

import { SCHEME_PLANS, formatSchemeLabel } from "../config/schemes";



type PlanInterestRow = {

  id: string;

  scheme_type: string;

  scheme_display: string;

  registered_at: string;

  user: {

    id: string;

    name: string | null;

    phone: string;

    city: string | null;

    kyc_status: string;

  };

};



type InterestResponse = {

  data: PlanInterestRow[];

  has_more: boolean;

  next_cursor: string | null;

};



/** Operator view of Schemes and digital interest queue. */

export function PlansPage() {

  const [interests, setInterests] = useState<PlanInterestRow[]>([]);

  const [loading, setLoading] = useState(true);

  const [error, setError] = useState<string | null>(null);

  const [filter, setFilter] = useState<string>("all");



  useEffect(() => {

    let cancelled = false;

    setLoading(true);

    setError(null);



    const query =

      filter === "all" ? "" : `?scheme_type=${encodeURIComponent(filter)}`;



    api<InterestResponse>(`/v1/admin/plans/interest${query}`)

      .then((result) => {

        if (!cancelled) setInterests(result.data);

      })

      .catch((err: Error) => {

        if (!cancelled) setError(err.message);

      })

      .finally(() => {

        if (!cancelled) setLoading(false);

      });



    return () => {

      cancelled = true;

    };

  }, [filter]);



  return (

    <div className="page">

      <PageHeader

        eyebrow="Operations"

        title="Schemes"

        subtitle="Aura Plan, Crest, Dhanam, and Swarna Nidhi — mapped to customer Goal records via scheme_type."

      />



      <div className="card-grid">

        {SCHEME_PLANS.map((plan) => (

          <Panel key={plan.id} title={plan.name}>

            <p className="muted">{plan.tagline}</p>

            <p>

              <strong>Scheme ID:</strong> <code>{plan.id}</code>

            </p>

            <p>

              <strong>Enrollment:</strong>{" "}

              {plan.enrollmentStatus === "live_app"

                ? "Live in customer app"

                : "Showroom + interest queue"}

            </p>

          </Panel>

        ))}

      </div>



      <SchemeEnrollPanel />



      <Panel title="Digital interest queue">

        <div className="page-toolbar">

          <p className="muted">Showroom interest captured from the customer app.</p>

          <select

            value={filter}

            onChange={(event) => setFilter(event.target.value)}

            aria-label="Filter by scheme"

          >

            <option value="all">All schemes</option>

            <option value="crest">Crest</option>

            <option value="dhanam">Dhanam</option>

            <option value="gold_nidhi">Swarna Nidhi</option>

          </select>

        </div>



        {loading ? <LoadingState label="Loading interest registrations…" /> : null}

        {error ? <p className="error">{error}</p> : null}



        {!loading && !error && interests.length === 0 ? (

          <p className="muted">No interest registrations yet.</p>

        ) : null}



        {!loading && interests.length > 0 ? (

          <table className="data-table">

            <thead>

              <tr>

                <th>Scheme</th>

                <th>Customer</th>

                <th>Phone</th>

                <th>City</th>

                <th>KYC</th>

                <th>Registered</th>

              </tr>

            </thead>

            <tbody>

              {interests.map((row) => (

                <tr key={row.id}>

                  <td>

                    {formatSchemeLabel(row.scheme_type, row.scheme_display)}

                  </td>

                  <td>{row.user.name ?? "—"}</td>

                  <td>{row.user.phone}</td>

                  <td>{row.user.city ?? "—"}</td>

                  <td>{row.user.kyc_status}</td>

                  <td>{new Date(row.registered_at).toLocaleString()}</td>

                </tr>

              ))}

            </tbody>

          </table>

        ) : null}

      </Panel>

    </div>

  );

}


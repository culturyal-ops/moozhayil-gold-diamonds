import { useCallback, useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import {
  createCustomer,
  getCustomer,
  listCustomers,
  type CustomerDetail,
  type CustomerListItem,
} from "../api/customers";
import { Button } from "../components/Button";
import {
  CustomerCreateForm,
  emptyCustomerCreateValues,
  type CustomerCreateValues,
} from "../components/CustomerCreateForm";
import { CustomerDetailView } from "../components/CustomerDetailView";
import { CustomerTable } from "../components/CustomerTable";
import { EmptyState } from "../components/EmptyState";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { useAdminSession } from "../hooks/useAdminSession";

export function UsersPage() {
  const { role } = useAdminSession();
  const canCreate = role === "super_admin" || role === "support_agent";
  const [customers, setCustomers] = useState<CustomerListItem[]>([]);
  const [query, setQuery] = useState("");
  const [searchInput, setSearchInput] = useState("");
  const [nextCursor, setNextCursor] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [loadingMore, setLoadingMore] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [showCreate, setShowCreate] = useState(false);
  const [createValues, setCreateValues] = useState<CustomerCreateValues>(
    emptyCustomerCreateValues(),
  );
  const [createError, setCreateError] = useState<string | null>(null);
  const [creating, setCreating] = useState(false);

  const loadCustomers = useCallback(
    async (cursor?: string, append = false) => {
      if (append) setLoadingMore(true);
      else setLoading(true);
      setError(null);

      try {
        const result = await listCustomers({
          query: query || undefined,
          cursor,
        });
        setCustomers((current) =>
          append ? [...current, ...result.users] : result.users,
        );
        setNextCursor(result.next_cursor);
      } catch (err) {
        setError(err instanceof Error ? err.message : "Failed to load customers");
      } finally {
        setLoading(false);
        setLoadingMore(false);
      }
    },
    [query],
  );

  useEffect(() => {
    void loadCustomers();
  }, [loadCustomers]);

  const handleCreate = async () => {
    setCreating(true);
    setCreateError(null);
    try {
      const payload: {
        phone: string;
        name: string;
        email?: string;
        city?: string;
      } = {
        phone: createValues.phone.trim(),
        name: createValues.name.trim(),
      };
      if (createValues.email.trim()) payload.email = createValues.email.trim();
      if (createValues.city.trim()) payload.city = createValues.city.trim();

      await createCustomer(payload);
      setShowCreate(false);
      setCreateValues(emptyCustomerCreateValues());
      await loadCustomers();
    } catch (err) {
      setCreateError(err instanceof Error ? err.message : "Failed to create customer");
    } finally {
      setCreating(false);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Operations"
        title="Customers"
        subtitle="Search customers, review My Gold and schemes, and add showroom records."
        action={
          canCreate && !showCreate ? (
            <Button onClick={() => setShowCreate(true)}>Add customer</Button>
          ) : null
        }
      />

      {showCreate ? (
        <Panel>
          <CustomerCreateForm
            values={createValues}
            onChange={setCreateValues}
            onSubmit={() => void handleCreate()}
            onCancel={() => {
              setShowCreate(false);
              setCreateError(null);
            }}
            saving={creating}
            error={createError}
          />
        </Panel>
      ) : null}

      <Panel title="Customer directory">
        <form
          className="customer-search"
          onSubmit={(event) => {
            event.preventDefault();
            setQuery(searchInput.trim());
          }}
        >
          <input
            className="field__input customer-search__input"
            value={searchInput}
            onChange={(event) => setSearchInput(event.target.value)}
            placeholder="Search name, phone, or email"
            aria-label="Search customers"
          />
          <button type="submit" className="btn btn--secondary">
            Search
          </button>
        </form>

        {loading ? <LoadingState label="Loading customers…" /> : null}
        {error ? <p className="error">{error}</p> : null}

        {!loading && !error && customers.length === 0 ? (
          <EmptyState
            title="No customers found"
            description={
              query
                ? "Try a different search term."
                : "Customers appear here after app registration or manual creation."
            }
            action={
              canCreate ? (
                <Button onClick={() => setShowCreate(true)}>Add customer</Button>
              ) : undefined
            }
          />
        ) : null}

        {!loading && customers.length > 0 ? (
          <>
            <CustomerTable customers={customers} />
            {nextCursor ? (
              <div style={{ marginTop: "1rem" }}>
                <Button
                  variant="secondary"
                  loading={loadingMore}
                  onClick={() => void loadCustomers(nextCursor, true)}
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

export function CustomerDetailPage() {
  const { id } = useParams<{ id: string }>();
  const [detail, setDetail] = useState<CustomerDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    if (!id) return;
    setLoading(true);
    void getCustomer(id)
      .then(setDetail)
      .catch((err: Error) => setError(err.message))
      .finally(() => setLoading(false));
  }, [id]);

  return (
    <div className="page">
      <PageHeader
        eyebrow="Operations"
        title={detail?.user.name ?? "Customer"}
        subtitle="Profile, My Gold, schemes, orders, and ledger summary."
        action={
          <Link to="/users" className="btn btn--secondary">
            Back to customers
          </Link>
        }
      />

      {loading ? <LoadingState label="Loading customer…" /> : null}
      {error ? <p className="error">{error}</p> : null}
      {detail ? (
        <CustomerDetailView
          detail={detail}
          onRefresh={() => {
            if (!id) return;
            void getCustomer(id).then(setDetail).catch((err: Error) => setError(err.message));
          }}
        />
      ) : null}
    </div>
  );
}

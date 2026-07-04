import { useCallback, useEffect, useState } from "react";
import {
  listInventory,
  listInventoryReservations,
  updateInventoryStock,
  type InventoryItem,
  type InventoryReservation,
} from "../api/inventory";
import { Button } from "../components/Button";
import { EmptyState } from "../components/EmptyState";
import { Input } from "../components/Input";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { StatusBadge } from "../components/StatusBadge";

export function InventoryPage() {
  const [inventory, setInventory] = useState<InventoryItem[]>([]);
  const [reservations, setReservations] = useState<InventoryReservation[]>([]);
  const [lowStockOnly, setLowStockOnly] = useState(true);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [editingId, setEditingId] = useState<string | null>(null);
  const [stockInput, setStockInput] = useState("");
  const [reasonInput, setReasonInput] = useState("");
  const [savingId, setSavingId] = useState<string | null>(null);
  const [actionError, setActionError] = useState<string | null>(null);

  const load = useCallback(async () => {
    setLoading(true);
    setError(null);
    try {
      const [stock, reserved] = await Promise.all([
        listInventory({ lowStockOnly }),
        listInventoryReservations(),
      ]);
      setInventory(stock.inventory);
      setReservations(reserved.reservations);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load inventory");
    } finally {
      setLoading(false);
    }
  }, [lowStockOnly]);

  useEffect(() => {
    void load();
  }, [load]);

  const startEdit = (row: InventoryItem) => {
    setEditingId(row.id);
    setStockInput(String(row.stock_quantity));
    setReasonInput("");
    setActionError(null);
  };

  const saveStock = async (productId: string) => {
    const stockQuantity = Number.parseInt(stockInput, 10);
    if (!Number.isFinite(stockQuantity) || stockQuantity < 0) {
      setActionError("Enter a valid non-negative stock quantity.");
      return;
    }
    if (reasonInput.trim().length < 5) {
      setActionError("Reason must be at least 5 characters.");
      return;
    }

    setSavingId(productId);
    setActionError(null);
    try {
      await updateInventoryStock(productId, {
        stock_quantity: stockQuantity,
        reason: reasonInput.trim(),
      });
      setEditingId(null);
      await load();
    } catch (err) {
      setActionError(err instanceof Error ? err.message : "Stock update failed");
    } finally {
      setSavingId(null);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Catalogue"
        title="Inventory"
        subtitle="Adjust showroom stock levels and monitor active reservations."
      />

      {loading ? <LoadingState label="Loading inventory…" /> : null}
      {error ? <p className="error">{error}</p> : null}
      {actionError ? <p className="error">{actionError}</p> : null}

      <Panel title="Product stock">
        <div className="page-toolbar">
          <label className="field field--checkbox">
            <input
              type="checkbox"
              checked={lowStockOnly}
              onChange={(event) => setLowStockOnly(event.target.checked)}
            />
            Show low stock only (≤ 5 units)
          </label>
        </div>

        {!loading && !error && inventory.length === 0 ? (
          <EmptyState
            title="No products"
            description={
              lowStockOnly
                ? "No low-stock products right now."
                : "No products found in catalogue."
            }
          />
        ) : null}

        {!loading && inventory.length > 0 ? (
          <table className="data-table">
            <thead>
              <tr>
                <th>SKU</th>
                <th>Name</th>
                <th>Stock</th>
                <th>Published</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {inventory.map((row) => (
                <tr key={row.id}>
                  <td>{row.sku}</td>
                  <td>{row.name}</td>
                  <td>
                    {editingId === row.id ? (
                      <Input
                        label="Stock quantity"
                        type="number"
                        min="0"
                        value={stockInput}
                        onChange={(event) => setStockInput(event.target.value)}
                        disabled={savingId === row.id}
                      />
                    ) : (
                      row.stock_quantity
                    )}
                  </td>
                  <td>
                    <StatusBadge tone={row.is_published ? "success" : "pending"}>
                      {row.is_published ? "Published" : "Draft"}
                    </StatusBadge>
                  </td>
                  <td>
                    {editingId === row.id ? (
                      <div className="inline-form">
                        <Input
                          label="Reason"
                          value={reasonInput}
                          onChange={(event) => setReasonInput(event.target.value)}
                          placeholder="Showroom recount / correction"
                          disabled={savingId === row.id}
                        />
                        <div className="table-actions">
                          <Button
                            type="button"
                            loading={savingId === row.id}
                            onClick={() => void saveStock(row.id)}
                          >
                            Save
                          </Button>
                          <Button
                            type="button"
                            variant="secondary"
                            onClick={() => setEditingId(null)}
                            disabled={savingId === row.id}
                          >
                            Cancel
                          </Button>
                        </div>
                      </div>
                    ) : (
                      <Button type="button" variant="secondary" onClick={() => startEdit(row)}>
                        Edit stock
                      </Button>
                    )}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        ) : null}
      </Panel>

      <Panel title="Active reservations">
        {reservations.length === 0 ? (
          <p className="muted">No active inventory reservations.</p>
        ) : (
          <table className="data-table">
            <thead>
              <tr>
                <th>Product</th>
                <th>Qty</th>
                <th>Status</th>
                <th>Expires</th>
              </tr>
            </thead>
            <tbody>
              {reservations.map((row) => (
                <tr key={row.id}>
                  <td>
                    {row.product_name} ({row.product_sku})
                  </td>
                  <td>{row.quantity}</td>
                  <td>{row.status}</td>
                  <td>{new Date(row.expires_at).toLocaleString()}</td>
                </tr>
              ))}
            </tbody>
          </table>
        )}
      </Panel>
    </div>
  );
}

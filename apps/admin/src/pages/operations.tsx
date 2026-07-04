import { useEffect, useState } from "react";
import {
  createServiceablePincode,
  createStoreLocation,
  deleteServiceablePincode,
  importServiceablePincodes,
  listServiceablePincodes,
  listStoreLocations,
  type ServiceablePincode,
  type StoreLocation,
} from "../api/operations";
import { Button } from "../components/Button";
import { Input } from "../components/Input";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";

export function OperationsPage() {
  const [pincodes, setPincodes] = useState<ServiceablePincode[]>([]);
  const [stores, setStores] = useState<StoreLocation[]>([]);
  const [importText, setImportText] = useState("");
  const [pincodeForm, setPincodeForm] = useState({
    pincode: "",
    city: "",
    state: "",
    estimated_delivery_days: "3",
  });
  const [storeForm, setStoreForm] = useState({
    name: "",
    address: "",
    city: "",
    state: "",
    pincode: "",
    phone: "",
    latitude: "",
    longitude: "",
  });
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  async function refresh() {
    setLoading(true);
    setError(null);
    try {
      const [pincodeResponse, storeResponse] = await Promise.all([
        listServiceablePincodes(),
        listStoreLocations(),
      ]);
      setPincodes(pincodeResponse.pincodes);
      setStores(storeResponse.stores);
    } catch (err) {
      setError(err instanceof Error ? err.message : "Failed to load operations data");
    } finally {
      setLoading(false);
    }
  }

  useEffect(() => {
    void refresh();
  }, []);

  async function handleCreatePincode(event: React.FormEvent) {
    event.preventDefault();
    await createServiceablePincode({
      pincode: pincodeForm.pincode,
      city: pincodeForm.city,
      state: pincodeForm.state,
      serviceable: true,
      pickup_available: true,
      estimated_delivery_days: Number(pincodeForm.estimated_delivery_days),
    });
    setPincodeForm({ pincode: "", city: "", state: "", estimated_delivery_days: "3" });
    await refresh();
  }

  async function handleImportPincodes() {
    const rows = importText
      .split("\n")
      .map((line) => line.trim())
      .filter(Boolean)
      .map((line) => {
        const [pincode, city, state, days = "3"] = line.split(",").map((part) => part.trim());
        return {
          pincode,
          city,
          state,
          serviceable: true,
          pickup_available: true,
          estimated_delivery_days: Number(days),
        };
      });

    await importServiceablePincodes(rows);
    setImportText("");
    await refresh();
  }

  async function handleCreateStore(event: React.FormEvent) {
    event.preventDefault();
    await createStoreLocation({
      name: storeForm.name,
      address: storeForm.address,
      city: storeForm.city,
      state: storeForm.state,
      pincode: storeForm.pincode,
      phone: storeForm.phone,
      latitude: Number(storeForm.latitude),
      longitude: Number(storeForm.longitude),
      opening_hours: {
        mon: { open: "10:00", close: "20:00" },
        tue: { open: "10:00", close: "20:00" },
        wed: { open: "10:00", close: "20:00" },
        thu: { open: "10:00", close: "20:00" },
        fri: { open: "10:00", close: "20:00" },
        sat: { open: "10:00", close: "20:00" },
        sun: { closed: true },
      },
      is_active: true,
    });
    setStoreForm({
      name: "",
      address: "",
      city: "",
      state: "",
      pincode: "",
      phone: "",
      latitude: "",
      longitude: "",
    });
    await refresh();
  }

  return (
    <div className="page-stack">
      <PageHeader
        title="Operations"
        subtitle="Manage delivery pincodes and showroom store locations."
      />

      {error ? <p className="error-text">{error}</p> : null}
      {loading ? <p>Loading…</p> : null}

      <Panel title="Serviceable pincodes">
        <form className="form-grid" onSubmit={(event) => void handleCreatePincode(event)}>
          <Input
            label="Pincode"
            value={pincodeForm.pincode}
            onChange={(event) =>
              setPincodeForm((current) => ({ ...current, pincode: event.target.value }))
            }
          />
          <Input
            label="City"
            value={pincodeForm.city}
            onChange={(event) =>
              setPincodeForm((current) => ({ ...current, city: event.target.value }))
            }
          />
          <Input
            label="State"
            value={pincodeForm.state}
            onChange={(event) =>
              setPincodeForm((current) => ({ ...current, state: event.target.value }))
            }
          />
          <Input
            label="Estimated delivery days"
            value={pincodeForm.estimated_delivery_days}
            onChange={(event) =>
              setPincodeForm((current) => ({
                ...current,
                estimated_delivery_days: event.target.value,
              }))
            }
          />
          <Button type="submit">Add pincode</Button>
        </form>

        <textarea
          className="input"
          rows={6}
          placeholder="Bulk import: pincode,city,state,delivery_days"
          value={importText}
          onChange={(event) => setImportText(event.target.value)}
        />
        <Button type="button" onClick={() => void handleImportPincodes()}>
          Import CSV lines
        </Button>

        <table className="data-table">
          <thead>
            <tr>
              <th>Pincode</th>
              <th>City</th>
              <th>State</th>
              <th>Delivery days</th>
              <th />
            </tr>
          </thead>
          <tbody>
            {pincodes.map((row) => (
              <tr key={row.id}>
                <td>{row.pincode}</td>
                <td>{row.city}</td>
                <td>{row.state}</td>
                <td>{row.estimated_delivery_days ?? "—"}</td>
                <td>
                  <Button
                    type="button"
                    variant="secondary"
                    onClick={() => void deleteServiceablePincode(row.id).then(refresh)}
                  >
                    Delete
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </Panel>

      <Panel title="Store locations">
        <form className="form-grid" onSubmit={(event) => void handleCreateStore(event)}>
          <Input label="Name" value={storeForm.name} onChange={(event) => setStoreForm((current) => ({ ...current, name: event.target.value }))} />
          <Input label="Address" value={storeForm.address} onChange={(event) => setStoreForm((current) => ({ ...current, address: event.target.value }))} />
          <Input label="City" value={storeForm.city} onChange={(event) => setStoreForm((current) => ({ ...current, city: event.target.value }))} />
          <Input label="State" value={storeForm.state} onChange={(event) => setStoreForm((current) => ({ ...current, state: event.target.value }))} />
          <Input label="Pincode" value={storeForm.pincode} onChange={(event) => setStoreForm((current) => ({ ...current, pincode: event.target.value }))} />
          <Input label="Phone" value={storeForm.phone} onChange={(event) => setStoreForm((current) => ({ ...current, phone: event.target.value }))} />
          <Input label="Latitude" value={storeForm.latitude} onChange={(event) => setStoreForm((current) => ({ ...current, latitude: event.target.value }))} />
          <Input label="Longitude" value={storeForm.longitude} onChange={(event) => setStoreForm((current) => ({ ...current, longitude: event.target.value }))} />
          <Button type="submit">Add store</Button>
        </form>

        <table className="data-table">
          <thead>
            <tr>
              <th>Name</th>
              <th>City</th>
              <th>Phone</th>
              <th>Active</th>
            </tr>
          </thead>
          <tbody>
            {stores.map((store) => (
              <tr key={store.id}>
                <td>{store.name}</td>
                <td>{store.city}</td>
                <td>{store.phone}</td>
                <td>{store.is_active ? "Yes" : "No"}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </Panel>
    </div>
  );
}

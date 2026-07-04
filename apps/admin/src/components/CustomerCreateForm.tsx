import { Input } from "./Input";

export interface CustomerCreateValues {
  phone: string;
  name: string;
  email: string;
  city: string;
}

interface CustomerCreateFormProps {
  values: CustomerCreateValues;
  onChange: (values: CustomerCreateValues) => void;
  onSubmit: () => void;
  onCancel: () => void;
  saving: boolean;
  error: string | null;
}

export function CustomerCreateForm({
  values,
  onChange,
  onSubmit,
  onCancel,
  saving,
  error,
}: CustomerCreateFormProps) {
  const patch = (partial: Partial<CustomerCreateValues>) => {
    onChange({ ...values, ...partial });
  };

  return (
    <form
      className="banner-form"
      onSubmit={(event) => {
        event.preventDefault();
        onSubmit();
      }}
    >
      <div className="banner-form__header">
        <h2>Add customer</h2>
        <p className="muted">
          Creates a customer record with KYC pending. Phone must be a valid Indian
          number (+91…).
        </p>
      </div>

      {error ? (
        <div className="login-card__alert" role="alert">
          {error}
        </div>
      ) : null}

      <Input
        label="Phone"
        value={values.phone}
        onChange={(event) => patch({ phone: event.target.value })}
        placeholder="+919876543210"
        required
        disabled={saving}
      />
      <Input
        label="Name"
        value={values.name}
        onChange={(event) => patch({ name: event.target.value })}
        required
        disabled={saving}
      />
      <div className="banner-form__row">
        <Input
          label="Email (optional)"
          type="email"
          value={values.email}
          onChange={(event) => patch({ email: event.target.value })}
          disabled={saving}
        />
        <Input
          label="City (optional)"
          value={values.city}
          onChange={(event) => patch({ city: event.target.value })}
          disabled={saving}
        />
      </div>

      <div className="banner-form__actions">
        <button
          type="button"
          className="btn btn--secondary"
          onClick={onCancel}
          disabled={saving}
        >
          Cancel
        </button>
        <button type="submit" className="btn btn--primary" disabled={saving}>
          {saving ? "Creating…" : "Create customer"}
        </button>
      </div>
    </form>
  );
}

export function emptyCustomerCreateValues(): CustomerCreateValues {
  return {
    phone: "+91",
    name: "",
    email: "",
    city: "",
  };
}

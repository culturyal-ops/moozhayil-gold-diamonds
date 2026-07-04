import { useEffect, useState } from "react";
import {
  BANNER_PLACEMENTS,
  type BannerFormValues,
} from "../config/cms";
import { Input } from "./Input";
import { MediaUploadField } from "./MediaUploadField";

interface BannerFormProps {
  values: BannerFormValues;
  onChange: (values: BannerFormValues) => void;
  onSubmit: () => void;
  onCancel: () => void;
  saving: boolean;
  error: string | null;
  mode: "create" | "edit";
}

export function BannerForm({
  values,
  onChange,
  onSubmit,
  onCancel,
  saving,
  error,
  mode,
}: BannerFormProps) {
  const [previewError, setPreviewError] = useState(false);

  useEffect(() => {
    setPreviewError(false);
  }, [values.image_url]);

  const patch = (partial: Partial<BannerFormValues>) => {
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
        <h2>{mode === "create" ? "New banner" : "Edit banner"}</h2>
        <p className="muted">
          Paste a public CDN URL. Use a 3:4 or 16:9 image for hero placements.
          Preview updates as you type.
        </p>
      </div>

      {error ? (
        <div className="login-card__alert" role="alert">
          {error}
        </div>
      ) : null}

      <Input
        label="Title"
        name="title"
        value={values.title}
        onChange={(event) => patch({ title: event.target.value })}
        required
        disabled={saving}
        placeholder="Festive collection launch"
      />

      <Input
        label="Image URL"
        name="image_url"
        type="url"
        value={values.image_url}
        onChange={(event) => patch({ image_url: event.target.value })}
        required
        disabled={saving}
        placeholder="https://cdn.example.com/banners/hero.jpg"
      />

      <MediaUploadField
        folder="banners"
        disabled={saving}
        onUploaded={(url) => patch({ image_url: url })}
      />

      {values.image_url && !previewError ? (
        <div className="banner-form__preview">
          <img
            src={values.image_url}
            alt="Banner preview"
            onError={() => setPreviewError(true)}
          />
        </div>
      ) : null}

      <div className="banner-form__row">
        <div className="field">
          <label className="field__label" htmlFor="placement">
            Placement
          </label>
          <select
            id="placement"
            className="field__input"
            value={values.placement}
            onChange={(event) => patch({ placement: event.target.value })}
            disabled={saving}
          >
            {BANNER_PLACEMENTS.map((item) => (
              <option key={item.value} value={item.value}>
                {item.label}
              </option>
            ))}
          </select>
        </div>

        <Input
          label="Sort order"
          name="sort_order"
          type="number"
          min={0}
          value={values.sort_order}
          onChange={(event) => patch({ sort_order: event.target.value })}
          disabled={saving}
        />
      </div>

      <div className="banner-form__row">
        <Input
          label="CTA label"
          name="cta_label"
          value={values.cta_label}
          onChange={(event) => patch({ cta_label: event.target.value })}
          disabled={saving}
          placeholder="Shop now"
        />
        <Input
          label="CTA route"
          name="cta_route"
          value={values.cta_route}
          onChange={(event) => patch({ cta_route: event.target.value })}
          disabled={saving}
          placeholder="/catalogue/festive"
        />
      </div>

      <div className="banner-form__row">
        <Input
          label="Valid from"
          name="valid_from"
          type="datetime-local"
          value={values.valid_from}
          onChange={(event) => patch({ valid_from: event.target.value })}
          disabled={saving}
        />
        <Input
          label="Valid to"
          name="valid_to"
          type="datetime-local"
          value={values.valid_to}
          onChange={(event) => patch({ valid_to: event.target.value })}
          disabled={saving}
        />
      </div>

      <label className="banner-form__toggle">
        <input
          type="checkbox"
          checked={values.is_active}
          onChange={(event) => patch({ is_active: event.target.checked })}
          disabled={saving}
        />
        <span>Active (visible in customer app when within validity window)</span>
      </label>

      <div className="banner-form__actions">
        <button type="button" className="btn btn--secondary" onClick={onCancel} disabled={saving}>
          Cancel
        </button>
        <button type="submit" className="btn btn--primary" disabled={saving}>
          {saving ? "Saving…" : mode === "create" ? "Create banner" : "Save changes"}
        </button>
      </div>
    </form>
  );
}

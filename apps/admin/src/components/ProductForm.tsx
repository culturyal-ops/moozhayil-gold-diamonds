import type {
  AdminProduct,
  ProductFormValues,
  ProductImageFormValues,
} from "../config/catalog";
import {
  PRODUCT_IMAGE_TYPES,
  PURITY_OPTIONS,
} from "../config/catalog";
import { Input } from "./Input";
import { MediaUploadField } from "./MediaUploadField";

interface ProductFormProps {
  mode: "create" | "edit";
  values: ProductFormValues;
  onChange: (values: ProductFormValues) => void;
  onSubmit: () => void;
  onCancel: () => void;
  saving: boolean;
  error: string | null;
  categories: Array<{ id: string; name: string }>;
  collections: Array<{ id: string; name: string }>;
  product?: AdminProduct | null;
  imageValues: ProductImageFormValues;
  onImageChange: (values: ProductImageFormValues) => void;
  onAddImage: () => void;
  addingImage: boolean;
  imageError: string | null;
}

export function ProductForm({
  mode,
  values,
  onChange,
  onSubmit,
  onCancel,
  saving,
  error,
  categories,
  collections,
  product,
  imageValues,
  onImageChange,
  onAddImage,
  addingImage,
  imageError,
}: ProductFormProps) {
  const patch = (partial: Partial<ProductFormValues>) => {
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
        <h2>{mode === "create" ? "New product" : "Edit product"}</h2>
        <p className="muted">
          Products save as draft until published. Add gallery URLs from your CDN —
          primary image first, then lifestyle and detail shots.
        </p>
      </div>

      {error ? (
        <div className="login-card__alert" role="alert">
          {error}
        </div>
      ) : null}

      <div className="banner-form__row">
        {mode === "create" ? (
          <Input
            label="SKU"
            value={values.sku}
            onChange={(event) => patch({ sku: event.target.value })}
            required
            disabled={saving}
          />
        ) : (
          <div className="field">
            <span className="field__label">SKU</span>
            <p>{values.sku}</p>
          </div>
        )}
        <Input
          label="Product name"
          value={values.name}
          onChange={(event) => patch({ name: event.target.value })}
          required
          disabled={saving}
        />
      </div>

      <div className="field">
        <label className="field__label" htmlFor="description">
          Description
        </label>
        <textarea
          id="description"
          className="field__input"
          rows={4}
          value={values.description}
          onChange={(event) => patch({ description: event.target.value })}
          disabled={saving}
        />
      </div>

      <div className="banner-form__row">
        <div className="field">
          <label className="field__label" htmlFor="category_id">
            Category
          </label>
          <select
            id="category_id"
            className="field__input"
            value={values.category_id}
            onChange={(event) => patch({ category_id: event.target.value })}
            required
            disabled={saving}
          >
            <option value="">Select category</option>
            {categories.map((category) => (
              <option key={category.id} value={category.id}>
                {category.name}
              </option>
            ))}
          </select>
        </div>
        <div className="field">
          <label className="field__label" htmlFor="collection_id">
            Collection
          </label>
          <select
            id="collection_id"
            className="field__input"
            value={values.collection_id}
            onChange={(event) => patch({ collection_id: event.target.value })}
            disabled={saving}
          >
            <option value="">None</option>
            {collections.map((collection) => (
              <option key={collection.id} value={collection.id}>
                {collection.name}
              </option>
            ))}
          </select>
        </div>
      </div>

      <div className="banner-form__row">
        <div className="field">
          <label className="field__label" htmlFor="purity">
            Purity
          </label>
          <select
            id="purity"
            className="field__input"
            value={values.purity}
            onChange={(event) =>
              patch({ purity: event.target.value as ProductFormValues["purity"] })
            }
            disabled={saving}
          >
            {PURITY_OPTIONS.map((option) => (
              <option key={option.value} value={option.value}>
                {option.label}
              </option>
            ))}
          </select>
        </div>
        <Input
          label="Weight (grams)"
          value={values.weight_grams}
          onChange={(event) => patch({ weight_grams: event.target.value })}
          required
          disabled={saving}
          placeholder="4.2500"
        />
      </div>

      <div className="banner-form__row">
        <Input
          label="Making charge %"
          value={values.making_charge_pct}
          onChange={(event) => patch({ making_charge_pct: event.target.value })}
          required
          disabled={saving}
        />
        <Input
          label="Wastage %"
          value={values.wastage_pct}
          onChange={(event) => patch({ wastage_pct: event.target.value })}
          disabled={saving}
        />
      </div>

      <div className="banner-form__row">
        <Input
          label="Stone value (paise)"
          type="number"
          min={0}
          value={values.stone_value_paise}
          onChange={(event) => patch({ stone_value_paise: event.target.value })}
          disabled={saving}
        />
        {mode === "create" ? (
          <Input
            label="GST %"
            value={values.gst_pct}
            onChange={(event) => patch({ gst_pct: event.target.value })}
            disabled={saving}
          />
        ) : (
          <div className="field">
            <span className="field__label">GST %</span>
            <p>{values.gst_pct}</p>
          </div>
        )}
        <Input
          label="Stock quantity"
          type="number"
          min={0}
          value={values.stock_quantity}
          onChange={(event) => patch({ stock_quantity: event.target.value })}
          disabled={saving}
        />
      </div>

      <label className="banner-form__toggle">
        <input
          type="checkbox"
          checked={values.is_featured}
          onChange={(event) => patch({ is_featured: event.target.checked })}
          disabled={saving}
        />
        <span>Featured product</span>
      </label>

      {mode === "edit" && product ? (
        <div className="product-images">
          <h3 className="panel__title">Gallery images</h3>
          {product.images.length > 0 ? (
            <div className="product-images__grid">
              {product.images.map((image) => (
                <div key={image.id} className="product-images__item">
                  <img src={image.url} alt="" />
                  <p className="muted">
                    {image.type}
                    {image.is_primary ? " · Primary" : ""}
                  </p>
                </div>
              ))}
            </div>
          ) : (
            <p className="muted">No images yet.</p>
          )}

          <div className="banner-form__row">
            <Input
              label="Image URL"
              type="url"
              value={imageValues.cdn_url}
              onChange={(event) =>
                onImageChange({ ...imageValues, cdn_url: event.target.value })
              }
              disabled={addingImage}
            />
            <MediaUploadField
              folder="products"
              disabled={addingImage}
              onUploaded={(url) =>
                onImageChange({ ...imageValues, cdn_url: url })
              }
            />
            <div className="field">
              <label className="field__label" htmlFor="image_type">
                Image type
              </label>
              <select
                id="image_type"
                className="field__input"
                value={imageValues.type}
                onChange={(event) =>
                  onImageChange({
                    ...imageValues,
                    type: event.target.value as ProductImageFormValues["type"],
                  })
                }
                disabled={addingImage}
              >
                {PRODUCT_IMAGE_TYPES.map((option) => (
                  <option key={option.value} value={option.value}>
                    {option.label}
                  </option>
                ))}
              </select>
            </div>
          </div>

          <div className="banner-form__row">
            <Input
              label="Sort order"
              type="number"
              min={0}
              value={imageValues.sort_order}
              onChange={(event) =>
                onImageChange({ ...imageValues, sort_order: event.target.value })
              }
              disabled={addingImage}
            />
            <label className="banner-form__toggle">
              <input
                type="checkbox"
                checked={imageValues.is_primary}
                onChange={(event) =>
                  onImageChange({ ...imageValues, is_primary: event.target.checked })
                }
                disabled={addingImage}
              />
              <span>Primary image</span>
            </label>
          </div>

          {imageError ? <p className="error">{imageError}</p> : null}

          <button
            type="button"
            className="btn btn--secondary"
            onClick={onAddImage}
            disabled={addingImage || !imageValues.cdn_url.trim()}
          >
            {addingImage ? "Adding…" : "Add image URL"}
          </button>
        </div>
      ) : null}

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
          {saving
            ? "Saving…"
            : mode === "create"
              ? "Save draft"
              : "Save changes"}
        </button>
      </div>
    </form>
  );
}

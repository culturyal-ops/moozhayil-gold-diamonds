import { useCallback, useEffect, useState } from "react";
import type { CatalogFormValues } from "../config/catalog";
import { emptyCatalogForm, slugify } from "../config/catalog";
import { Button } from "./Button";
import { EmptyState } from "./EmptyState";
import { Input } from "./Input";
import { LoadingState } from "./LoadingState";
import { PageHeader } from "./PageHeader";
import { Panel } from "./Panel";
import { StatusBadge } from "./StatusBadge";

export type CatalogEntityKind = "category" | "collection" | "occasion";

interface CatalogRow {
  id: string;
  name: string;
  slug: string;
  sortOrder: number;
  isActive: boolean;
  subtitle?: string | null;
  imageUrl?: string | null;
  iconUrl?: string | null;
  parentId?: string | null;
  isFeatured?: boolean;
}

interface CatalogManagerProps {
  title: string;
  subtitle: string;
  entityLabel: string;
  kind: CatalogEntityKind;
  loadRows: () => Promise<CatalogRow[]>;
  createRow: (payload: Record<string, unknown>) => Promise<void>;
  updateRow: (id: string, payload: Record<string, unknown>) => Promise<void>;
  categoryOptions?: Array<{ id: string; name: string }>;
}

type FormMode = "closed" | "create" | "edit";

export function CatalogManager({
  title,
  subtitle,
  entityLabel,
  kind,
  loadRows,
  createRow,
  updateRow,
  categoryOptions = [],
}: CatalogManagerProps) {
  const [rows, setRows] = useState<CatalogRow[]>([]);
  const [loading, setLoading] = useState(true);
  const [listError, setListError] = useState<string | null>(null);
  const [formMode, setFormMode] = useState<FormMode>("closed");
  const [formValues, setFormValues] = useState<CatalogFormValues>(emptyCatalogForm());
  const [editingId, setEditingId] = useState<string | null>(null);
  const [formError, setFormError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [slugTouched, setSlugTouched] = useState(false);

  const refresh = useCallback(async () => {
    setLoading(true);
    setListError(null);
    try {
      setRows(await loadRows());
    } catch (err) {
      setListError(err instanceof Error ? err.message : "Failed to load records");
    } finally {
      setLoading(false);
    }
  }, [loadRows]);

  useEffect(() => {
    void refresh();
  }, [refresh]);

  const openCreate = () => {
    setFormMode("create");
    setEditingId(null);
    setFormValues(emptyCatalogForm());
    setFormError(null);
    setSlugTouched(false);
  };

  const openEdit = (row: CatalogRow) => {
    setFormMode("edit");
    setEditingId(row.id);
    setFormValues(mapRowToForm(row));
    setFormError(null);
    setSlugTouched(true);
  };

  const closeForm = () => {
    setFormMode("closed");
    setEditingId(null);
    setFormError(null);
    setFormValues(emptyCatalogForm());
  };

  const patchForm = (partial: Partial<CatalogFormValues>) => {
    setFormValues((current) => {
      const next = { ...current, ...partial };
      if (!slugTouched && partial.name !== undefined && formMode === "create") {
        next.slug = slugify(partial.name);
      }
      return next;
    });
  };

  const handleSave = async () => {
    setSaving(true);
    setFormError(null);
    try {
      const payload = formToPayload(formValues, kind);
      if (formMode === "create") {
        await createRow(payload);
      } else if (editingId) {
        await updateRow(editingId, payload);
      }
      closeForm();
      await refresh();
    } catch (err) {
      setFormError(err instanceof Error ? err.message : "Failed to save");
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Catalogue"
        title={title}
        subtitle={subtitle}
        action={
          formMode === "closed" ? (
            <Button onClick={openCreate}>New {entityLabel.toLowerCase()}</Button>
          ) : null
        }
      />

      {formMode !== "closed" ? (
        <Panel>
          <form
            className="banner-form"
            onSubmit={(event) => {
              event.preventDefault();
              void handleSave();
            }}
          >
            <div className="banner-form__header">
              <h2>
                {formMode === "create"
                  ? `New ${entityLabel.toLowerCase()}`
                  : `Edit ${entityLabel.toLowerCase()}`}
              </h2>
            </div>

            {formError ? (
              <div className="login-card__alert" role="alert">
                {formError}
              </div>
            ) : null}

            <Input
              label="Name"
              value={formValues.name}
              onChange={(event) => patchForm({ name: event.target.value })}
              required
              disabled={saving}
            />

            <Input
              label="Slug"
              value={formValues.slug}
              onChange={(event) => {
                setSlugTouched(true);
                patchForm({ slug: event.target.value });
              }}
              required
              disabled={saving}
            />

            {kind === "collection" ? (
              <div className="field">
                <label className="field__label" htmlFor="description">
                  Description
                </label>
                <textarea
                  id="description"
                  className="field__input"
                  rows={3}
                  value={formValues.description}
                  onChange={(event) => patchForm({ description: event.target.value })}
                  disabled={saving}
                />
              </div>
            ) : null}

            {kind === "category" && categoryOptions.length > 0 ? (
              <div className="field">
                <label className="field__label" htmlFor="parent_id">
                  Parent category
                </label>
                <select
                  id="parent_id"
                  className="field__input"
                  value={formValues.parent_id}
                  onChange={(event) => patchForm({ parent_id: event.target.value })}
                  disabled={saving}
                >
                  <option value="">None</option>
                  {categoryOptions
                    .filter((option) => option.id !== editingId)
                    .map((option) => (
                      <option key={option.id} value={option.id}>
                        {option.name}
                      </option>
                    ))}
                </select>
              </div>
            ) : null}

            <div className="banner-form__row">
              {kind !== "collection" ? (
                <Input
                  label="Icon URL"
                  type="url"
                  value={formValues.icon_url}
                  onChange={(event) => patchForm({ icon_url: event.target.value })}
                  disabled={saving}
                />
              ) : null}
              <Input
                label={
                  kind === "collection"
                    ? "Cover image URL"
                    : kind === "occasion"
                      ? "Background image URL"
                      : "Image URL"
                }
                type="url"
                value={formValues.image_url}
                onChange={(event) => patchForm({ image_url: event.target.value })}
                disabled={saving}
              />
            </div>

            <Input
              label="Sort order"
              type="number"
              min={0}
              value={formValues.sort_order}
              onChange={(event) => patchForm({ sort_order: event.target.value })}
              disabled={saving}
            />

            <label className="banner-form__toggle">
              <input
                type="checkbox"
                checked={formValues.is_active}
                onChange={(event) => patchForm({ is_active: event.target.checked })}
                disabled={saving}
              />
              <span>Active</span>
            </label>

            {kind === "collection" ? (
              <label className="banner-form__toggle">
                <input
                  type="checkbox"
                  checked={formValues.is_featured}
                  onChange={(event) =>
                    patchForm({ is_featured: event.target.checked })
                  }
                  disabled={saving}
                />
                <span>Featured collection</span>
              </label>
            ) : null}

            <div className="banner-form__actions">
              <button
                type="button"
                className="btn btn--secondary"
                onClick={closeForm}
                disabled={saving}
              >
                Cancel
              </button>
              <button type="submit" className="btn btn--primary" disabled={saving}>
                {saving ? "Saving…" : formMode === "create" ? "Create" : "Save changes"}
              </button>
            </div>
          </form>
        </Panel>
      ) : null}

      <Panel title={`All ${entityLabel.toLowerCase()}s`}>
        {loading ? <LoadingState label={`Loading ${entityLabel.toLowerCase()}s…`} /> : null}
        {listError ? <p className="error">{listError}</p> : null}

        {!loading && !listError && rows.length === 0 ? (
          <EmptyState
            title={`No ${entityLabel.toLowerCase()}s yet`}
            description={`Create a ${entityLabel.toLowerCase()} to organize the customer catalogue.`}
            action={
              <Button onClick={openCreate}>New {entityLabel.toLowerCase()}</Button>
            }
          />
        ) : null}

        {!loading && rows.length > 0 ? (
          <div className="banner-table-wrap">
            <table className="data-table">
              <thead>
                <tr>
                  <th>Name</th>
                  <th>Slug</th>
                  <th>Sort</th>
                  {kind === "collection" ? <th>Featured</th> : null}
                  <th>Status</th>
                  <th>Actions</th>
                </tr>
              </thead>
              <tbody>
                {rows.map((row) => (
                  <tr key={row.id}>
                    <td>
                      <strong>{row.name}</strong>
                      {row.subtitle ? (
                        <div className="muted">{row.subtitle}</div>
                      ) : null}
                    </td>
                    <td>{row.slug}</td>
                    <td>{row.sortOrder}</td>
                    {kind === "collection" ? (
                      <td>{row.isFeatured ? "Yes" : "No"}</td>
                    ) : null}
                    <td>
                      <StatusBadge tone={row.isActive ? "active" : "neutral"}>
                        {row.isActive ? "Active" : "Inactive"}
                      </StatusBadge>
                    </td>
                    <td>
                      <button
                        type="button"
                        className="btn btn--ghost btn--sm"
                        onClick={() => openEdit(row)}
                      >
                        Edit
                      </button>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        ) : null}
      </Panel>
    </div>
  );
}

function mapRowToForm(row: CatalogRow): CatalogFormValues {
  return {
    name: row.name,
    slug: row.slug,
    description: row.subtitle ?? "",
    image_url: row.imageUrl ?? "",
    icon_url: row.iconUrl ?? "",
    parent_id: row.parentId ?? "",
    sort_order: String(row.sortOrder),
    is_active: row.isActive,
    is_featured: row.isFeatured ?? false,
  };
}

function formToPayload(values: CatalogFormValues, kind: CatalogEntityKind) {
  const sortOrder = Number.parseInt(values.sort_order, 10);
  const payload: Record<string, unknown> = {
    name: values.name.trim(),
    slug: values.slug.trim(),
    sort_order: Number.isNaN(sortOrder) ? 0 : sortOrder,
    is_active: values.is_active,
  };

  if (kind === "category") {
    if (values.parent_id) payload.parent_id = values.parent_id;
    if (values.icon_url.trim()) payload.icon_url = values.icon_url.trim();
    if (values.image_url.trim()) payload.image_url = values.image_url.trim();
  }

  if (kind === "collection") {
    if (values.description.trim()) payload.description = values.description.trim();
    if (values.image_url.trim()) payload.image_url = values.image_url.trim();
    payload.is_featured = values.is_featured;
  }

  if (kind === "occasion") {
    if (values.icon_url.trim()) payload.icon_url = values.icon_url.trim();
    if (values.image_url.trim()) payload.image_url = values.image_url.trim();
  }

  return payload;
}

export function mapCategoryRows(
  categories: Array<{
    id: string;
    name: string;
    slug: string;
    sortOrder: number;
    isActive: boolean;
    imageUrl: string | null;
    iconUrl: string | null;
    parentId: string | null;
  }>,
): CatalogRow[] {
  return categories.map((item) => ({
    id: item.id,
    name: item.name,
    slug: item.slug,
    sortOrder: item.sortOrder,
    isActive: item.isActive,
    imageUrl: item.imageUrl,
    iconUrl: item.iconUrl,
    parentId: item.parentId,
  }));
}

export function mapCollectionRows(
  collections: Array<{
    id: string;
    name: string;
    slug: string;
    description: string | null;
    sortOrder: number;
    isActive: boolean;
    isFeatured: boolean;
    coverImageUrl: string | null;
  }>,
): CatalogRow[] {
  return collections.map((item) => ({
    id: item.id,
    name: item.name,
    slug: item.slug,
    sortOrder: item.sortOrder,
    isActive: item.isActive,
    isFeatured: item.isFeatured,
    subtitle: item.description,
    imageUrl: item.coverImageUrl,
  }));
}

export function mapOccasionRows(
  occasions: Array<{
    id: string;
    name: string;
    slug: string;
    sortOrder: number;
    isActive: boolean;
    bgImageUrl: string | null;
    iconUrl: string | null;
  }>,
): CatalogRow[] {
  return occasions.map((item) => ({
    id: item.id,
    name: item.name,
    slug: item.slug,
    sortOrder: item.sortOrder,
    isActive: item.isActive,
    imageUrl: item.bgImageUrl,
    iconUrl: item.iconUrl,
  }));
}

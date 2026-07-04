import { useCallback, useEffect, useMemo, useState } from "react";
import { listCategories, listCollections } from "../api/catalog";
import {
  addProductImage,
  createProduct,
  getProduct,
  listProducts,
  publishProduct,
  updateProduct,
} from "../api/products";
import { Button } from "../components/Button";
import { EmptyState } from "../components/EmptyState";
import { LoadingState } from "../components/LoadingState";
import { PageHeader } from "../components/PageHeader";
import { Panel } from "../components/Panel";
import { ProductForm } from "../components/ProductForm";
import { ProductTable } from "../components/ProductTable";
import type { AdminProduct, ProductFormValues, ProductImageFormValues } from "../config/catalog";
import {
  emptyProductForm,
  emptyProductImageForm,
  productFormToCreatePayload,
  productFormToUpdatePayload,
  productToFormValues,
} from "../config/catalog";

type FormMode = "closed" | "create" | "edit";

export function ProductsPage() {
  const [products, setProducts] = useState<AdminProduct[]>([]);
  const [categories, setCategories] = useState<Array<{ id: string; name: string }>>([]);
  const [collections, setCollections] = useState<Array<{ id: string; name: string }>>([]);
  const [loading, setLoading] = useState(true);
  const [listError, setListError] = useState<string | null>(null);
  const [publishedFilter, setPublishedFilter] = useState<"all" | "published" | "draft">(
    "all",
  );
  const [formMode, setFormMode] = useState<FormMode>("closed");
  const [formValues, setFormValues] = useState<ProductFormValues>(emptyProductForm());
  const [editingProduct, setEditingProduct] = useState<AdminProduct | null>(null);
  const [formError, setFormError] = useState<string | null>(null);
  const [saving, setSaving] = useState(false);
  const [busyId, setBusyId] = useState<string | null>(null);
  const [imageValues, setImageValues] = useState<ProductImageFormValues>(
    emptyProductImageForm(),
  );
  const [addingImage, setAddingImage] = useState(false);
  const [imageError, setImageError] = useState<string | null>(null);

  const loadMeta = useCallback(async () => {
    const [categoryResult, collectionResult] = await Promise.all([
      listCategories(),
      listCollections(),
    ]);
    setCategories(
      categoryResult.categories.map((item) => ({ id: item.id, name: item.name })),
    );
    setCollections(
      collectionResult.collections.map((item) => ({ id: item.id, name: item.name })),
    );
  }, []);

  const loadProducts = useCallback(async () => {
    setLoading(true);
    setListError(null);
    try {
      const query =
        publishedFilter === "published"
          ? "?published_only=true"
          : publishedFilter === "draft"
            ? ""
            : "";
      const result = await listProducts(query);
      const rows =
        publishedFilter === "draft"
          ? result.products.filter((product) => !product.is_published)
          : result.products;
      setProducts(rows);
    } catch (err) {
      setListError(err instanceof Error ? err.message : "Failed to load products");
    } finally {
      setLoading(false);
    }
  }, [publishedFilter]);

  useEffect(() => {
    void loadMeta();
  }, [loadMeta]);

  useEffect(() => {
    void loadProducts();
  }, [loadProducts]);

  const categoryNames = useMemo(
    () => Object.fromEntries(categories.map((item) => [item.id, item.name])),
    [categories],
  );

  const collectionNames = useMemo(
    () => Object.fromEntries(collections.map((item) => [item.id, item.name])),
    [collections],
  );

  const openCreate = () => {
    setFormMode("create");
    setEditingProduct(null);
    setFormValues({
      ...emptyProductForm(),
      category_id: categories[0]?.id ?? "",
    });
    setFormError(null);
    setImageValues(emptyProductImageForm());
    setImageError(null);
  };

  const openEdit = async (product: AdminProduct) => {
    setBusyId(product.id);
    setFormError(null);
    try {
      const result = await getProduct(product.id);
      setEditingProduct(result.product);
      setFormValues(productToFormValues(result.product));
      setFormMode("edit");
      setImageValues(emptyProductImageForm());
      setImageError(null);
    } catch (err) {
      setListError(err instanceof Error ? err.message : "Failed to load product");
    } finally {
      setBusyId(null);
    }
  };

  const closeForm = () => {
    setFormMode("closed");
    setEditingProduct(null);
    setFormValues(emptyProductForm());
    setFormError(null);
    setImageValues(emptyProductImageForm());
    setImageError(null);
  };

  const handleSave = async () => {
    setSaving(true);
    setFormError(null);
    try {
      if (formMode === "create") {
        await createProduct(productFormToCreatePayload(formValues));
      } else if (editingProduct) {
        const result = await updateProduct(
          editingProduct.id,
          productFormToUpdatePayload(formValues),
        );
        setEditingProduct(result.product);
      }
      closeForm();
      await loadProducts();
    } catch (err) {
      setFormError(err instanceof Error ? err.message : "Failed to save product");
    } finally {
      setSaving(false);
    }
  };

  const handlePublish = async (product: AdminProduct) => {
    setBusyId(product.id);
    try {
      await publishProduct(product.id);
      await loadProducts();
    } catch (err) {
      setListError(err instanceof Error ? err.message : "Failed to publish product");
    } finally {
      setBusyId(null);
    }
  };

  const handleAddImage = async () => {
    if (!editingProduct) return;
    setAddingImage(true);
    setImageError(null);
    try {
      const sortOrder = Number.parseInt(imageValues.sort_order, 10);
      const url = imageValues.cdn_url.trim();
      await addProductImage(editingProduct.id, {
        cdn_url: url,
        s3_key: url,
        type: imageValues.type,
        sort_order: Number.isNaN(sortOrder) ? 0 : sortOrder,
        is_primary: imageValues.is_primary,
      });
      const result = await getProduct(editingProduct.id);
      setEditingProduct(result.product);
      setImageValues(emptyProductImageForm());
    } catch (err) {
      setImageError(err instanceof Error ? err.message : "Failed to add image");
    } finally {
      setAddingImage(false);
    }
  };

  return (
    <div className="page">
      <PageHeader
        eyebrow="Catalogue"
        title="Products"
        subtitle="Add jewellery SKUs, gallery images, stock, and publish to the customer catalogue."
        action={
          formMode === "closed" ? (
            <Button onClick={openCreate} disabled={categories.length === 0}>
              New product
            </Button>
          ) : null
        }
      />

      {categories.length === 0 ? (
        <Panel>
          <p className="muted">
            Create at least one category before adding products.
          </p>
        </Panel>
      ) : null}

      {formMode !== "closed" ? (
        <Panel>
          <ProductForm
            mode={formMode}
            values={formValues}
            onChange={setFormValues}
            onSubmit={() => void handleSave()}
            onCancel={closeForm}
            saving={saving}
            error={formError}
            categories={categories}
            collections={collections}
            product={editingProduct}
            imageValues={imageValues}
            onImageChange={setImageValues}
            onAddImage={() => void handleAddImage()}
            addingImage={addingImage}
            imageError={imageError}
          />
        </Panel>
      ) : null}

      <Panel title="All products">
        <div className="page-toolbar">
          <p className="muted">
            {products.length} product{products.length === 1 ? "" : "s"}
          </p>
          <select
            value={publishedFilter}
            onChange={(event) =>
              setPublishedFilter(event.target.value as typeof publishedFilter)
            }
            aria-label="Filter by publish status"
          >
            <option value="all">All statuses</option>
            <option value="published">Published only</option>
            <option value="draft">Draft only</option>
          </select>
        </div>

        {loading ? <LoadingState label="Loading products…" /> : null}
        {listError ? <p className="error">{listError}</p> : null}

        {!loading && !listError && products.length === 0 ? (
          <EmptyState
            title="No products yet"
            description="Create a draft product, add images, then publish when ready."
            action={
              categories.length > 0 ? (
                <Button onClick={openCreate}>New product</Button>
              ) : undefined
            }
          />
        ) : null}

        {!loading && products.length > 0 ? (
          <ProductTable
            products={products}
            categoryNames={categoryNames}
            collectionNames={collectionNames}
            busyId={busyId}
            onEdit={(product) => void openEdit(product)}
            onPublish={(product) => void handlePublish(product)}
          />
        ) : null}
      </Panel>
    </div>
  );
}

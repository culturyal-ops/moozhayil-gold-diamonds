export const PURITY_OPTIONS = [
  { value: "14k", label: "14K" },
  { value: "18k", label: "18K" },
  { value: "22k", label: "22K" },
  { value: "24k", label: "24K" },
] as const;

export const PRODUCT_IMAGE_TYPES = [
  { value: "white_background", label: "White background" },
  { value: "on_model", label: "On model" },
  { value: "detail", label: "Detail" },
  { value: "lifestyle", label: "Lifestyle" },
] as const;

export type PurityValue = (typeof PURITY_OPTIONS)[number]["value"];
export type ProductImageType = (typeof PRODUCT_IMAGE_TYPES)[number]["value"];

export interface CategoryRecord {
  id: string;
  name: string;
  slug: string;
  parentId: string | null;
  iconUrl: string | null;
  imageUrl: string | null;
  sortOrder: number;
  isActive: boolean;
}

export interface CollectionRecord {
  id: string;
  name: string;
  slug: string;
  description: string | null;
  coverImageUrl: string | null;
  sortOrder: number;
  isActive: boolean;
  isFeatured: boolean;
}

export interface OccasionRecord {
  id: string;
  name: string;
  slug: string;
  iconUrl: string | null;
  bgImageUrl: string | null;
  sortOrder: number;
  isActive: boolean;
}

export interface ProductImage {
  id: string;
  url: string;
  type: string;
  sort_order: number;
  is_primary: boolean;
}

export interface AdminProduct {
  id: string;
  sku: string;
  name: string;
  description: string | null;
  category_id: string;
  collection_id: string | null;
  purity: string;
  weight_grams: string;
  making_charge_pct: string;
  wastage_pct: string;
  stone_value_paise: number;
  gst_pct: string;
  stock_quantity: number;
  is_published: boolean;
  is_featured: boolean;
  images: ProductImage[];
}

export interface ProductFormValues {
  sku: string;
  name: string;
  description: string;
  category_id: string;
  collection_id: string;
  purity: PurityValue;
  weight_grams: string;
  making_charge_pct: string;
  wastage_pct: string;
  stone_value_paise: string;
  gst_pct: string;
  stock_quantity: string;
  is_featured: boolean;
}

export interface ProductImageFormValues {
  cdn_url: string;
  type: ProductImageType;
  sort_order: string;
  is_primary: boolean;
}

export interface CatalogFormValues {
  name: string;
  slug: string;
  description: string;
  image_url: string;
  icon_url: string;
  parent_id: string;
  sort_order: string;
  is_active: boolean;
  is_featured: boolean;
}

export function slugify(value: string): string {
  return value
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/^-+|-+$/g, "");
}

export function emptyCatalogForm(): CatalogFormValues {
  return {
    name: "",
    slug: "",
    description: "",
    image_url: "",
    icon_url: "",
    parent_id: "",
    sort_order: "0",
    is_active: true,
    is_featured: false,
  };
}

export function emptyProductForm(): ProductFormValues {
  return {
    sku: "",
    name: "",
    description: "",
    category_id: "",
    collection_id: "",
    purity: "22k",
    weight_grams: "",
    making_charge_pct: "12",
    wastage_pct: "0",
    stone_value_paise: "0",
    gst_pct: "3",
    stock_quantity: "0",
    is_featured: false,
  };
}

export function emptyProductImageForm(): ProductImageFormValues {
  return {
    cdn_url: "",
    type: "white_background",
    sort_order: "0",
    is_primary: false,
  };
}

export function productToFormValues(product: AdminProduct): ProductFormValues {
  return {
    sku: product.sku,
    name: product.name,
    description: product.description ?? "",
    category_id: product.category_id,
    collection_id: product.collection_id ?? "",
    purity: product.purity as PurityValue,
    weight_grams: product.weight_grams,
    making_charge_pct: product.making_charge_pct,
    wastage_pct: product.wastage_pct,
    stone_value_paise: String(product.stone_value_paise),
    gst_pct: product.gst_pct,
    stock_quantity: String(product.stock_quantity),
    is_featured: product.is_featured,
  };
}

export function productFormToCreatePayload(values: ProductFormValues) {
  const stock = Number.parseInt(values.stock_quantity, 10);
  const stone = Number.parseInt(values.stone_value_paise, 10);

  return {
    sku: values.sku.trim(),
    name: values.name.trim(),
    description: values.description.trim() || undefined,
    category_id: values.category_id,
    collection_id: values.collection_id || undefined,
    purity: values.purity,
    weight_grams: values.weight_grams.trim(),
    making_charge_pct: values.making_charge_pct.trim(),
    wastage_pct: values.wastage_pct.trim() || "0",
    stone_value_paise: Number.isNaN(stone) ? 0 : stone,
    gst_pct: values.gst_pct.trim() || "3",
    stock_quantity: Number.isNaN(stock) ? 0 : stock,
    is_featured: values.is_featured,
  };
}

export function productFormToUpdatePayload(values: ProductFormValues) {
  const payload = productFormToCreatePayload(values);
  const { sku: _sku, gst_pct: _gst, ...update } = payload;
  return update;
}

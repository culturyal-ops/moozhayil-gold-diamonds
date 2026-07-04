import type { Purity } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { deleteCacheByPrefix } from "../../utils/cache";
import { dbPurity } from "../gold_rates/gold_rates.service";
import { productInclude } from "../products/product.mapper";
import type {
  AdminProductCreateInput,
  AdminProductImageInput,
  AdminProductListInput,
  AdminProductUpdateInput,
} from "./admin.schema";

function mapAdminProduct(product: Awaited<ReturnType<typeof fetchProduct>>) {
  return {
    id: product.id,
    sku: product.sku,
    name: product.name,
    description: product.description,
    category_id: product.categoryId,
    collection_id: product.collectionId,
    purity: product.purity,
    weight_grams: product.weightGrams.toString(),
    making_charge_pct: product.makingChargePct.toString(),
    wastage_pct: product.wastagePct.toString(),
    stone_value_paise: product.stoneValuePaise,
    gst_pct: product.gstPct.toString(),
    stock_quantity: product.stockQuantity,
    is_published: product.isPublished,
    is_featured: product.isFeatured,
    images: product.images.map((image) => ({
      id: image.id,
      url: image.cdnUrl,
      type: image.type,
      sort_order: image.sortOrder,
      is_primary: image.isPrimary,
    })),
    created_at: product.createdAt.toISOString(),
    updated_at: product.updatedAt.toISOString(),
  };
}

async function fetchProduct(id: string) {
  const product = await prisma.product.findFirst({
    where: { id, deletedAt: null },
    include: {
      ...productInclude(),
      images: { orderBy: [{ sortOrder: "asc" }, { createdAt: "asc" }] },
    },
  });

  if (!product) {
    throw new AppError(404, "NOT_FOUND", "Product does not exist");
  }

  return product;
}

async function invalidateProductCaches() {
  await deleteCacheByPrefix("products:");
  await deleteCacheByPrefix("catalog:");
}

export class ProductsAdminService {
  async list(input: AdminProductListInput) {
    const products = await prisma.product.findMany({
      where: {
        deletedAt: null,
        ...(input.published_only ? { isPublished: true } : {}),
        ...(input.featured_only ? { isFeatured: true } : {}),
      },
      include: {
        ...productInclude(),
        images: { orderBy: [{ sortOrder: "asc" }] },
      },
      orderBy: [{ sortOrder: "asc" }, { createdAt: "desc" }],
      cursor: input.cursor ? { id: input.cursor } : undefined,
      skip: input.cursor ? 1 : 0,
      take: input.limit + 1,
    });

    return {
      products: products.slice(0, input.limit).map(mapAdminProduct),
      next_cursor: products.length > input.limit ? products[input.limit].id : null,
    };
  }

  async get(productId: string) {
    return { product: mapAdminProduct(await fetchProduct(productId)) };
  }

  async create(
    adminId: string,
    input: AdminProductCreateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const product = await prisma.product.create({
      data: {
        sku: input.sku,
        name: input.name,
        description: input.description,
        categoryId: input.category_id,
        collectionId: input.collection_id,
        purity: dbPurity(input.purity) as Purity,
        weightGrams: input.weight_grams,
        makingChargePct: input.making_charge_pct,
        wastagePct: input.wastage_pct ?? 0,
        stoneValuePaise: input.stone_value_paise ?? 0,
        gstPct: input.gst_pct ?? 3,
        stockQuantity: input.stock_quantity ?? 0,
        isFeatured: input.is_featured ?? false,
      },
      include: {
        ...productInclude(),
        images: true,
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "product_created",
      entityType: "product",
      entityId: product.id,
      after: { sku: product.sku, name: product.name },
      requestId,
      ipAddress,
    });

    await invalidateProductCaches();
    return { product: mapAdminProduct(product) };
  }

  async update(
    productId: string,
    adminId: string,
    input: AdminProductUpdateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const beforeProduct = await fetchProduct(productId);
    const product = await prisma.product.update({
      where: { id: productId },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.description !== undefined
          ? { description: input.description }
          : {}),
        ...(input.category_id !== undefined
          ? { categoryId: input.category_id }
          : {}),
        ...(input.collection_id !== undefined
          ? { collectionId: input.collection_id }
          : {}),
        ...(input.purity !== undefined
          ? { purity: dbPurity(input.purity) as Purity }
          : {}),
        ...(input.weight_grams !== undefined
          ? { weightGrams: input.weight_grams }
          : {}),
        ...(input.making_charge_pct !== undefined
          ? { makingChargePct: input.making_charge_pct }
          : {}),
        ...(input.wastage_pct !== undefined
          ? { wastagePct: input.wastage_pct }
          : {}),
        ...(input.stone_value_paise !== undefined
          ? { stoneValuePaise: input.stone_value_paise }
          : {}),
        ...(input.stock_quantity !== undefined
          ? { stockQuantity: input.stock_quantity }
          : {}),
        ...(input.is_featured !== undefined
          ? { isFeatured: input.is_featured }
          : {}),
      },
      include: {
        ...productInclude(),
        images: { orderBy: [{ sortOrder: "asc" }] },
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "product_updated",
      entityType: "product",
      entityId: productId,
      before: { name: beforeProduct.name, stock: beforeProduct.stockQuantity },
      after: { name: product.name, stock: product.stockQuantity },
      requestId,
      ipAddress,
    });

    await invalidateProductCaches();
    return { product: mapAdminProduct(product) };
  }

  async addImage(
    productId: string,
    adminId: string,
    input: AdminProductImageInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    await fetchProduct(productId);

    if (input.is_primary) {
      await prisma.productImage.updateMany({
        where: { productId },
        data: { isPrimary: false },
      });
    }

    const image = await prisma.productImage.create({
      data: {
        productId,
        s3Key: input.s3_key,
        cdnUrl: input.cdn_url,
        type: input.type,
        sortOrder: input.sort_order ?? 0,
        isPrimary: input.is_primary ?? false,
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "product_image_added",
      entityType: "product",
      entityId: productId,
      after: { image_id: image.id },
      requestId,
      ipAddress,
    });

    await invalidateProductCaches();
    return {
      image: {
        id: image.id,
        url: image.cdnUrl,
        type: image.type,
        sort_order: image.sortOrder,
        is_primary: image.isPrimary,
      },
    };
  }

  async publish(
    productId: string,
    adminId: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const beforeProduct = await fetchProduct(productId);
    const product = await prisma.product.update({
      where: { id: productId },
      data: { isPublished: true },
      include: {
        ...productInclude(),
        images: { orderBy: [{ sortOrder: "asc" }] },
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "product_published",
      entityType: "product",
      entityId: productId,
      before: { is_published: beforeProduct.isPublished },
      after: { is_published: true },
      requestId,
      ipAddress,
    });

    await invalidateProductCaches();
    return { product: mapAdminProduct(product) };
  }
}

export const productsAdminService = new ProductsAdminService();

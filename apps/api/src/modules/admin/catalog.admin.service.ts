import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { deleteCacheByPrefix } from "../../utils/cache";
import type {
  AdminCatalogCreateInput,
  AdminCatalogUpdateInput,
} from "./admin.schema";

type CatalogEntity = "category" | "collection" | "occasion";

async function invalidateCatalogCaches() {
  await deleteCacheByPrefix("catalog:");
  await deleteCacheByPrefix("cms:");
}

export class CatalogAdminService {
  async listCategories() {
    const categories = await prisma.category.findMany({
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    return { categories };
  }

  async createCategory(
    adminId: string,
    input: AdminCatalogCreateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const category = await prisma.category.create({
      data: {
        name: input.name,
        slug: input.slug,
        parentId: input.parent_id,
        iconUrl: input.icon_url,
        imageUrl: input.image_url,
        sortOrder: input.sort_order ?? 0,
        isActive: input.is_active ?? true,
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "category",
      entityId: category.id,
      action: "catalog_category_created",
      after: { name: category.name, slug: category.slug },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { category };
  }

  async updateCategory(
    id: string,
    adminId: string,
    input: AdminCatalogUpdateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const category = await prisma.category.update({
      where: { id },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.slug !== undefined ? { slug: input.slug } : {}),
        ...(input.parent_id !== undefined ? { parentId: input.parent_id } : {}),
        ...(input.icon_url !== undefined ? { iconUrl: input.icon_url } : {}),
        ...(input.image_url !== undefined ? { imageUrl: input.image_url } : {}),
        ...(input.sort_order !== undefined ? { sortOrder: input.sort_order } : {}),
        ...(input.is_active !== undefined ? { isActive: input.is_active } : {}),
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "category",
      entityId: id,
      action: "catalog_category_updated",
      after: { name: category.name },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { category };
  }

  async listCollections() {
    const collections = await prisma.collection.findMany({
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    return { collections };
  }

  async createCollection(
    adminId: string,
    input: AdminCatalogCreateInput & { description?: string; is_featured?: boolean },
    requestId?: string,
    ipAddress?: string,
  ) {
    const collection = await prisma.collection.create({
      data: {
        name: input.name,
        slug: input.slug,
        description: input.description,
        coverImageUrl: input.image_url,
        sortOrder: input.sort_order ?? 0,
        isActive: input.is_active ?? true,
        isFeatured: input.is_featured ?? false,
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "collection",
      entityId: collection.id,
      action: "catalog_collection_created",
      after: { name: collection.name },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { collection };
  }

  async updateCollection(
    id: string,
    adminId: string,
    input: AdminCatalogUpdateInput & { description?: string; is_featured?: boolean },
    requestId?: string,
    ipAddress?: string,
  ) {
    const collection = await prisma.collection.update({
      where: { id },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.slug !== undefined ? { slug: input.slug } : {}),
        ...(input.description !== undefined
          ? { description: input.description }
          : {}),
        ...(input.image_url !== undefined
          ? { coverImageUrl: input.image_url }
          : {}),
        ...(input.sort_order !== undefined ? { sortOrder: input.sort_order } : {}),
        ...(input.is_active !== undefined ? { isActive: input.is_active } : {}),
        ...(input.is_featured !== undefined
          ? { isFeatured: input.is_featured }
          : {}),
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "collection",
      entityId: id,
      action: "catalog_collection_updated",
      after: { name: collection.name },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { collection };
  }

  async listOccasions() {
    const occasions = await prisma.occasion.findMany({
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    return { occasions };
  }

  async createOccasion(
    adminId: string,
    input: AdminCatalogCreateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const occasion = await prisma.occasion.create({
      data: {
        name: input.name,
        slug: input.slug,
        iconUrl: input.icon_url,
        bgImageUrl: input.image_url,
        sortOrder: input.sort_order ?? 0,
        isActive: input.is_active ?? true,
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "occasion",
      entityId: occasion.id,
      action: "catalog_occasion_created",
      after: { name: occasion.name },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { occasion };
  }

  async updateOccasion(
    id: string,
    adminId: string,
    input: AdminCatalogUpdateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const existing = await prisma.occasion.findUnique({ where: { id } });
    if (!existing) {
      throw new AppError(404, "NOT_FOUND", "Occasion does not exist");
    }

    const occasion = await prisma.occasion.update({
      where: { id },
      data: {
        ...(input.name !== undefined ? { name: input.name } : {}),
        ...(input.slug !== undefined ? { slug: input.slug } : {}),
        ...(input.icon_url !== undefined ? { iconUrl: input.icon_url } : {}),
        ...(input.image_url !== undefined ? { bgImageUrl: input.image_url } : {}),
        ...(input.sort_order !== undefined ? { sortOrder: input.sort_order } : {}),
        ...(input.is_active !== undefined ? { isActive: input.is_active } : {}),
      },
    });

    await this.auditCatalogChange({
      adminId,
      entity: "occasion",
      entityId: id,
      action: "catalog_occasion_updated",
      after: { name: occasion.name },
      requestId,
      ipAddress,
    });
    await invalidateCatalogCaches();
    return { occasion };
  }

  private async auditCatalogChange(input: {
    adminId: string;
    entity: CatalogEntity;
    entityId: string;
    action: string;
    after: Record<string, unknown>;
    requestId?: string;
    ipAddress?: string;
  }) {
    await writeAuditLog({
      actorType: "admin",
      actorId: input.adminId,
      action: input.action,
      entityType: input.entity,
      entityId: input.entityId,
      after: input.after,
      requestId: input.requestId,
      ipAddress: input.ipAddress,
    });
  }
}

export const catalogAdminService = new CatalogAdminService();

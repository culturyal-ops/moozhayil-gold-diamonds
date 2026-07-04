import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { deleteCacheByPrefix } from "../../utils/cache";
import type { AdminBannerCreateInput, AdminBannerUpdateInput } from "./admin.schema";

function mapBanner(banner: {
  id: string;
  title: string;
  imageUrl: string;
  ctaLabel: string | null;
  ctaRoute: string | null;
  placement: string;
  sortOrder: number;
  validFrom: Date | null;
  validTo: Date | null;
  isActive: boolean;
}) {
  return {
    id: banner.id,
    title: banner.title,
    image_url: banner.imageUrl,
    cta_label: banner.ctaLabel,
    cta_route: banner.ctaRoute,
    placement: banner.placement,
    sort_order: banner.sortOrder,
    valid_from: banner.validFrom?.toISOString() ?? null,
    valid_to: banner.validTo?.toISOString() ?? null,
    is_active: banner.isActive,
  };
}

async function invalidateBannerCaches() {
  await deleteCacheByPrefix("cms:banners:");
}

export class CmsAdminService {
  async listBanners(placement?: string) {
    const banners = await prisma.cmsBanner.findMany({
      where: {
        deletedAt: null,
        ...(placement ? { placement } : {}),
      },
      orderBy: [{ placement: "asc" }, { sortOrder: "asc" }],
    });

    return { banners: banners.map(mapBanner) };
  }

  async createBanner(
    adminId: string,
    input: AdminBannerCreateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const banner = await prisma.cmsBanner.create({
      data: {
        title: input.title,
        imageUrl: input.image_url,
        ctaLabel: input.cta_label,
        ctaRoute: input.cta_route,
        placement: input.placement,
        sortOrder: input.sort_order ?? 0,
        validFrom: input.valid_from ? new Date(input.valid_from) : null,
        validTo: input.valid_to ? new Date(input.valid_to) : null,
        isActive: input.is_active ?? true,
        createdByAdminId: adminId,
        updatedByAdminId: adminId,
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "cms_banner_created",
      entityType: "cms_banner",
      entityId: banner.id,
      after: { title: banner.title, placement: banner.placement },
      requestId,
      ipAddress,
    });

    await invalidateBannerCaches();
    return { banner: mapBanner(banner) };
  }

  async updateBanner(
    bannerId: string,
    adminId: string,
    input: AdminBannerUpdateInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const existing = await prisma.cmsBanner.findFirst({
      where: { id: bannerId, deletedAt: null },
    });

    if (!existing) {
      throw new AppError(404, "NOT_FOUND", "Banner does not exist");
    }

    const banner = await prisma.cmsBanner.update({
      where: { id: bannerId },
      data: {
        ...(input.title !== undefined ? { title: input.title } : {}),
        ...(input.image_url !== undefined ? { imageUrl: input.image_url } : {}),
        ...(input.cta_label !== undefined ? { ctaLabel: input.cta_label } : {}),
        ...(input.cta_route !== undefined ? { ctaRoute: input.cta_route } : {}),
        ...(input.placement !== undefined ? { placement: input.placement } : {}),
        ...(input.sort_order !== undefined ? { sortOrder: input.sort_order } : {}),
        ...(input.valid_from !== undefined
          ? { validFrom: input.valid_from ? new Date(input.valid_from) : null }
          : {}),
        ...(input.valid_to !== undefined
          ? { validTo: input.valid_to ? new Date(input.valid_to) : null }
          : {}),
        ...(input.is_active !== undefined ? { isActive: input.is_active } : {}),
        updatedByAdminId: adminId,
      },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "cms_banner_updated",
      entityType: "cms_banner",
      entityId: bannerId,
      before: { title: existing.title, is_active: existing.isActive },
      after: { title: banner.title, is_active: banner.isActive },
      requestId,
      ipAddress,
    });

    await invalidateBannerCaches();
    return { banner: mapBanner(banner) };
  }

  /** Home content, announcements, and campaigns use banner placements. */
  async listHomeContent() {
    const placements = ["home_hero", "home_featured", "announcement_bar", "campaign"];
    const banners = await prisma.cmsBanner.findMany({
      where: {
        deletedAt: null,
        placement: { in: placements },
      },
      orderBy: [{ placement: "asc" }, { sortOrder: "asc" }],
    });

    return {
      home_content: Object.fromEntries(
        placements.map((placement) => [
          placement,
          banners.filter((b) => b.placement === placement).map(mapBanner),
        ]),
      ),
    };
  }

  async listFeaturedProducts() {
    const products = await prisma.product.findMany({
      where: { isFeatured: true, isPublished: true, deletedAt: null },
      select: {
        id: true,
        sku: true,
        name: true,
        stockQuantity: true,
        sortOrder: true,
      },
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });

    return { featured_products: products };
  }
}

export const cmsAdminService = new CmsAdminService();

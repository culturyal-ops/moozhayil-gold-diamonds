import { prisma } from "../../db/prisma";
import { getJsonCache, setJsonCache } from "../../utils/cache";

export class CmsService {
  async banners(input: { placement?: string }) {
    const placement = input.placement ?? "home_hero";
    const cacheKey = `cms:banners:${placement}`;
    const cached = await getJsonCache<{ banners: unknown[] }>(cacheKey);
    if (cached) {
      return cached;
    }

    const now = new Date();
    const banners = await prisma.cmsBanner.findMany({
      where: {
        placement,
        isActive: true,
        deletedAt: null,
        OR: [{ validFrom: null }, { validFrom: { lte: now } }],
        AND: [{ OR: [{ validTo: null }, { validTo: { gte: now } }] }],
      },
      orderBy: [{ sortOrder: "asc" }, { createdAt: "desc" }],
    });
    const response = {
      banners: banners.map((banner) => ({
        id: banner.id,
        title: banner.title,
        image_url: banner.imageUrl,
        cta_label: banner.ctaLabel,
        cta_route: banner.ctaRoute,
        placement: banner.placement,
      })),
    };

    await setJsonCache(cacheKey, response, 5 * 60);
    return response;
  }
}

export const cmsService = new CmsService();

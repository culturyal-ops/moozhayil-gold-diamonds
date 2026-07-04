import { prisma } from "../../db/prisma";
import { getJsonCache, setJsonCache } from "../../utils/cache";

export class CatalogService {
  async categories() {
    const cacheKey = "catalog:categories";
    const cached = await getJsonCache<{ categories: unknown[] }>(cacheKey);
    if (cached) {
      return cached;
    }

    const categories = await prisma.category.findMany({
      where: { isActive: true },
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    const response = {
      categories: categories.map((category) => ({
        id: category.id,
        name: category.name,
        slug: category.slug,
        icon_url: category.iconUrl,
        image_url: category.imageUrl,
      })),
    };

    await setJsonCache(cacheKey, response, 10 * 60);
    return response;
  }

  async collections(input: { featuredOnly?: boolean }) {
    const cacheKey = `catalog:collections:${input.featuredOnly ? "featured" : "all"}`;
    const cached = await getJsonCache<{ collections: unknown[] }>(cacheKey);
    if (cached) {
      return cached;
    }

    const today = new Date();
    const collections = await prisma.collection.findMany({
      where: {
        isActive: true,
        ...(input.featuredOnly ? { isFeatured: true } : {}),
        OR: [{ validFrom: null }, { validFrom: { lte: today } }],
        AND: [{ OR: [{ validTo: null }, { validTo: { gte: today } }] }],
      },
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    const response = {
      collections: collections.map((collection) => ({
        id: collection.id,
        name: collection.name,
        slug: collection.slug,
        description: collection.description,
        cover_image: collection.coverImageUrl,
        is_featured: collection.isFeatured,
      })),
    };

    await setJsonCache(cacheKey, response, 10 * 60);
    return response;
  }

  async occasions() {
    const cacheKey = "catalog:occasions";
    const cached = await getJsonCache<{ occasions: unknown[] }>(cacheKey);
    if (cached) {
      return cached;
    }

    const occasions = await prisma.occasion.findMany({
      where: { isActive: true },
      orderBy: [{ sortOrder: "asc" }, { name: "asc" }],
    });
    const response = {
      occasions: occasions.map((occasion) => ({
        id: occasion.id,
        name: occasion.name,
        slug: occasion.slug,
        icon_url: occasion.iconUrl,
        bg_image_url: occasion.bgImageUrl,
      })),
    };

    await setJsonCache(cacheKey, response, 10 * 60);
    return response;
  }
}

export const catalogService = new CatalogService();

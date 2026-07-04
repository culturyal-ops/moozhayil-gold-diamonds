import request from "supertest";
import { createApp } from "../src/app";
import { prisma } from "../src/db/prisma";

async function cleanCatalogTables() {
  await prisma.productOccasionTag.deleteMany();
  await prisma.productImage.deleteMany();
  await prisma.product.deleteMany();
  await prisma.cmsBanner.deleteMany();
  await prisma.goldRateHistory.deleteMany();
  await prisma.occasion.deleteMany();
  await prisma.collection.deleteMany();
  await prisma.category.deleteMany();
}

async function seedCatalog() {
  const category = await prisma.category.create({
    data: { name: "Bangles & Kadas", slug: "bangles-kadas" },
  });
  const collection = await prisma.collection.create({
    data: {
      name: "Temple Collection",
      slug: "temple",
      isFeatured: true,
    },
  });
  const occasion = await prisma.occasion.create({
    data: { name: "Wedding", slug: "wedding" },
  });
  await prisma.goldRateHistory.create({
    data: {
      purity: "k22",
      ratePerGramPaise: 624000,
      effectiveFrom: new Date("2026-06-26T04:30:00Z"),
      source: "test",
    },
  });
  const product = await prisma.product.create({
    data: {
      sku: "MGD-NK-001",
      name: "Lakshmi Kada Temple Bangle Pair",
      description: "A bridal temple bangle pair.",
      categoryId: category.id,
      collectionId: collection.id,
      purity: "k22",
      weightGrams: "13.6000",
      makingChargePct: "12.00",
      stockQuantity: 3,
      isPublished: true,
      isFeatured: true,
      images: {
        create: {
          s3Key: "products/test/main.jpg",
          cdnUrl: "https://cdn.moozhayil.com/products/test/main.jpg",
          type: "white_background",
          isPrimary: true,
        },
      },
      occasionTags: {
        create: { occasionId: occasion.id },
      },
    },
  });
  await prisma.cmsBanner.create({
    data: {
      title: "Temple gold for wedding moments",
      imageUrl: "https://cdn.moozhayil.com/banners/home.jpg",
      ctaLabel: "Explore",
      ctaRoute: "/shop/collection/test",
      placement: "home_hero",
      isActive: true,
    },
  });

  return { category, collection, occasion, product };
}

describe("Phase 4 catalog APIs", () => {
  const app = createApp();

  beforeEach(async () => {
    await cleanCatalogTables();
  });

  afterAll(async () => {
    await cleanCatalogTables();
    await prisma.$disconnect();
  });

  it("returns catalog taxonomy and CMS banners", async () => {
    await seedCatalog();

    const [categories, collections, occasions, banners] = await Promise.all([
      request(app).get("/v1/categories"),
      request(app).get("/v1/collections?featured_only=true"),
      request(app).get("/v1/occasions"),
      request(app).get("/v1/banners?placement=home_hero"),
    ]);

    expect(categories.body.categories).toHaveLength(1);
    expect(collections.body.collections[0]).toMatchObject({
      name: "Temple Collection",
      is_featured: true,
    });
    expect(occasions.body.occasions[0].name).toBe("Wedding");
    expect(banners.body.banners[0]).toMatchObject({
      title: "Temple gold for wedding moments",
      placement: "home_hero",
    });
  });

  it("returns product list and detail with server-computed paise pricing", async () => {
    const { product } = await seedCatalog();

    const list = await request(app).get("/v1/products?limit=10");

    expect(list.status).toBe(200);
    expect(list.body.data[0]).toMatchObject({
      id: product.id,
      price: {
        total_paise: 9789911,
        rate_used_paise: 624000,
      },
      stock_available: true,
      stock_label: "Only 3 left",
      badges: ["new"],
    });

    const detail = await request(app).get(`/v1/products/${product.id}`);

    expect(detail.status).toBe(200);
    expect(detail.body.images).toHaveLength(1);
    expect(detail.body.weight_display).toBe("13.6g");
    expect(detail.body.price.total_display).toBe("₹97,899");
  });

  it("sanitizes search query and searches products categories and collections", async () => {
    await seedCatalog();

    const response = await request(app).get(
      "/v1/products/search?q=Temple%20%3Cscript%3E&limit=5",
    );

    expect(response.status).toBe(200);
    expect(response.body.query).toBe("Temple script");
    expect(response.body.results.products[0].name).toContain("Temple");
    expect(response.body.results.collections[0].name).toContain("Temple");
  });
});

import "dotenv/config";
import { PrismaClient, Purity, ProductImageType } from "@prisma/client";
import { loadEnv } from "../src/config/env";

const prisma = new PrismaClient();

function assertDemoSeedAllowed() {
  const env = loadEnv();
  if (env.NODE_ENV === "production") {
    console.error("Demo catalog seed is disabled in production.");
    process.exit(1);
  }
  if (!env.ENABLE_DEMO_SEEDS) {
    console.error("Set ENABLE_DEMO_SEEDS=true to run demo catalog seed.");
    process.exit(1);
  }
}

const PRODUCT_IMAGE =
  "https://images.unsplash.com/photo-1611652022419-a9419f74343d?auto=format&fit=crop&w=800&q=80";

const DEMO_PRODUCTS = [
  {
    sku: "MZ-NK-001",
    name: "Temple Bloom Necklace",
    description: "22k gold necklace with temple-inspired detailing.",
    weightGrams: "8.5000",
    makingChargePct: "12.00",
    stockQuantity: 5,
    isFeatured: true,
  },
  {
    sku: "MZ-RG-002",
    name: "Heritage Band Ring",
    description: "Classic 22k band ring for everyday elegance.",
    weightGrams: "4.2000",
    makingChargePct: "10.00",
    stockQuantity: 8,
    isFeatured: true,
  },
  {
    sku: "MZ-ER-003",
    name: "Lotus Stud Earrings",
    description: "Lightweight studs with a lotus motif.",
    weightGrams: "3.1000",
    makingChargePct: "11.00",
    stockQuantity: 12,
    isFeatured: false,
  },
  {
    sku: "MZ-BR-004",
    name: "Crest Cuff Bangle",
    description: "Statement bangle from the Crest collection.",
    weightGrams: "12.0000",
    makingChargePct: "9.00",
    stockQuantity: 3,
    isFeatured: true,
  },
] as const;

async function main() {
  assertDemoSeedAllowed();

  let category = await prisma.category.findUnique({
    where: { slug: "necklaces" },
  });

  if (!category) {
    category = await prisma.category.create({
      data: {
        name: "Necklaces",
        slug: "necklaces",
        sortOrder: 0,
        isActive: true,
      },
    });
    console.log("Created category: Necklaces");
  }

  let collection = await prisma.collection.findUnique({
    where: { slug: "onam-2026" },
  });

  if (!collection) {
    collection = await prisma.collection.create({
      data: {
        name: "Onam 2026",
        slug: "onam-2026",
        description: "Festive pieces for Onam celebrations.",
        coverImageUrl: PRODUCT_IMAGE,
        isActive: true,
        isFeatured: true,
        sortOrder: 0,
      },
    });
    console.log("Created collection: Onam 2026");
  }

  let occasion = await prisma.occasion.findUnique({
    where: { slug: "wedding" },
  });

  if (!occasion) {
    occasion = await prisma.occasion.create({
      data: {
        name: "Wedding",
        slug: "wedding",
        isActive: true,
        sortOrder: 0,
      },
    });
    console.log("Created occasion: Wedding");
  }

  for (const demo of DEMO_PRODUCTS) {
    const existing = await prisma.product.findUnique({
      where: { sku: demo.sku },
    });

    if (existing) {
      console.log(`Product already exists: ${demo.sku}`);
      continue;
    }

    const product = await prisma.product.create({
      data: {
        sku: demo.sku,
        name: demo.name,
        description: demo.description,
        categoryId: category.id,
        collectionId: collection.id,
        purity: Purity.k22,
        weightGrams: demo.weightGrams,
        makingChargePct: demo.makingChargePct,
        stockQuantity: demo.stockQuantity,
        isPublished: true,
        isFeatured: demo.isFeatured,
        images: {
          create: {
            s3Key: `catalog/${demo.sku}.jpg`,
            cdnUrl: PRODUCT_IMAGE,
            type: ProductImageType.white_background,
            sortOrder: 0,
            isPrimary: true,
          },
        },
        occasionTags: {
          create: { occasionId: occasion.id },
        },
      },
    });

    console.log(`Created product: ${product.name} (${product.sku})`);
  }
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());

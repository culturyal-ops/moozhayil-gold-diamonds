import "dotenv/config";
import { PrismaClient } from "@prisma/client";import { loadEnv } from "../src/config/env";

const prisma = new PrismaClient();

function assertDemoSeedAllowed() {
  const env = loadEnv();
  if (env.NODE_ENV === "production") {
    console.error("Demo banner seed is disabled in production.");
    process.exit(1);
  }
  if (!env.ENABLE_DEMO_SEEDS) {
    console.error("Set ENABLE_DEMO_SEEDS=true to run demo banner seed.");
    process.exit(1);
  }
}

async function main() {
  assertDemoSeedAllowed();

  const existing = await prisma.cmsBanner.findFirst({    where: { placement: "home_hero", deletedAt: null },
  });

  if (existing) {
    console.log("Home hero banner already exists:", existing.title);
    return;
  }

  const admin = await prisma.adminUser.findUnique({
    where: { email: "admin@moozhayil.com" },
  });

  await prisma.cmsBanner.create({
    data: {
      title: "Onam Collection",
      imageUrl:
        "https://images.unsplash.com/photo-1611652022419-a9419f74343d?auto=format&fit=crop&w=1600&q=80",
      ctaLabel: "Shop now",
      ctaRoute: "/shop",
      placement: "home_hero",
      sortOrder: 0,
      isActive: true,
      createdByAdminId: admin?.id,
      updatedByAdminId: admin?.id,
    },
  });

  console.log("Sample home hero banner created");
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());

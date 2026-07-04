import "dotenv/config";
import { PrismaClient, type AdminRole } from "@prisma/client";
import { hashPassword } from "../src/utils/password";

const prisma = new PrismaClient();

const ADMIN_ROLES: AdminRole[] = [
  "super_admin",
  "catalog_manager",
  "kyc_reviewer",
  "order_manager",
  "finance_manager",
  "support_agent",
  "auditor",
];

function requireEnv(name: string): string {
  const value = process.env[name]?.trim();
  if (!value) {
    console.error(`Missing required environment variable: ${name}`);
    process.exit(1);
  }
  return value;
}

async function main() {
  const nodeEnv = process.env.NODE_ENV ?? "development";
  const email = requireEnv("ADMIN_SEED_EMAIL").toLowerCase();
  const password = requireEnv("ADMIN_SEED_PASSWORD");
  const name = process.env.ADMIN_SEED_NAME?.trim() || "Moozhayil Admin";
  const roleInput = process.env.ADMIN_SEED_ROLE?.trim() || "super_admin";

  if (password.length < 8) {
    console.error("ADMIN_SEED_PASSWORD must be at least 8 characters.");
    process.exit(1);
  }

  if (!ADMIN_ROLES.includes(roleInput as AdminRole)) {
    console.error(
      `Invalid ADMIN_SEED_ROLE "${roleInput}". Allowed: ${ADMIN_ROLES.join(", ")}`,
    );
    process.exit(1);
  }

  const role = roleInput as AdminRole;

  if (nodeEnv === "production" && process.env.ADMIN_SEED_CONFIRM !== "yes") {
    console.error(
      "Refusing to seed admin in production without ADMIN_SEED_CONFIRM=yes.",
    );
    process.exit(1);
  }

  const existing = await prisma.adminUser.findUnique({ where: { email } });

  if (existing) {
    console.log(`Admin already exists: ${email} (${existing.role})`);
    return;
  }

  await prisma.adminUser.create({
    data: {
      email,
      name,
      role,
      passwordHash: hashPassword(password),
    },
  });

  console.log("Admin user created.");
  console.log(`Email: ${email}`);
  console.log(`Role: ${role}`);
  if (nodeEnv !== "production") {
    console.log("Password was taken from ADMIN_SEED_PASSWORD (not printed).");
  } else {
    console.log("Password was taken from ADMIN_SEED_PASSWORD (not logged).");
  }
}

main()
  .catch((error: unknown) => {
    console.error(error);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());

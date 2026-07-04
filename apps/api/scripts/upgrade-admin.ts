import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  await prisma.adminUser.update({
    where: { email: "admin@moozhayil.com" },
    data: { role: "super_admin" },
  });
  console.log("Admin upgraded to super_admin — sign out and sign in again.");
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());

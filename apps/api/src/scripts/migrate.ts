import { execSync } from "node:child_process";
import { loadEnv } from "../config/env";

function main() {
  loadEnv();
  console.log("[migrate] running prisma migrate deploy");
  execSync("npx prisma migrate deploy", { stdio: "inherit" });
  console.log("[migrate] database migrations complete");
}

main();

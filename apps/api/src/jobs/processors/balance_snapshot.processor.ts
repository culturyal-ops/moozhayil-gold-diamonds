import { prisma } from "../../db/prisma";
import { goldBalanceService } from "../../modules/gold_ledger/gold_balance.service";

export async function refreshBalanceSnapshots(): Promise<number> {
  const users = await prisma.user.findMany({
    where: { deletedAt: null },
    select: { id: true },
  });

  for (const user of users) {
    await goldBalanceService.refreshSnapshot(user.id, "scheduled_refresh");
  }

  return users.length;
}

export async function refreshUserBalanceSnapshot(userId: string): Promise<void> {
  await goldBalanceService.refreshSnapshot(userId, "ledger_update");
}

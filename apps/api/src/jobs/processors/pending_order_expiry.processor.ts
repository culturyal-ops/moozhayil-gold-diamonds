import Decimal from "decimal.js";
import { prisma } from "../../db/prisma";
import { releaseInventoryForOrder } from "../../modules/inventory/inventory.service";
import { expirePendingOrderForPayment } from "../../modules/payments/payment_completion.service";
import { goldLedgerService } from "../../modules/gold_ledger/gold_ledger.service";
import { goldBalanceService } from "../../modules/gold_ledger/gold_balance.service";

export async function processExpiredPendingOrders(): Promise<number> {
  const now = new Date();

  const expiredReservations = await prisma.inventoryReservation.findMany({
    where: {
      status: "reserved",
      expiresAt: { lte: now },
      orderId: { not: null },
    },
    select: { orderId: true },
    distinct: ["orderId"],
  });

  let processed = 0;

  for (const reservation of expiredReservations) {
    if (!reservation.orderId) {
      continue;
    }

    const order = await prisma.order.findUnique({
      where: { id: reservation.orderId },
    });

    if (!order || order.status !== "pending_payment") {
      continue;
    }

    if (order.paymentTransactionId) {
      const expired = await expirePendingOrderForPayment(
        order.paymentTransactionId,
        "payment_window_expired",
      );
      if (expired) {
        processed += 1;
      }
      continue;
    }

    await prisma.$transaction(async (tx) => {
      await releaseInventoryForOrder(order.id, "expired", tx);

      const goldUsed = new Decimal(order.goldBalanceUsedGrams.toString());
      if (goldUsed.gt(0)) {
        await goldLedgerService.postRefundCredit({
          userId: order.userId,
          orderId: order.id,
          gramsDelta: goldUsed,
          amountPaise: order.totalPaise,
          goldRatePerGramPaise: order.goldRateAtOrderPaise,
          tx,
        });
      }

      await tx.order.update({
        where: { id: order.id },
        data: {
          status: "cancelled",
          cancelledAt: now,
          cancellationReason: "payment_window_expired",
        },
      });
    });

    if (new Decimal(order.goldBalanceUsedGrams.toString()).gt(0)) {
      await goldBalanceService.refreshSnapshot(order.userId, "refund");
    }

    processed += 1;
  }

  return processed;
}

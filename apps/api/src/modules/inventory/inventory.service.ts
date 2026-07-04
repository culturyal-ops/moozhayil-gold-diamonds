import type { Prisma } from "@prisma/client";
import { prisma } from "../../db/prisma";

type TransactionClient = Prisma.TransactionClient;

export async function getActiveReservedQuantity(
  productId: string,
  tx: TransactionClient = prisma,
): Promise<number> {
  const now = new Date();
  const aggregate = await tx.inventoryReservation.aggregate({
    where: {
      productId,
      status: "reserved",
      expiresAt: { gt: now },
    },
    _sum: { quantity: true },
  });

  return aggregate._sum.quantity ?? 0;
}

export async function getAvailableStock(
  productId: string,
  stockQuantity: number,
  tx: TransactionClient = prisma,
): Promise<number> {
  const reserved = await getActiveReservedQuantity(productId, tx);
  return Math.max(stockQuantity - reserved, 0);
}

export async function assertAvailableStock(
  productId: string,
  stockQuantity: number,
  requestedQuantity: number,
  tx: TransactionClient = prisma,
): Promise<void> {
  const available = await getAvailableStock(productId, stockQuantity, tx);
  if (available < requestedQuantity) {
    throw new Error("OUT_OF_STOCK");
  }
}

export async function confirmInventoryForOrder(
  orderId: string,
  tx: TransactionClient = prisma,
): Promise<void> {
  const reservations = await tx.inventoryReservation.findMany({
    where: { orderId, status: "reserved" },
  });

  const now = new Date();

  for (const reservation of reservations) {
    const updated = await tx.product.updateMany({
      where: {
        id: reservation.productId,
        stockQuantity: { gte: reservation.quantity },
      },
      data: { stockQuantity: { decrement: reservation.quantity } },
    });

    if (updated.count === 0) {
      throw new Error(`Insufficient stock for product ${reservation.productId}`);
    }

    await tx.inventoryReservation.update({
      where: { id: reservation.id },
      data: {
        status: "confirmed",
        confirmedAt: now,
      },
    });
  }
}

export async function releaseInventoryForOrder(
  orderId: string,
  status: "released" | "expired",
  tx: TransactionClient = prisma,
): Promise<void> {
  const now = new Date();
  const reservations = await tx.inventoryReservation.findMany({
    where: {
      orderId,
      status: { in: ["reserved", "confirmed"] },
    },
  });

  for (const reservation of reservations) {
    if (reservation.status === "confirmed") {
      await tx.product.update({
        where: { id: reservation.productId },
        data: { stockQuantity: { increment: reservation.quantity } },
      });
    }

    await tx.inventoryReservation.update({
      where: { id: reservation.id },
      data: {
        status,
        releasedAt: now,
      },
    });
  }
}

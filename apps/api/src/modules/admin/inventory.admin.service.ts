import { prisma } from "../../db/prisma";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";

export class InventoryAdminService {
  async listStock(input: { low_stock_only?: boolean; cursor?: string; limit: number }) {
    const products = await prisma.product.findMany({
      where: {
        deletedAt: null,
        ...(input.low_stock_only ? { stockQuantity: { lte: 5 } } : {}),
      },
      select: {
        id: true,
        sku: true,
        name: true,
        stockQuantity: true,
        isPublished: true,
      },
      orderBy: [{ stockQuantity: "asc" }, { name: "asc" }],
      cursor: input.cursor ? { id: input.cursor } : undefined,
      skip: input.cursor ? 1 : 0,
      take: input.limit + 1,
    });

    return {
      inventory: products.slice(0, input.limit).map((product) => ({
        id: product.id,
        sku: product.sku,
        name: product.name,
        stock_quantity: product.stockQuantity,
        is_published: product.isPublished,
      })),
      next_cursor: products.length > input.limit ? products[input.limit].id : null,
    };
  }

  async updateStock(
    productId: string,
    adminId: string,
    stockQuantity: number,
    reason: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    const product = await prisma.product.findFirst({
      where: { id: productId, deletedAt: null },
    });

    if (!product) {
      throw new AppError(404, "NOT_FOUND", "Product does not exist");
    }

    const updated = await prisma.product.update({
      where: { id: productId },
      data: { stockQuantity },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "inventory_stock_updated",
      entityType: "product",
      entityId: productId,
      before: { stock_quantity: product.stockQuantity },
      after: { stock_quantity: stockQuantity },
      reason,
      requestId,
      ipAddress,
    });

    return {
      product: {
        id: updated.id,
        sku: updated.sku,
        stock_quantity: updated.stockQuantity,
      },
    };
  }

  async listReservations() {
    const reservations = await prisma.inventoryReservation.findMany({
      where: { status: { in: ["reserved", "confirmed"] } },
      include: {
        product: { select: { sku: true, name: true } },
      },
      orderBy: { expiresAt: "asc" },
      take: 100,
    });

    return {
      reservations: reservations.map((row) => ({
        id: row.id,
        product_id: row.productId,
        product_sku: row.product.sku,
        product_name: row.product.name,
        user_id: row.userId,
        order_id: row.orderId,
        quantity: row.quantity,
        status: row.status,
        expires_at: row.expiresAt.toISOString(),
      })),
    };
  }
}

export const inventoryAdminService = new InventoryAdminService();

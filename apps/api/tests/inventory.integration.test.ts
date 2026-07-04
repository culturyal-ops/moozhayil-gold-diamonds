import { prisma } from "../src/db/prisma";
import {
  getActiveReservedQuantity,
  getAvailableStock,
} from "../src/modules/inventory/inventory.service";
import { processExpiredPendingOrders } from "../src/jobs/processors/pending_order_expiry.processor";

describe("inventory reservation", () => {
  beforeEach(async () => {
    await prisma.inventoryReservation.deleteMany();
    await prisma.orderItem.deleteMany();
    await prisma.order.deleteMany();
    await prisma.product.deleteMany();
    await prisma.user.deleteMany();
  });

  afterAll(async () => {
    await prisma.$disconnect();
  });

  it("tracks active reserved quantity separately from stock", async () => {
    const user = await prisma.user.create({
      data: { phone: "+919999999901", name: "Inventory Test" },
    });
    const category = await prisma.category.create({
      data: { name: "Rings", slug: "rings-inv" },
    });
    const product = await prisma.product.create({
      data: {
        sku: "INV-001",
        name: "Ring",
        categoryId: category.id,
        purity: "k22",
        weightGrams: "2.0000",
        makingChargePct: "10.00",
        stockQuantity: 5,
        isPublished: true,
      },
    });

    await prisma.inventoryReservation.create({
      data: {
        productId: product.id,
        userId: user.id,
        quantity: 2,
        status: "reserved",
        reservedAt: new Date(),
        expiresAt: new Date(Date.now() + 15 * 60 * 1000),
      },
    });

    expect(await getActiveReservedQuantity(product.id)).toBe(2);
    expect(await getAvailableStock(product.id, product.stockQuantity)).toBe(3);
  });

  it("expires pending payment reservations without decrementing stock", async () => {
    const user = await prisma.user.create({
      data: { phone: "+919999999902", name: "Expiry Test" },
    });
    const category = await prisma.category.create({
      data: { name: "Bangles", slug: "bangles-inv" },
    });
    const product = await prisma.product.create({
      data: {
        sku: "INV-002",
        name: "Bangle",
        categoryId: category.id,
        purity: "k22",
        weightGrams: "3.0000",
        makingChargePct: "10.00",
        stockQuantity: 4,
        isPublished: true,
      },
    });
    const order = await prisma.order.create({
      data: {
        orderNumber: "MZ-EXP-001",
        userId: user.id,
        status: "pending_payment",
        totalPaise: 100000,
        goldValuePaise: 80000,
        makingChargesPaise: 10000,
        wastagePaise: 0,
        stoneValuePaise: 0,
        gstPaise: 10000,
        makingChargeWaiverPaise: 0,
        deliveryAddressSnapshot: {},
        paymentMethod: "upi",
        goldBalanceUsedGrams: "0.0000",
        goldRateAtOrderPaise: 600000,
      },
    });

    await prisma.inventoryReservation.create({
      data: {
        productId: product.id,
        userId: user.id,
        orderId: order.id,
        quantity: 1,
        status: "reserved",
        reservedAt: new Date(Date.now() - 20 * 60 * 1000),
        expiresAt: new Date(Date.now() - 5 * 60 * 1000),
      },
    });

    const processed = await processExpiredPendingOrders();
    expect(processed).toBe(1);

    const refreshedProduct = await prisma.product.findUniqueOrThrow({
      where: { id: product.id },
    });
    expect(refreshedProduct.stockQuantity).toBe(4);

    const refreshedOrder = await prisma.order.findUniqueOrThrow({
      where: { id: order.id },
    });
    expect(refreshedOrder.status).toBe("cancelled");
  });
});

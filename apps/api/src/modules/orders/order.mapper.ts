import type { Order, OrderItem } from "@prisma/client";
import { ORDER_NUMBER_PREFIX, ORDER_STATUS_LABELS } from "../../config/orders.constants";
import { prisma } from "../../db/prisma";
import { formatPaise } from "../../utils/money";

type OrderWithItems = Order & {
  items: OrderItem[];
};

function primaryImageFromSnapshot(snapshot: unknown): string | null {
  if (!snapshot || typeof snapshot !== "object") {
    return null;
  }

  const data = snapshot as { primary_image?: string | null };
  return data.primary_image ?? null;
}

export function mapOrderToDto(order: OrderWithItems) {
  return {
    id: order.id,
    order_number: order.orderNumber,
    status: order.status,
    status_display: ORDER_STATUS_LABELS[order.status] ?? order.status,
    total_paise: order.totalPaise,
    total_display: formatPaise(order.totalPaise),
    making_charge_waiver_paise: order.makingChargeWaiverPaise,
    making_charge_waiver_display:
      order.makingChargeWaiverPaise > 0
        ? formatPaise(order.makingChargeWaiverPaise)
        : null,
    aura_plan_goal_id: order.auraPlanGoalId,
    payment_method: order.paymentMethod,
    gold_balance_used_grams: order.goldBalanceUsedGrams.toString(),
    items: order.items.map((item) => ({
      product_id: item.productId,
      product_name:
        typeof item.productSnapshot === "object" &&
        item.productSnapshot &&
        "name" in item.productSnapshot
          ? String((item.productSnapshot as { name: string }).name)
          : "Product",
      product_image: primaryImageFromSnapshot(item.productSnapshot),
      quantity: item.quantity,
      unit_price_paise: item.unitPricePaise,
      unit_price_display: formatPaise(item.unitPricePaise),
    })),
    ordered_at: order.createdAt.toISOString(),
  };
}

export async function generateOrderNumber(): Promise<string> {
  const year = new Date().getFullYear();
  const prefix = `${ORDER_NUMBER_PREFIX}-${year}-`;
  const latest = await prisma.order.findFirst({
    where: { orderNumber: { startsWith: prefix } },
    orderBy: { orderNumber: "desc" },
    select: { orderNumber: true },
  });

  const nextSeq = latest
    ? Number.parseInt(latest.orderNumber.slice(prefix.length), 10) + 1
    : 1;

  return `${prefix}${String(nextSeq).padStart(5, "0")}`;
}

import type { OrderStatus } from "@prisma/client";
import { prisma } from "../../db/prisma";
import { SAR_THRESHOLD_PAISE } from "../../config/admin.constants";
import { AppError } from "../../middleware/error.middleware";
import { writeAuditLog } from "../../utils/audit";
import { withIdempotency } from "../../utils/idempotency";
import { processOrderRefund } from "../../jobs/processors/refund.processor";
import { mapOrderToDto } from "../orders/order.mapper";
import {
  notifyOrderDelivered,
  notifyOrderShipped,
} from "../notifications/notifications.triggers";
import type {
  AdminOrderListInput,
  AdminOrderRefundInput,
  AdminOrderStatusInput,
} from "./admin.schema";

const ADMIN_STATUS_TRANSITIONS: Record<OrderStatus, OrderStatus[]> = {
  draft: [],
  pending_payment: ["cancelled"],
  confirmed: ["processing", "cancelled"],
  processing: ["shipped", "delivery_failed", "cancelled"],
  shipped: ["delivered", "delivery_failed"],
  delivered: [],
  delivery_failed: ["processing", "cancelled"],
  cancelled: [],
  refund_initiated: ["refunded"],
  refunded: [],
};

function parseDeliveryAddressSnapshot(snapshot: unknown) {
  if (!snapshot || typeof snapshot !== "object") {
    return null;
  }

  const data = snapshot as Record<string, unknown>;
  return {
    full_name: typeof data.full_name === "string" ? data.full_name : null,
    phone: typeof data.phone === "string" ? data.phone : null,
    line1: typeof data.line1 === "string" ? data.line1 : null,
    line2: typeof data.line2 === "string" ? data.line2 : null,
    city: typeof data.city === "string" ? data.city : null,
    state: typeof data.state === "string" ? data.state : null,
    pincode: typeof data.pincode === "string" ? data.pincode : null,
  };
}

export class OrdersAdminService {
  async list(input: AdminOrderListInput) {
    const orders = await prisma.order.findMany({
      where: {
        ...(input.status ? { status: input.status } : {}),
      },
      include: { items: true, sarReview: true },
      orderBy: { createdAt: "desc" },
      cursor: input.cursor ? { id: input.cursor } : undefined,
      skip: input.cursor ? 1 : 0,
      take: input.limit + 1,
    });

    return {
      orders: orders.slice(0, input.limit).map((order) => ({
        ...mapOrderToDto(order),
        sar_review_status: order.sarReview?.status ?? null,
        sar_required: order.totalPaise >= SAR_THRESHOLD_PAISE,
      })),
      next_cursor: orders.length > input.limit ? orders[input.limit].id : null,
    };
  }

  async getById(orderId: string) {
    const order = await prisma.order.findUnique({
      where: { id: orderId },
      include: {
        items: true,
        sarReview: true,
        user: {
          select: {
            id: true,
            name: true,
            phone: true,
            kycStatus: true,
          },
        },
      },
    });

    if (!order) {
      throw new AppError(404, "NOT_FOUND", "Order does not exist");
    }

    return {
      order: {
        ...mapOrderToDto(order),
        shipped_at: order.shippedAt?.toISOString() ?? null,
        delivered_at: order.deliveredAt?.toISOString() ?? null,
        cancelled_at: order.cancelledAt?.toISOString() ?? null,
        cancellation_reason: order.cancellationReason,
        notes: order.notes,
        gold_value_paise: order.goldValuePaise,
        making_charges_paise: order.makingChargesPaise,
        gst_paise: order.gstPaise,
        sar_review_status: order.sarReview?.status ?? null,
        sar_required: order.totalPaise >= SAR_THRESHOLD_PAISE,
        allowed_status_transitions: ADMIN_STATUS_TRANSITIONS[order.status] ?? [],
      },
      customer: {
        id: order.user.id,
        name: order.user.name,
        phone: order.user.phone,
        kyc_status: order.user.kycStatus,
      },
      delivery_address: parseDeliveryAddressSnapshot(order.deliveryAddressSnapshot),
    };
  }

  async updateStatus(
    orderId: string,
    adminId: string,
    input: AdminOrderStatusInput,
    requestId?: string,
    ipAddress?: string,
  ) {
    const order = await prisma.order.findUnique({
      where: { id: orderId },
      include: { sarReview: true, items: true },
    });

    if (!order) {
      throw new AppError(404, "NOT_FOUND", "Order does not exist");
    }

    if (
      order.totalPaise >= SAR_THRESHOLD_PAISE &&
      order.sarReview?.status !== "approved" &&
      ["processing", "shipped", "delivered"].includes(input.status)
    ) {
      throw new AppError(
        409,
        "CONFLICT",
        "SAR review must be approved before fulfillment",
      );
    }

    const allowed = ADMIN_STATUS_TRANSITIONS[order.status] ?? [];
    if (!allowed.includes(input.status)) {
      throw new AppError(
        409,
        "CONFLICT",
        `Cannot transition from ${order.status} to ${input.status}`,
      );
    }

    const now = new Date();
    const before = { status: order.status };
    const updated = await prisma.order.update({
      where: { id: orderId },
      data: {
        status: input.status,
        ...(input.status === "shipped" ? { shippedAt: now } : {}),
        ...(input.status === "delivered" ? { deliveredAt: now } : {}),
        ...(input.status === "cancelled"
          ? {
              cancelledAt: now,
              cancellationReason: input.reason ?? "Cancelled by admin",
            }
          : {}),
        ...(input.tracking ? { notes: input.tracking } : {}),
      },
      include: { items: true },
    });

    await writeAuditLog({
      actorType: "admin",
      actorId: adminId,
      action: "order_status_updated",
      entityType: "order",
      entityId: orderId,
      before,
      after: { status: input.status },
      reason: input.reason,
      requestId,
      ipAddress,
    });

    if (input.status === "shipped") {
      await notifyOrderShipped({
        userId: updated.userId,
        orderId: updated.id,
        orderNumber: updated.orderNumber,
      });
    } else if (input.status === "delivered") {
      await notifyOrderDelivered({
        userId: updated.userId,
        orderId: updated.id,
        orderNumber: updated.orderNumber,
      });
    }

    return { order: mapOrderToDto(updated) };
  }

  async refund(
    orderId: string,
    adminId: string,
    input: AdminOrderRefundInput,
    idempotencyKey: string,
    requestId?: string,
    ipAddress?: string,
  ) {
    return withIdempotency({
      userId: adminId,
      scope: "admin_order_refund",
      key: idempotencyKey,
      requestBody: input,
      handler: async () => {
        const order = await prisma.order.findUnique({
          where: { id: orderId },
        });

        if (!order) {
          throw new AppError(404, "NOT_FOUND", "Order does not exist");
        }

        if (["cancelled", "refunded", "refund_initiated"].includes(order.status)) {
          throw new AppError(409, "CONFLICT", "Order is already refunded or cancelled");
        }

        const refundInitiated = await processOrderRefund(
          orderId,
          input.reason ?? "Admin refund",
        );

        await writeAuditLog({
          actorType: "admin",
          actorId: adminId,
          action: "order_refund_initiated",
          entityType: "order",
          entityId: orderId,
          before: { status: order.status },
          after: { status: "cancelled", refund_initiated: refundInitiated },
          reason: input.reason,
          requestId,
          ipAddress,
        });

        const refreshed = await prisma.order.findUniqueOrThrow({
          where: { id: orderId },
          include: { items: true },
        });

        return {
          order: mapOrderToDto(refreshed),
          refund_initiated: refundInitiated,
        };
      },
    });
  }

  async listSarReviews() {
    const reviews = await prisma.sarReview.findMany({
      where: { status: "pending" },
      include: {
        order: {
          select: {
            id: true,
            orderNumber: true,
            totalPaise: true,
            status: true,
            userId: true,
          },
        },
      },
      orderBy: { createdAt: "asc" },
    });

    return {
      reviews: reviews.map((review) => ({
        id: review.id,
        order_id: review.orderId,
        order_number: review.order.orderNumber,
        total_paise: review.order.totalPaise,
        order_status: review.order.status,
        user_id: review.order.userId,
        status: review.status,
        created_at: review.createdAt.toISOString(),
      })),
    };
  }
}

export const ordersAdminService = new OrdersAdminService();

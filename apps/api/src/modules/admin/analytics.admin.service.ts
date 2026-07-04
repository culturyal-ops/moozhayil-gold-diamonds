import { prisma } from "../../db/prisma";

export class AnalyticsAdminService {
  async dashboard() {
    const [
      userCount,
      orderCounts,
      pendingKyc,
      pendingSar,
      lowStock,
      recentOrders,
    ] = await Promise.all([
      prisma.user.count({ where: { deletedAt: null } }),
      prisma.order.groupBy({
        by: ["status"],
        _count: { _all: true },
      }),
      prisma.user.count({ where: { kycStatus: "in_review" } }),
      prisma.sarReview.count({ where: { status: "pending" } }),
      prisma.product.count({
        where: {
          isPublished: true,
          deletedAt: null,
          stockQuantity: { lte: 2 },
        },
      }),
      prisma.order.aggregate({
        _sum: { totalPaise: true },
        where: {
          createdAt: { gte: new Date(Date.now() - 24 * 60 * 60 * 1000) },
          status: { notIn: ["cancelled", "draft"] },
        },
      }),
    ]);

    return {
      users_total: userCount,
      orders_by_status: Object.fromEntries(
        orderCounts.map((row) => [row.status, row._count._all]),
      ),
      kyc_pending_reviews: pendingKyc,
      sar_pending_reviews: pendingSar,
      low_stock_products: lowStock,
      revenue_paise_24h: recentOrders._sum.totalPaise ?? 0,
      generated_at: new Date().toISOString(),
    };
  }
}

export const analyticsAdminService = new AnalyticsAdminService();

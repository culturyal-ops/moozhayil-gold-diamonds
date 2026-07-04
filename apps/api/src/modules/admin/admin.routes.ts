import { Router } from "express";
import { requireAdminStepUp } from "../../middleware/admin_step_up.middleware";
import { adminSensitiveRateLimit } from "../../middleware/rate_limit.middleware";
import {
  authenticateAdmin,
  requireAdminRoles,
} from "./admin.middleware";
import { adminController } from "./admin.controller";
import { adminMediaUploadMiddleware } from "./uploads.admin.service";

export const adminRouter = Router();

adminRouter.post("/auth/login", (req, res, next) => {
  void adminController.login(req, res).catch(next);
});

adminRouter.use(authenticateAdmin);

adminRouter.get("/auth/me", (req, res, next) => {
  void adminController.me(req, res).catch(next);
});

adminRouter.post("/auth/step-up", (req, res, next) => {
  void adminController.stepUp(req, res).catch(next);
});

adminRouter.get(
  "/dashboard",
  requireAdminRoles(
    "super_admin",
    "catalog_manager",
    "order_manager",
    "finance_manager",
    "auditor",
    "support_agent",
  ),
  (req, res, next) => {
    void adminController.dashboard(req, res).catch(next);
  },
);

adminRouter.get(
  "/audit-logs",
  requireAdminRoles("auditor", "super_admin"),
  (req, res, next) => {
    void adminController.listAuditLogs(req, res).catch(next);
  },
);

adminRouter.get(
  "/kyc/reviews",
  requireAdminRoles("kyc_reviewer", "auditor"),
  (req, res, next) => {
    void adminController.listKycReviews(req, res).catch(next);
  },
);

adminRouter.get(
  "/kyc/:userId/selfie",
  requireAdminRoles("kyc_reviewer", "auditor"),
  (req, res, next) => {
    void adminController.getKycSelfie(req, res).catch(next);
  },
);

adminRouter.post(
  "/uploads",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    adminMediaUploadMiddleware(req, res, (error: unknown) => {
      if (error) {
        next(error);
        return;
      }

      void adminController.uploadMedia(req, res).catch(next);
    });
  },
);

adminRouter.post(
  "/kyc/:userId/approve",
  requireAdminRoles("kyc_reviewer"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.approveKyc(req, res).catch(next);
  },
);

adminRouter.post(
  "/kyc/:userId/reject",
  requireAdminRoles("kyc_reviewer"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.rejectKyc(req, res).catch(next);
  },
);

adminRouter.get(
  "/orders",
  requireAdminRoles("order_manager", "support_agent", "auditor"),
  (req, res, next) => {
    void adminController.listOrders(req, res).catch(next);
  },
);

adminRouter.get(
  "/orders/:id",
  requireAdminRoles("order_manager", "support_agent", "auditor"),
  (req, res, next) => {
    void adminController.getOrder(req, res).catch(next);
  },
);

adminRouter.patch(
  "/orders/:id/status",
  requireAdminRoles("order_manager"),
  (req, res, next) => {
    void adminController.updateOrderStatus(req, res).catch(next);
  },
);

adminRouter.post(
  "/orders/:id/refund",
  requireAdminRoles("finance_manager"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.refundOrder(req, res).catch(next);
  },
);

adminRouter.get(
  "/sar-reviews",
  requireAdminRoles("finance_manager", "super_admin", "auditor"),
  (req, res, next) => {
    void adminController.listSarReviews(req, res).catch(next);
  },
);

adminRouter.post(
  "/sar-reviews/:id/decision",
  requireAdminRoles("finance_manager", "super_admin"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.decideSarReview(req, res).catch(next);
  },
);

adminRouter.post(
  "/gold-rates/override",
  requireAdminRoles("finance_manager", "super_admin"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.overrideGoldRate(req, res).catch(next);
  },
);

adminRouter.get(
  "/gold-rates/history",
  requireAdminRoles("finance_manager", "super_admin", "auditor"),
  (req, res, next) => {
    void adminController.listGoldRateHistory(req, res).catch(next);
  },
);

adminRouter.get(
  "/products",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listProducts(req, res).catch(next);
  },
);

adminRouter.get(
  "/products/:id",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.getProduct(req, res).catch(next);
  },
);

adminRouter.post(
  "/products",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.createProduct(req, res).catch(next);
  },
);

adminRouter.patch(
  "/products/:id",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.updateProduct(req, res).catch(next);
  },
);

adminRouter.post(
  "/products/:id/images",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.addProductImage(req, res).catch(next);
  },
);

adminRouter.post(
  "/products/:id/publish",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.publishProduct(req, res).catch(next);
  },
);

adminRouter.get(
  "/categories",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listCategories(req, res).catch(next);
  },
);

adminRouter.post(
  "/categories",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.createCategory(req, res).catch(next);
  },
);

adminRouter.patch(
  "/categories/:id",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.updateCategory(req, res).catch(next);
  },
);

adminRouter.get(
  "/collections",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listCollections(req, res).catch(next);
  },
);

adminRouter.post(
  "/collections",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.createCollection(req, res).catch(next);
  },
);

adminRouter.patch(
  "/collections/:id",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.updateCollection(req, res).catch(next);
  },
);

adminRouter.get(
  "/occasions",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listOccasions(req, res).catch(next);
  },
);

adminRouter.post(
  "/occasions",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.createOccasion(req, res).catch(next);
  },
);

adminRouter.patch(
  "/occasions/:id",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.updateOccasion(req, res).catch(next);
  },
);

adminRouter.get(
  "/banners",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listBanners(req, res).catch(next);
  },
);

adminRouter.post(
  "/banners",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.createBanner(req, res).catch(next);
  },
);

adminRouter.patch(
  "/banners/:id",
  requireAdminRoles("catalog_manager"),
  (req, res, next) => {
    void adminController.updateBanner(req, res).catch(next);
  },
);

adminRouter.get(
  "/cms/home-content",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listHomeContent(req, res).catch(next);
  },
);

adminRouter.get(
  "/cms/featured-products",
  requireAdminRoles("catalog_manager", "auditor"),
  (req, res, next) => {
    void adminController.listFeaturedProducts(req, res).catch(next);
  },
);

adminRouter.get(
  "/users",
  requireAdminRoles("support_agent", "auditor", "super_admin"),
  (req, res, next) => {
    void adminController.listUsers(req, res).catch(next);
  },
);

adminRouter.post(
  "/users",
  requireAdminRoles("support_agent", "super_admin"),
  (req, res, next) => {
    void adminController.createCustomer(req, res).catch(next);
  },
);

adminRouter.get(
  "/users/:id",
  requireAdminRoles("support_agent", "auditor", "super_admin"),
  (req, res, next) => {
    void adminController.getCustomer(req, res).catch(next);
  },
);

adminRouter.get(
  "/users/:id/support-summary",
  requireAdminRoles("support_agent", "auditor"),
  (req, res, next) => {
    void adminController.supportSummary(req, res).catch(next);
  },
);

adminRouter.get(
  "/ledger-adjustments",
  requireAdminRoles("finance_manager", "auditor", "super_admin"),
  (req, res, next) => {
    void adminController.listLedgerAdjustments(req, res).catch(next);
  },
);

adminRouter.post(
  "/ledger-adjustments",
  requireAdminRoles("finance_manager"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.createLedgerAdjustment(req, res).catch(next);
  },
);

adminRouter.post(
  "/ledger-adjustments/:id/approve",
  requireAdminRoles("finance_manager", "super_admin"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.approveLedgerAdjustment(req, res).catch(next);
  },
);

adminRouter.get(
  "/inventory",
  requireAdminRoles("catalog_manager", "order_manager", "auditor"),
  (req, res, next) => {
    void adminController.listInventory(req, res).catch(next);
  },
);

adminRouter.patch(
  "/inventory/:id",
  requireAdminRoles("catalog_manager", "order_manager"),
  (req, res, next) => {
    void adminController.updateInventory(req, res).catch(next);
  },
);

adminRouter.get(
  "/inventory/reservations",
  requireAdminRoles("catalog_manager", "order_manager", "auditor"),
  (req, res, next) => {
    void adminController.listInventoryReservations(req, res).catch(next);
  },
);

adminRouter.get(
  "/notifications",
  requireAdminRoles("support_agent", "super_admin", "auditor"),
  (req, res, next) => {
    void adminController.listNotifications(req, res).catch(next);
  },
);

adminRouter.get(
  "/plans/interest",
  requireAdminRoles("support_agent", "super_admin", "order_manager"),
  (req, res, next) => {
    void adminController.listPlanInterests(req, res).catch(next);
  },
);

adminRouter.post(
  "/users/:userId/goals",
  requireAdminRoles("support_agent", "super_admin", "order_manager"),
  adminSensitiveRateLimit,
  (req, res, next) => {
    void adminController.enrollCustomerGoal(req, res).catch(next);
  },
);

adminRouter.get(
  "/goals/:goalId",
  requireAdminRoles("support_agent", "super_admin", "order_manager", "auditor"),
  (req, res, next) => {
    void adminController.getAdminGoal(req, res).catch(next);
  },
);

adminRouter.get(
  "/goals/:goalId/contributions",
  requireAdminRoles("support_agent", "super_admin", "order_manager", "auditor"),
  (req, res, next) => {
    void adminController.listGoalContributions(req, res).catch(next);
  },
);

adminRouter.post(
  "/goals/:goalId/contributions/manual",
  requireAdminRoles("support_agent", "super_admin", "order_manager"),
  adminSensitiveRateLimit,
  requireAdminStepUp,
  (req, res, next) => {
    void adminController.recordShowroomPayment(req, res).catch(next);
  },
);

adminRouter.get(
  "/operations/pincodes",
  requireAdminRoles("order_manager", "super_admin", "catalog_manager"),
  (req, res, next) => {
    void adminController.listServiceablePincodes(req, res).catch(next);
  },
);

adminRouter.post(
  "/operations/pincodes",
  requireAdminRoles("order_manager", "super_admin"),
  (req, res, next) => {
    void adminController.createServiceablePincode(req, res).catch(next);
  },
);

adminRouter.post(
  "/operations/pincodes/import",
  requireAdminRoles("order_manager", "super_admin"),
  (req, res, next) => {
    void adminController.importServiceablePincodes(req, res).catch(next);
  },
);

adminRouter.delete(
  "/operations/pincodes/:id",
  requireAdminRoles("order_manager", "super_admin"),
  (req, res, next) => {
    void adminController.deleteServiceablePincode(req, res).catch(next);
  },
);

adminRouter.get(
  "/operations/stores",
  requireAdminRoles("order_manager", "super_admin", "catalog_manager"),
  (req, res, next) => {
    void adminController.listStoreLocations(req, res).catch(next);
  },
);

adminRouter.post(
  "/operations/stores",
  requireAdminRoles("order_manager", "super_admin"),
  (req, res, next) => {
    void adminController.createStoreLocation(req, res).catch(next);
  },
);

adminRouter.patch(
  "/operations/stores/:id",
  requireAdminRoles("order_manager", "super_admin"),
  (req, res, next) => {
    void adminController.updateStoreLocation(req, res).catch(next);
  },
);

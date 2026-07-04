import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { auraController } from "./aura.controller";
import { auraChatRateLimit, auraService } from "./aura.service";

export const auraRouter = Router();

auraRouter.use(authenticate);

auraRouter.post("/insight", (req, res, next) => {
  void auraController.insight(req, res).catch(next);
});

auraRouter.post("/plan", (req, res, next) => {
  void auraController.plan(req, res).catch(next);
});

auraRouter.post("/discover", (req, res, next) => {
  void auraController.discover(req, res).catch(next);
});

auraRouter.post("/sessions", (req, res, next) => {
  void auraController.createSession(req, res).catch(next);
});

auraRouter.post(
  "/sessions/:sessionId/messages",
  auraChatRateLimit,
  (req, res, next) => {
    void auraController.postMessage(req, res).catch(next);
  },
);

auraRouter.post("/product-views", (req, res, next) => {
  void (async () => {
    if (!req.user) {
      res.status(401).json({ error: "UNAUTHORIZED" });
      return;
    }

    const productId = String(req.body?.product_id ?? "");
    await auraService.recordProductView(
      req.user.userId,
      productId,
      req.body?.source,
    );
    res.status(201).json({ success: true });
  })().catch(next);
});

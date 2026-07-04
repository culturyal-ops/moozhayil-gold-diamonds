import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { ordersController } from "./orders.controller";

export const ordersRouter = Router();

ordersRouter.use(authenticate);

ordersRouter.get("/", (req, res, next) => {
  void ordersController.list(req, res).catch(next);
});

ordersRouter.post("/", (req, res, next) => {
  void ordersController.create(req, res).catch(next);
});

ordersRouter.get("/:id", (req, res, next) => {
  void ordersController.getById(req, res).catch(next);
});

ordersRouter.post("/:id/cancel", (req, res, next) => {
  void ordersController.cancel(req, res).catch(next);
});

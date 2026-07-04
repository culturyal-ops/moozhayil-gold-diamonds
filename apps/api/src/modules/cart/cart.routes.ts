import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { cartController } from "./cart.controller";

export const cartRouter = Router();

cartRouter.use(authenticate);

cartRouter.get("/", (req, res, next) => {
  void cartController.getCart(req, res).catch(next);
});

cartRouter.post("/items", (req, res, next) => {
  void cartController.addItem(req, res).catch(next);
});

cartRouter.delete("/items/:productId", (req, res, next) => {
  void cartController.removeItem(req, res).catch(next);
});

cartRouter.delete("/", (req, res, next) => {
  void cartController.clear(req, res).catch(next);
});

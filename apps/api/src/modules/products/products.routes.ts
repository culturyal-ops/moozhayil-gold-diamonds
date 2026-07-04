import { Router } from "express";
import { productsController } from "./products.controller";

export const productsRouter = Router();

productsRouter.get("/", (req, res, next) => {
  void productsController.list(req, res).catch(next);
});

productsRouter.get("/search", (req, res, next) => {
  void productsController.search(req, res).catch(next);
});

productsRouter.get("/:id/similar", (req, res, next) => {
  void productsController.similar(req, res).catch(next);
});

productsRouter.get("/:id", (req, res, next) => {
  void productsController.detail(req, res).catch(next);
});

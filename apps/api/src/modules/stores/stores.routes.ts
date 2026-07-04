import { Router } from "express";
import { storesController } from "./stores.controller";

export const storesRouter = Router();

storesRouter.get("/", (req, res, next) => {
  void storesController.list(req, res).catch(next);
});

storesRouter.get("/:id", (req, res, next) => {
  void storesController.getById(req, res).catch(next);
});

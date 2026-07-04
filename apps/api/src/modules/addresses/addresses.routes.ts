import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { addressesController } from "./addresses.controller";

export const addressesRouter = Router();

addressesRouter.post("/validate-pincode", (req, res, next) => {
  void addressesController.validatePincode(req, res).catch(next);
});

addressesRouter.use(authenticate);

addressesRouter.get("/", (req, res, next) => {
  void addressesController.list(req, res).catch(next);
});

addressesRouter.post("/", (req, res, next) => {
  void addressesController.create(req, res).catch(next);
});

addressesRouter.patch("/:id", (req, res, next) => {
  void addressesController.update(req, res).catch(next);
});

addressesRouter.delete("/:id", (req, res, next) => {
  void addressesController.remove(req, res).catch(next);
});

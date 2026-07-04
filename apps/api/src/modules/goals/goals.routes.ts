import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { requireKycBasic } from "../../middleware/kyc.middleware";
import { goalsController } from "./goals.controller";

export const goalsRouter = Router();

goalsRouter.use(authenticate);

goalsRouter.get("/", (req, res, next) => {
  void goalsController.list(req, res).catch(next);
});

goalsRouter.post("/", requireKycBasic, (req, res, next) => {
  void goalsController.create(req, res).catch(next);
});

goalsRouter.get("/:id", (req, res, next) => {
  void goalsController.getById(req, res).catch(next);
});

goalsRouter.patch("/:id", (req, res, next) => {
  void goalsController.patch(req, res).catch(next);
});

goalsRouter.delete("/:id", (req, res, next) => {
  void goalsController.remove(req, res).catch(next);
});

goalsRouter.post("/:id/contribute", requireKycBasic, (req, res, next) => {
  void goalsController.contribute(req, res).catch(next);
});

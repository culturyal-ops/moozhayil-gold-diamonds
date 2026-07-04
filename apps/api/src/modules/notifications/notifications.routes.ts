import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { notificationsController } from "./notifications.controller";

export const notificationsRouter = Router();

notificationsRouter.use(authenticate);

notificationsRouter.get("/", (req, res, next) => {
  void notificationsController.list(req, res).catch(next);
});

notificationsRouter.get("/preferences", (req, res, next) => {
  void notificationsController.getPreferences(req, res).catch(next);
});

notificationsRouter.patch("/preferences", (req, res, next) => {
  void notificationsController.updatePreferences(req, res).catch(next);
});

notificationsRouter.post("/read-all", (req, res, next) => {
  void notificationsController.markAllRead(req, res).catch(next);
});

notificationsRouter.post("/:id/read", (req, res, next) => {
  void notificationsController.markRead(req, res).catch(next);
});

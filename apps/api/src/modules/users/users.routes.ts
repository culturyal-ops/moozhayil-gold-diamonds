import { Router } from "express";
import { authenticate } from "../auth/auth.middleware";
import { usersController } from "./users.controller";

export const usersRouter = Router();

usersRouter.use(authenticate);

usersRouter.get("/me", (req, res, next) => {
  void usersController.getMe(req, res).catch(next);
});

usersRouter.patch("/me", (req, res, next) => {
  void usersController.updateMe(req, res).catch(next);
});

usersRouter.post("/intent", (req, res, next) => {
  void usersController.saveIntent(req, res).catch(next);
});

usersRouter.post("/devices", (req, res, next) => {
  void usersController.registerDevice(req, res).catch(next);
});

usersRouter.delete("/devices/:deviceId", (req, res, next) => {
  void usersController.deleteDevice(req, res).catch(next);
});

import type { NextFunction, Request, Response } from "express";
import { logger } from "../utils/logger";

export function requestLoggerMiddleware(
  req: Request,
  res: Response,
  next: NextFunction,
): void {
  const started = Date.now();

  res.on("finish", () => {
    logger.info("http_request", {
      method: req.method,
      path: req.originalUrl,
      status: res.statusCode,
      duration_ms: Date.now() - started,
      request_id: req.header("x-request-id"),
    });
  });

  next();
}

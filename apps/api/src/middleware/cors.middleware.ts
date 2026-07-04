import type { NextFunction, Request, Response } from "express";
import { loadEnv, parseCorsOrigins } from "../config/env";

export function corsMiddleware(
  req: Request,
  res: Response,
  next: NextFunction,
): void {
  const env = loadEnv();
  const allowedOrigins = parseCorsOrigins(env.CORS_ALLOWED_ORIGINS);
  const requestOrigin = req.header("Origin");

  if (requestOrigin && allowedOrigins.includes(requestOrigin)) {
    res.setHeader("Access-Control-Allow-Origin", requestOrigin);
    res.setHeader("Vary", "Origin");
    res.setHeader(
      "Access-Control-Allow-Headers",
      "Authorization, Content-Type, Idempotency-Key, X-Admin-Step-Up-Token",
    );
    res.setHeader(
      "Access-Control-Allow-Methods",
      "GET, POST, PUT, PATCH, DELETE, OPTIONS",
    );
    res.setHeader("Access-Control-Max-Age", "86400");
  }

  if (req.method === "OPTIONS") {
    res.status(204).end();
    return;
  }

  next();
}

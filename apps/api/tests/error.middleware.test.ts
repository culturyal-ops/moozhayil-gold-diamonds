import request from "supertest";
import { createApp } from "../src/app";
import { AppError } from "../src/middleware/error.middleware";

describe("error middleware", () => {
  const app = createApp();

  it("returns standard NOT_FOUND shape for unknown routes", async () => {
    const response = await request(app).get("/v1/unknown-route");

    expect(response.status).toBe(404);
    expect(response.body.error).toMatchObject({
      code: "NOT_FOUND",
      message: "Resource does not exist",
    });
    expect(response.body.error.request_id).toMatch(/^req_/);
    expect(response.headers["x-request-id"]).toBe(response.body.error.request_id);
  });

  it("returns standard error shape for thrown AppError", async () => {
    const testApp = createApp({
      beforeNotFound: (app) => {
        app.get("/test/app-error", (_req, _res, next) => {
          next(
            new AppError(403, "FORBIDDEN", "Action not permitted", {
              reason: "test",
            }),
          );
        });
      },
    });

    const response = await request(testApp).get("/test/app-error");

    expect(response.status).toBe(403);
    expect(response.body.error).toEqual({
      code: "FORBIDDEN",
      message: "Action not permitted",
      details: { reason: "test" },
      request_id: expect.stringMatching(/^req_/),
    });
  });

  it("returns SERVER_ERROR for unexpected errors", async () => {
    const testApp = createApp({
      beforeNotFound: (app) => {
        app.get("/test/unexpected", (_req, _res, next) => {
          next(new Error("boom"));
        });
      },
    });

    const response = await request(testApp).get("/test/unexpected");

    expect(response.status).toBe(500);
    expect(response.body.error.code).toBe("SERVER_ERROR");
    expect(response.body.error.message).toBe("An unexpected error occurred");
  });
});

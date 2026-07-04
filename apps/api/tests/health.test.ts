import request from "supertest";
import { createApp } from "../src/app";

describe("GET /health", () => {
  const app = createApp();

  it("returns 200 with ok status", async () => {
    const response = await request(app).get("/health");

    expect(response.status).toBe(200);
    expect(response.body).toMatchObject({
      status: expect.stringMatching(/^(ok|degraded)$/),
      timestamp: expect.any(String),
      checks: {
        database: expect.objectContaining({
          status: expect.any(String),
        }),
        redis: expect.objectContaining({
          status: expect.any(String),
        }),
      },
    });
    expect(response.headers["x-request-id"]).toBeDefined();
  });

  it("returns 200 for versioned health endpoint", async () => {
    const response = await request(app).get("/v1/health");

    expect(response.status).toBe(200);
    expect(response.body.status).toBe("ok");
  });
});

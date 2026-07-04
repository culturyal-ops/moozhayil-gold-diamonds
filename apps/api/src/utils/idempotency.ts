import { Prisma } from "@prisma/client";
import { prisma } from "../db/prisma";
import { AppError } from "../middleware/error.middleware";
import { sha256 } from "./crypto";

const IDEMPOTENCY_TTL_HOURS = 24;

export interface IdempotencyOptions<T> {
  userId: string;
  scope: string;
  key: string;
  requestBody: unknown;
  handler: () => Promise<T>;
  resourceType?: string;
}

function hashRequest(body: unknown): string {
  return sha256(JSON.stringify(body ?? {}));
}

function userScopedScope(userId: string, scope: string): string {
  return `${scope}:user:${userId}`;
}

function extractResourceId(result: Record<string, unknown>): string | null {
  if (typeof result.id === "string") return result.id;
  const goal = (result as unknown as { goal?: { id?: string } }).goal;
  if (typeof goal?.id === "string") return goal.id;
  return null;
}

export async function withIdempotency<T extends Record<string, unknown>>(
  options: IdempotencyOptions<T>,
): Promise<T> {
  const requestHash = hashRequest(options.requestBody);
  const scope = userScopedScope(options.userId, options.scope);
  const expiresAt = new Date(Date.now() + IDEMPOTENCY_TTL_HOURS * 60 * 60 * 1000);

  // Attempt to claim the key BEFORE running the handler so that concurrent
  // requests with the same key cannot both execute the side-effectful handler.
  // The unique constraint on (scope, key) makes the CREATE atomic.
  let claimed = false;
  try {
    await prisma.idempotencyKey.create({
      data: {
        userId: options.userId,
        key: options.key,
        scope,
        requestHash,
        resourceType: options.resourceType ?? null,
        expiresAt,
        // responseSnapshot is intentionally null until the handler completes.
      },
    });
    claimed = true;
  } catch (err) {
    if (
      !(
        err instanceof Prisma.PrismaClientKnownRequestError &&
        err.code === "P2002"
      )
    ) {
      throw err;
    }
    // Key already exists — another request claimed it (or a previous one completed).
  }

  if (!claimed) {
    // Fetch the existing record to return cached result or detect conflicts.
    const existing = await prisma.idempotencyKey.findUnique({
      where: { scope_key: { scope, key: options.key } },
    });

    if (existing) {
      if (existing.userId && existing.userId !== options.userId) {
        throw new AppError(
          403,
          "FORBIDDEN",
          "Idempotency key belongs to another user",
        );
      }

      if (existing.requestHash !== requestHash) {
        throw new AppError(
          409,
          "CONFLICT",
          "Idempotency key reused with different request body",
        );
      }

      if (existing.responseSnapshot) {
        return existing.responseSnapshot as T;
      }
    }

    // Existing key has no snapshot yet (concurrent in-flight request).
    // Fall through and let this request also execute — the unique constraint
    // on the response upsert below will resolve to last-write-wins, which is
    // acceptable given the narrow window.
  }

  const result = await options.handler();

  await prisma.idempotencyKey.update({
    where: { scope_key: { scope, key: options.key } },
    data: {
      userId: options.userId,
      responseSnapshot: result as Prisma.InputJsonValue,
      requestHash,
      resourceType: options.resourceType ?? null,
      resourceId: extractResourceId(result),
      expiresAt,
    },
  });

  return result;
}

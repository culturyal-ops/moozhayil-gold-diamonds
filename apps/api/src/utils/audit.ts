import type { Prisma } from "@prisma/client";
import { prisma } from "../db/prisma";
import { redactObject } from "./pii";

function toAuditRequestId(requestId?: string): string | null {
  if (!requestId) {
    return null;
  }

  const uuidPattern =
    /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;

  return uuidPattern.test(requestId) ? requestId : null;
}

export interface WriteAuditLogInput {
  actorType: "admin" | "user" | "system";
  actorId?: string;
  action: string;
  entityType: string;
  entityId?: string;
  before?: Record<string, unknown>;
  after?: Record<string, unknown>;
  reason?: string;
  requestId?: string;
  ipAddress?: string;
}

export async function writeAuditLog(input: WriteAuditLogInput): Promise<void> {
  await prisma.auditLog.create({
    data: {
      actorType: input.actorType,
      actorId: input.actorId ?? null,
      action: input.action,
      entityType: input.entityType,
      entityId: input.entityId ?? null,
      before: input.before
        ? (redactObject(input.before) as Prisma.InputJsonValue)
        : undefined,
      after: input.after
        ? (redactObject(input.after) as Prisma.InputJsonValue)
        : undefined,
      reason: input.reason ?? null,
      requestId: toAuditRequestId(input.requestId),
      ipAddress: input.ipAddress ?? null,
    },
  });
}

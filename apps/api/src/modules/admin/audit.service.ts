import { prisma } from "../../db/prisma";
import type { AuditLogQueryInput } from "./admin.schema";

export class AuditService {
  async list(input: AuditLogQueryInput) {
    const logs = await prisma.auditLog.findMany({
      where: {
        ...(input.actor_type ? { actorType: input.actor_type } : {}),
        ...(input.action ? { action: input.action } : {}),
        ...(input.entity_type ? { entityType: input.entity_type } : {}),
      },
      orderBy: { createdAt: "desc" },
      cursor: input.cursor ? { id: input.cursor } : undefined,
      skip: input.cursor ? 1 : 0,
      take: input.limit + 1,
    });

    return {
      logs: logs.slice(0, input.limit).map((log) => ({
        id: log.id,
        actor_type: log.actorType,
        actor_id: log.actorId,
        action: log.action,
        entity_type: log.entityType,
        entity_id: log.entityId,
        before: log.before,
        after: log.after,
        reason: log.reason,
        request_id: log.requestId,
        created_at: log.createdAt.toISOString(),
      })),
      next_cursor: logs.length > input.limit ? logs[input.limit].id : null,
    };
  }
}

export const auditService = new AuditService();

import { logger } from "./logger";

export function emitMetric(
  name: string,
  value: number,
  dimensions?: Record<string, string>,
): void {
  logger.info("metric", {
    metric: name,
    value,
    dimensions,
  });
}

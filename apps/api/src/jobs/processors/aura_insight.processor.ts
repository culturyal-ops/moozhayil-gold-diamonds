import { buildAuraContext } from "../../modules/aura/aura.context";
import { buildInsight } from "../../modules/aura/aura.planner";

export async function processAuraInsight(userId: string) {
  const context = await buildAuraContext(userId);
  return buildInsight(context);
}

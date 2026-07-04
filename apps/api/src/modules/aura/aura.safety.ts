import { prisma } from "../../db/prisma";
import { mapProductToDto, productInclude } from "../products/product.mapper";

export async function filterRecommendations(input: {
  productIds: string[];
  budgetPaise?: number;
}) {
  const products = await prisma.product.findMany({
    where: {
      id: { in: input.productIds },
      isPublished: true,
      deletedAt: null,
      stockQuantity: { gt: 0 },
    },
    include: productInclude(),
  });

  const maxBudget =
    input.budgetPaise !== undefined
      ? Math.floor(input.budgetPaise * 1.2)
      : undefined;

  const results = [];
  for (const product of products) {
    const dto = await mapProductToDto(product);
    if (maxBudget !== undefined && dto.price.total_paise > maxBudget) {
      continue;
    }

    results.push(dto);
  }

  return results;
}

export function sanitizeAuraMessage(message: string): string {
  const blockedPatterns = [
    /\b\d{12}\b/,
    /\b[A-Z]{5}\d{4}[A-Z]\b/i,
    /\+91\d{10}/,
    /@/,
    /financial advice/i,
    /investment returns guaranteed/i,
  ];

  for (const pattern of blockedPatterns) {
    if (pattern.test(message)) {
      return "I can help you plan jewellery goals and discover pieces within your budget.";
    }
  }

  if (message.length > 1200) {
    return `${message.slice(0, 1200).trim()}…`;
  }

  return message;
}

export function gramsRemaining(
  currentGrams: string,
  targetGrams: string | null,
): string | null {
  if (!targetGrams) {
    return null;
  }

  const remaining = Number.parseFloat(targetGrams) - Number.parseFloat(currentGrams);
  if (remaining <= 0) {
    return "0.0000";
  }

  return remaining.toFixed(4);
}

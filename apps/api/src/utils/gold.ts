import Decimal from "decimal.js";

export function formatGoldGrams(value: Decimal.Value): string {
  const floored = new Decimal(value).toDecimalPlaces(1, Decimal.ROUND_DOWN);
  return `${floored.toFixed(1)}g`;
}

export function decimalString(value: Decimal.Value): string {
  return new Decimal(value).toDecimalPlaces(4, Decimal.ROUND_DOWN).toFixed(4);
}

export function calculateGramsFromPaise(
  amountPaise: number,
  ratePerGramPaise: number,
): Decimal {
  return new Decimal(amountPaise)
    .div(ratePerGramPaise)
    .toDecimalPlaces(4, Decimal.ROUND_DOWN);
}

export function calculateValuePaiseFromGrams(
  grams: Decimal.Value,
  ratePerGramPaise: number,
): number {
  return new Decimal(grams)
    .mul(ratePerGramPaise)
    .toDecimalPlaces(0, Decimal.ROUND_HALF_UP)
    .toNumber();
}

export function sumGrams(values: Decimal.Value[]): Decimal {
  return values.reduce<Decimal>(
    (total, value) => total.plus(new Decimal(value)),
    new Decimal(0),
  );
}

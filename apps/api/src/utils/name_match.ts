import { KYC_NAME_MATCH_THRESHOLD } from "../config/kyc.constants";

function normalizeName(value: string): string[] {
  return value
    .toUpperCase()
    .replace(/[^A-Z\s]/g, " ")
    .split(/\s+/)
    .filter(Boolean);
}

function tokenOverlapScore(a: string[], b: string[]): number {
  if (a.length === 0 || b.length === 0) {
    return 0;
  }

  const setB = new Set(b);
  let matches = 0;

  for (const token of a) {
    if (setB.has(token)) {
      matches += 1;
      continue;
    }

    if (token.length === 1) {
      const initialMatch = b.some(
        (candidate) => candidate.startsWith(token) || candidate.length === 1,
      );
      if (initialMatch) {
        matches += 0.5;
      }
    }
  }

  return matches / Math.max(a.length, b.length);
}

export function namesMatch(aadhaarName: string, panName: string): boolean {
  const aTokens = normalizeName(aadhaarName);
  const bTokens = normalizeName(panName);

  return tokenOverlapScore(aTokens, bTokens) >= KYC_NAME_MATCH_THRESHOLD;
}

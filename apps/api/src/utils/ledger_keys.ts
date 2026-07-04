import type { LedgerEntryType } from "@prisma/client";

export function contributionCreditLedgerKey(contributionId: string): string {
  return `contribution_credit:${contributionId}`;
}

export function bonusCreditLedgerKey(contributionId: string): string {
  return `bonus_credit:${contributionId}`;
}

export function redemptionDebitLedgerKey(orderId: string): string {
  return `redemption_debit:${orderId}`;
}

export function refundCreditLedgerKey(orderId: string): string {
  return `refund_credit:${orderId}`;
}

export function manualAdjustmentLedgerKey(adjustmentId: string): string {
  return `manual_adjustment:${adjustmentId}`;
}

export const POSTED_CREDIT_ENTRY_TYPES: LedgerEntryType[] = [
  "contribution_credit",
  "bonus_credit",
];

export function addDays(date: Date, days: number): Date {
  const result = new Date(date);
  result.setUTCDate(result.getUTCDate() + days);
  return result;
}

export function addMonths(date: Date, months: number): Date {
  const result = new Date(date);
  result.setUTCMonth(result.getUTCMonth() + months);
  return result;
}

export function toDateOnly(date: Date): Date {
  return new Date(
    Date.UTC(date.getUTCFullYear(), date.getUTCMonth(), date.getUTCDate()),
  );
}

export function formatDateOnly(date: Date): string {
  return date.toISOString().slice(0, 10);
}

export function daysBetween(start: Date, end: Date): number {
  const ms = toDateOnly(end).getTime() - toDateOnly(start).getTime();
  return Math.floor(ms / (24 * 60 * 60 * 1000));
}

export function monthsRemaining(from: Date, to: Date): number {
  const years = to.getUTCFullYear() - from.getUTCFullYear();
  const months = to.getUTCMonth() - from.getUTCMonth();
  return Math.max(years * 12 + months, 0);
}

/** Whole calendar months elapsed from `start` to `end` (date-only). */
export function calendarMonthsBetween(start: Date, end: Date): number {
  const from = toDateOnly(start);
  const to = toDateOnly(end);
  const years = to.getUTCFullYear() - from.getUTCFullYear();
  const months = to.getUTCMonth() - from.getUTCMonth();
  return Math.max(years * 12 + months, 0);
}

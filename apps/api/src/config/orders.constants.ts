export const ORDER_NUMBER_PREFIX = "MGD";
export const INVENTORY_RESERVATION_TTL_MINUTES = 15;
export const COD_MAX_ORDER_PAISE = 2_500_000;
export const ORDER_KYC_THRESHOLD_PAISE = 5_000_000;

export const ORDER_STATUS_LABELS: Record<string, string> = {
  draft: "Draft",
  pending_payment: "Pending Payment",
  confirmed: "Confirmed",
  processing: "Processing",
  shipped: "Shipped",
  delivered: "Delivered",
  delivery_failed: "Delivery Failed",
  cancelled: "Cancelled",
  refund_initiated: "Refund Initiated",
  refunded: "Refunded",
};

export const CANCELLABLE_ORDER_STATUSES = [
  "pending_payment",
  "confirmed",
] as const;

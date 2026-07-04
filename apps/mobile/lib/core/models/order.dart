// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'product_name') required String productName,
    @JsonKey(name: 'product_image') String? productImage,
    required int quantity,
    @JsonKey(name: 'unit_price_paise') required int unitPricePaise,
    @JsonKey(name: 'unit_price_display') required String unitPriceDisplay,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    @JsonKey(name: 'order_number') required String orderNumber,
    required String status,
    @JsonKey(name: 'status_display') required String statusDisplay,
    @JsonKey(name: 'total_paise') required int totalPaise,
    @JsonKey(name: 'total_display') required String totalDisplay,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'gold_balance_used_grams')
    required String goldBalanceUsedGrams,
    @JsonKey(name: 'making_charge_waiver_paise')
    @Default(0)
    int makingChargeWaiverPaise,
    @JsonKey(name: 'making_charge_waiver_display')
    String? makingChargeWaiverDisplay,
    required List<OrderItem> items,
    @JsonKey(name: 'ordered_at') required String orderedAt,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}

@freezed
abstract class OrdersListResponse with _$OrdersListResponse {
  const factory OrdersListResponse({
    required List<Order> data,
    @JsonKey(name: 'next_cursor') String? nextCursor,
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _OrdersListResponse;

  factory OrdersListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrdersListResponseFromJson(json);
}

@freezed
abstract class PaymentBreakdown with _$PaymentBreakdown {
  const factory PaymentBreakdown({
    @JsonKey(name: 'total_paise') required int totalPaise,
    @JsonKey(name: 'gold_applied_paise') required int goldAppliedPaise,
    @JsonKey(name: 'cash_paid_paise') required int cashPaidPaise,
    @JsonKey(name: 'gold_rate_paise') required int goldRatePaise,
  }) = _PaymentBreakdown;

  factory PaymentBreakdown.fromJson(Map<String, dynamic> json) =>
      _$PaymentBreakdownFromJson(json);
}

@freezed
abstract class OrderDetailResponse with _$OrderDetailResponse {
  const factory OrderDetailResponse({
    required Order order,
    @JsonKey(name: 'payment_breakdown')
    required PaymentBreakdown paymentBreakdown,
  }) = _OrderDetailResponse;

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailResponseFromJson(json);
}

@freezed
abstract class CreateOrderResponse with _$CreateOrderResponse {
  const factory CreateOrderResponse({
    required Order order,
    @JsonKey(name: 'payment_required') required bool paymentRequired,
    @JsonKey(name: 'payment_amount_paise') required int paymentAmountPaise,
    @JsonKey(name: 'payment_session_id') String? paymentSessionId,
    @JsonKey(name: 'payment_url') String? paymentUrl,
    @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
    @JsonKey(name: 'razorpay_key_id') String? razorpayKeyId,
    @JsonKey(name: 'aura_mc_waiver_applied')
    @Default(false)
    bool auraMcWaiverApplied,
    @JsonKey(name: 'making_charge_waiver_paise')
    @Default(0)
    int makingChargeWaiverPaise,
    @JsonKey(name: 'making_charge_waiver_display')
    String? makingChargeWaiverDisplay,
  }) = _CreateOrderResponse;

  factory CreateOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderResponseFromJson(json);
}

@freezed
abstract class CancelOrderResponse with _$CancelOrderResponse {
  const factory CancelOrderResponse({
    required Order order,
    @JsonKey(name: 'refund_initiated') required bool refundInitiated,
  }) = _CancelOrderResponse;

  factory CancelOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelOrderResponseFromJson(json);
}

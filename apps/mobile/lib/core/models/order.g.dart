// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  productId: json['product_id'] as String,
  productName: json['product_name'] as String,
  productImage: json['product_image'] as String?,
  quantity: (json['quantity'] as num).toInt(),
  unitPricePaise: (json['unit_price_paise'] as num).toInt(),
  unitPriceDisplay: json['unit_price_display'] as String,
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image': instance.productImage,
      'quantity': instance.quantity,
      'unit_price_paise': instance.unitPricePaise,
      'unit_price_display': instance.unitPriceDisplay,
    };

_Order _$OrderFromJson(Map<String, dynamic> json) => _Order(
  id: json['id'] as String,
  orderNumber: json['order_number'] as String,
  status: json['status'] as String,
  statusDisplay: json['status_display'] as String,
  totalPaise: (json['total_paise'] as num).toInt(),
  totalDisplay: json['total_display'] as String,
  paymentMethod: json['payment_method'] as String,
  goldBalanceUsedGrams: json['gold_balance_used_grams'] as String,
  makingChargeWaiverPaise:
      (json['making_charge_waiver_paise'] as num?)?.toInt() ?? 0,
  makingChargeWaiverDisplay: json['making_charge_waiver_display'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  orderedAt: json['ordered_at'] as String,
);

Map<String, dynamic> _$OrderToJson(_Order instance) => <String, dynamic>{
  'id': instance.id,
  'order_number': instance.orderNumber,
  'status': instance.status,
  'status_display': instance.statusDisplay,
  'total_paise': instance.totalPaise,
  'total_display': instance.totalDisplay,
  'payment_method': instance.paymentMethod,
  'gold_balance_used_grams': instance.goldBalanceUsedGrams,
  'making_charge_waiver_paise': instance.makingChargeWaiverPaise,
  'making_charge_waiver_display': instance.makingChargeWaiverDisplay,
  'items': instance.items,
  'ordered_at': instance.orderedAt,
};

_OrdersListResponse _$OrdersListResponseFromJson(Map<String, dynamic> json) =>
    _OrdersListResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['next_cursor'] as String?,
      hasMore: json['has_more'] as bool,
    );

Map<String, dynamic> _$OrdersListResponseToJson(_OrdersListResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'next_cursor': instance.nextCursor,
      'has_more': instance.hasMore,
    };

_PaymentBreakdown _$PaymentBreakdownFromJson(Map<String, dynamic> json) =>
    _PaymentBreakdown(
      totalPaise: (json['total_paise'] as num).toInt(),
      goldAppliedPaise: (json['gold_applied_paise'] as num).toInt(),
      cashPaidPaise: (json['cash_paid_paise'] as num).toInt(),
      goldRatePaise: (json['gold_rate_paise'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentBreakdownToJson(_PaymentBreakdown instance) =>
    <String, dynamic>{
      'total_paise': instance.totalPaise,
      'gold_applied_paise': instance.goldAppliedPaise,
      'cash_paid_paise': instance.cashPaidPaise,
      'gold_rate_paise': instance.goldRatePaise,
    };

_OrderDetailResponse _$OrderDetailResponseFromJson(Map<String, dynamic> json) =>
    _OrderDetailResponse(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      paymentBreakdown: PaymentBreakdown.fromJson(
        json['payment_breakdown'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$OrderDetailResponseToJson(
  _OrderDetailResponse instance,
) => <String, dynamic>{
  'order': instance.order,
  'payment_breakdown': instance.paymentBreakdown,
};

_CreateOrderResponse _$CreateOrderResponseFromJson(Map<String, dynamic> json) =>
    _CreateOrderResponse(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      paymentRequired: json['payment_required'] as bool,
      paymentAmountPaise: (json['payment_amount_paise'] as num).toInt(),
      paymentSessionId: json['payment_session_id'] as String?,
      paymentUrl: json['payment_url'] as String?,
      razorpayOrderId: json['razorpay_order_id'] as String?,
      razorpayKeyId: json['razorpay_key_id'] as String?,
      auraMcWaiverApplied: json['aura_mc_waiver_applied'] as bool? ?? false,
      makingChargeWaiverPaise:
          (json['making_charge_waiver_paise'] as num?)?.toInt() ?? 0,
      makingChargeWaiverDisplay:
          json['making_charge_waiver_display'] as String?,
    );

Map<String, dynamic> _$CreateOrderResponseToJson(
  _CreateOrderResponse instance,
) => <String, dynamic>{
  'order': instance.order,
  'payment_required': instance.paymentRequired,
  'payment_amount_paise': instance.paymentAmountPaise,
  'payment_session_id': instance.paymentSessionId,
  'payment_url': instance.paymentUrl,
  'razorpay_order_id': instance.razorpayOrderId,
  'razorpay_key_id': instance.razorpayKeyId,
  'aura_mc_waiver_applied': instance.auraMcWaiverApplied,
  'making_charge_waiver_paise': instance.makingChargeWaiverPaise,
  'making_charge_waiver_display': instance.makingChargeWaiverDisplay,
};

_CancelOrderResponse _$CancelOrderResponseFromJson(Map<String, dynamic> json) =>
    _CancelOrderResponse(
      order: Order.fromJson(json['order'] as Map<String, dynamic>),
      refundInitiated: json['refund_initiated'] as bool,
    );

Map<String, dynamic> _$CancelOrderResponseToJson(
  _CancelOrderResponse instance,
) => <String, dynamic>{
  'order': instance.order,
  'refund_initiated': instance.refundInitiated,
};

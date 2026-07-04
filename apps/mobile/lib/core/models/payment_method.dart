// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

@freezed
abstract class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id,
    required String type,
    @JsonKey(name: 'display_label') required String displayLabel,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'is_autopay_enabled') required bool isAutopayEnabled,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
abstract class PaymentMethodsResponse with _$PaymentMethodsResponse {
  const factory PaymentMethodsResponse({
    @JsonKey(name: 'payment_methods')
    required List<PaymentMethod> paymentMethods,
  }) = _PaymentMethodsResponse;

  factory PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodsResponseFromJson(json);
}

@freezed
abstract class VerifyUpiResponse with _$VerifyUpiResponse {
  const factory VerifyUpiResponse({
    required bool verified,
    @JsonKey(name: 'display_label') required String displayLabel,
  }) = _VerifyUpiResponse;

  factory VerifyUpiResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyUpiResponseFromJson(json);
}

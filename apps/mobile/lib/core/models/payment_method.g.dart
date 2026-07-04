// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    _PaymentMethod(
      id: json['id'] as String,
      type: json['type'] as String,
      displayLabel: json['display_label'] as String,
      isDefault: json['is_default'] as bool,
      isAutopayEnabled: json['is_autopay_enabled'] as bool,
    );

Map<String, dynamic> _$PaymentMethodToJson(_PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'display_label': instance.displayLabel,
      'is_default': instance.isDefault,
      'is_autopay_enabled': instance.isAutopayEnabled,
    };

_PaymentMethodsResponse _$PaymentMethodsResponseFromJson(
  Map<String, dynamic> json,
) => _PaymentMethodsResponse(
  paymentMethods: (json['payment_methods'] as List<dynamic>)
      .map((e) => PaymentMethod.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PaymentMethodsResponseToJson(
  _PaymentMethodsResponse instance,
) => <String, dynamic>{'payment_methods': instance.paymentMethods};

_VerifyUpiResponse _$VerifyUpiResponseFromJson(Map<String, dynamic> json) =>
    _VerifyUpiResponse(
      verified: json['verified'] as bool,
      displayLabel: json['display_label'] as String,
    );

Map<String, dynamic> _$VerifyUpiResponseToJson(_VerifyUpiResponse instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'display_label': instance.displayLabel,
    };

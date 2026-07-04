// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => _UserAddress(
  id: json['id'] as String,
  label: json['label'] as String?,
  fullName: json['full_name'] as String,
  phone: json['phone'] as String,
  line1: json['line1'] as String,
  line2: json['line2'] as String?,
  city: json['city'] as String,
  state: json['state'] as String,
  pincode: json['pincode'] as String,
  isDefault: json['is_default'] as bool? ?? false,
);

Map<String, dynamic> _$UserAddressToJson(_UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'full_name': instance.fullName,
      'phone': instance.phone,
      'line1': instance.line1,
      'line2': instance.line2,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'is_default': instance.isDefault,
    };

_AddressListResponse _$AddressListResponseFromJson(Map<String, dynamic> json) =>
    _AddressListResponse(
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => UserAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressListResponseToJson(
  _AddressListResponse instance,
) => <String, dynamic>{'addresses': instance.addresses};

_PincodeValidation _$PincodeValidationFromJson(Map<String, dynamic> json) =>
    _PincodeValidation(
      serviceable: json['serviceable'] as bool,
      city: json['city'] as String?,
      state: json['state'] as String?,
      estimatedDeliveryDays: (json['estimated_delivery_days'] as num?)?.toInt(),
      pickupAvailable: json['pickup_available'] as bool? ?? false,
    );

Map<String, dynamic> _$PincodeValidationToJson(_PincodeValidation instance) =>
    <String, dynamic>{
      'serviceable': instance.serviceable,
      'city': instance.city,
      'state': instance.state,
      'estimated_delivery_days': instance.estimatedDeliveryDays,
      'pickup_available': instance.pickupAvailable,
    };

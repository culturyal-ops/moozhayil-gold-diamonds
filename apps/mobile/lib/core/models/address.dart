// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class UserAddress with _$UserAddress {
  const factory UserAddress({
    required String id,
    String? label,
    @JsonKey(name: 'full_name') required String fullName,
    required String phone,
    required String line1,
    String? line2,
    required String city,
    required String state,
    required String pincode,
    @JsonKey(name: 'is_default') @Default(false) bool isDefault,
  }) = _UserAddress;

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);
}

@freezed
abstract class AddressListResponse with _$AddressListResponse {
  const factory AddressListResponse({required List<UserAddress> addresses}) =
      _AddressListResponse;

  factory AddressListResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressListResponseFromJson(json);
}

@freezed
abstract class PincodeValidation with _$PincodeValidation {
  const factory PincodeValidation({
    required bool serviceable,
    String? city,
    String? state,
    @JsonKey(name: 'estimated_delivery_days') int? estimatedDeliveryDays,
    @JsonKey(name: 'pickup_available') @Default(false) bool pickupAvailable,
  }) = _PincodeValidation;

  factory PincodeValidation.fromJson(Map<String, dynamic> json) =>
      _$PincodeValidationFromJson(json);
}

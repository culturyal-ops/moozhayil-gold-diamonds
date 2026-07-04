// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_location.freezed.dart';
part 'store_location.g.dart';

@freezed
abstract class StoreLocation with _$StoreLocation {
  const factory StoreLocation({
    required String id,
    required String name,
    required String address,
    required String city,
    required String state,
    required String pincode,
    required String phone,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'opening_hours') required Map<String, String> openingHours,
    @JsonKey(name: 'is_open_now') required bool isOpenNow,
    @JsonKey(name: 'distance_km') double? distanceKm,
  }) = _StoreLocation;

  factory StoreLocation.fromJson(Map<String, dynamic> json) =>
      _$StoreLocationFromJson(json);
}

@freezed
abstract class StoresListResponse with _$StoresListResponse {
  const factory StoresListResponse({required List<StoreLocation> stores}) =
      _StoresListResponse;

  factory StoresListResponse.fromJson(Map<String, dynamic> json) =>
      _$StoresListResponseFromJson(json);
}

@freezed
abstract class StoreDetailResponse with _$StoreDetailResponse {
  const factory StoreDetailResponse({required StoreLocation store}) =
      _StoreDetailResponse;

  factory StoreDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$StoreDetailResponseFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StoreLocation _$StoreLocationFromJson(Map<String, dynamic> json) =>
    _StoreLocation(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      pincode: json['pincode'] as String,
      phone: json['phone'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      openingHours: Map<String, String>.from(json['opening_hours'] as Map),
      isOpenNow: json['is_open_now'] as bool,
      distanceKm: (json['distance_km'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StoreLocationToJson(_StoreLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'opening_hours': instance.openingHours,
      'is_open_now': instance.isOpenNow,
      'distance_km': instance.distanceKm,
    };

_StoresListResponse _$StoresListResponseFromJson(Map<String, dynamic> json) =>
    _StoresListResponse(
      stores: (json['stores'] as List<dynamic>)
          .map((e) => StoreLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoresListResponseToJson(_StoresListResponse instance) =>
    <String, dynamic>{'stores': instance.stores};

_StoreDetailResponse _$StoreDetailResponseFromJson(Map<String, dynamic> json) =>
    _StoreDetailResponse(
      store: StoreLocation.fromJson(json['store'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StoreDetailResponseToJson(
  _StoreDetailResponse instance,
) => <String, dynamic>{'store': instance.store};

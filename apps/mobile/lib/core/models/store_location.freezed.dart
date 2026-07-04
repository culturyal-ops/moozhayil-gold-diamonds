// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StoreLocation {

 String get id; String get name; String get address; String get city; String get state; String get pincode; String get phone; double get latitude; double get longitude;@JsonKey(name: 'opening_hours') Map<String, String> get openingHours;@JsonKey(name: 'is_open_now') bool get isOpenNow;@JsonKey(name: 'distance_km') double? get distanceKm;
/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreLocationCopyWith<StoreLocation> get copyWith => _$StoreLocationCopyWithImpl<StoreLocation>(this as StoreLocation, _$identity);

  /// Serializes this StoreLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other.openingHours, openingHours)&&(identical(other.isOpenNow, isOpenNow) || other.isOpenNow == isOpenNow)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,city,state,pincode,phone,latitude,longitude,const DeepCollectionEquality().hash(openingHours),isOpenNow,distanceKm);

@override
String toString() {
  return 'StoreLocation(id: $id, name: $name, address: $address, city: $city, state: $state, pincode: $pincode, phone: $phone, latitude: $latitude, longitude: $longitude, openingHours: $openingHours, isOpenNow: $isOpenNow, distanceKm: $distanceKm)';
}


}

/// @nodoc
abstract mixin class $StoreLocationCopyWith<$Res>  {
  factory $StoreLocationCopyWith(StoreLocation value, $Res Function(StoreLocation) _then) = _$StoreLocationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String address, String city, String state, String pincode, String phone, double latitude, double longitude,@JsonKey(name: 'opening_hours') Map<String, String> openingHours,@JsonKey(name: 'is_open_now') bool isOpenNow,@JsonKey(name: 'distance_km') double? distanceKm
});




}
/// @nodoc
class _$StoreLocationCopyWithImpl<$Res>
    implements $StoreLocationCopyWith<$Res> {
  _$StoreLocationCopyWithImpl(this._self, this._then);

  final StoreLocation _self;
  final $Res Function(StoreLocation) _then;

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? address = null,Object? city = null,Object? state = null,Object? pincode = null,Object? phone = null,Object? latitude = null,Object? longitude = null,Object? openingHours = null,Object? isOpenNow = null,Object? distanceKm = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,pincode: null == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,openingHours: null == openingHours ? _self.openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isOpenNow: null == isOpenNow ? _self.isOpenNow : isOpenNow // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [StoreLocation].
extension StoreLocationPatterns on StoreLocation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreLocation value)  $default,){
final _that = this;
switch (_that) {
case _StoreLocation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreLocation value)?  $default,){
final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String city,  String state,  String pincode,  String phone,  double latitude,  double longitude, @JsonKey(name: 'opening_hours')  Map<String, String> openingHours, @JsonKey(name: 'is_open_now')  bool isOpenNow, @JsonKey(name: 'distance_km')  double? distanceKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude,_that.openingHours,_that.isOpenNow,_that.distanceKm);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String address,  String city,  String state,  String pincode,  String phone,  double latitude,  double longitude, @JsonKey(name: 'opening_hours')  Map<String, String> openingHours, @JsonKey(name: 'is_open_now')  bool isOpenNow, @JsonKey(name: 'distance_km')  double? distanceKm)  $default,) {final _that = this;
switch (_that) {
case _StoreLocation():
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude,_that.openingHours,_that.isOpenNow,_that.distanceKm);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String address,  String city,  String state,  String pincode,  String phone,  double latitude,  double longitude, @JsonKey(name: 'opening_hours')  Map<String, String> openingHours, @JsonKey(name: 'is_open_now')  bool isOpenNow, @JsonKey(name: 'distance_km')  double? distanceKm)?  $default,) {final _that = this;
switch (_that) {
case _StoreLocation() when $default != null:
return $default(_that.id,_that.name,_that.address,_that.city,_that.state,_that.pincode,_that.phone,_that.latitude,_that.longitude,_that.openingHours,_that.isOpenNow,_that.distanceKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreLocation implements StoreLocation {
  const _StoreLocation({required this.id, required this.name, required this.address, required this.city, required this.state, required this.pincode, required this.phone, required this.latitude, required this.longitude, @JsonKey(name: 'opening_hours') required final  Map<String, String> openingHours, @JsonKey(name: 'is_open_now') required this.isOpenNow, @JsonKey(name: 'distance_km') this.distanceKm}): _openingHours = openingHours;
  factory _StoreLocation.fromJson(Map<String, dynamic> json) => _$StoreLocationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String address;
@override final  String city;
@override final  String state;
@override final  String pincode;
@override final  String phone;
@override final  double latitude;
@override final  double longitude;
 final  Map<String, String> _openingHours;
@override@JsonKey(name: 'opening_hours') Map<String, String> get openingHours {
  if (_openingHours is EqualUnmodifiableMapView) return _openingHours;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_openingHours);
}

@override@JsonKey(name: 'is_open_now') final  bool isOpenNow;
@override@JsonKey(name: 'distance_km') final  double? distanceKm;

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreLocationCopyWith<_StoreLocation> get copyWith => __$StoreLocationCopyWithImpl<_StoreLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&const DeepCollectionEquality().equals(other._openingHours, _openingHours)&&(identical(other.isOpenNow, isOpenNow) || other.isOpenNow == isOpenNow)&&(identical(other.distanceKm, distanceKm) || other.distanceKm == distanceKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,address,city,state,pincode,phone,latitude,longitude,const DeepCollectionEquality().hash(_openingHours),isOpenNow,distanceKm);

@override
String toString() {
  return 'StoreLocation(id: $id, name: $name, address: $address, city: $city, state: $state, pincode: $pincode, phone: $phone, latitude: $latitude, longitude: $longitude, openingHours: $openingHours, isOpenNow: $isOpenNow, distanceKm: $distanceKm)';
}


}

/// @nodoc
abstract mixin class _$StoreLocationCopyWith<$Res> implements $StoreLocationCopyWith<$Res> {
  factory _$StoreLocationCopyWith(_StoreLocation value, $Res Function(_StoreLocation) _then) = __$StoreLocationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String address, String city, String state, String pincode, String phone, double latitude, double longitude,@JsonKey(name: 'opening_hours') Map<String, String> openingHours,@JsonKey(name: 'is_open_now') bool isOpenNow,@JsonKey(name: 'distance_km') double? distanceKm
});




}
/// @nodoc
class __$StoreLocationCopyWithImpl<$Res>
    implements _$StoreLocationCopyWith<$Res> {
  __$StoreLocationCopyWithImpl(this._self, this._then);

  final _StoreLocation _self;
  final $Res Function(_StoreLocation) _then;

/// Create a copy of StoreLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? address = null,Object? city = null,Object? state = null,Object? pincode = null,Object? phone = null,Object? latitude = null,Object? longitude = null,Object? openingHours = null,Object? isOpenNow = null,Object? distanceKm = freezed,}) {
  return _then(_StoreLocation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,pincode: null == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,openingHours: null == openingHours ? _self._openingHours : openingHours // ignore: cast_nullable_to_non_nullable
as Map<String, String>,isOpenNow: null == isOpenNow ? _self.isOpenNow : isOpenNow // ignore: cast_nullable_to_non_nullable
as bool,distanceKm: freezed == distanceKm ? _self.distanceKm : distanceKm // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$StoresListResponse {

 List<StoreLocation> get stores;
/// Create a copy of StoresListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoresListResponseCopyWith<StoresListResponse> get copyWith => _$StoresListResponseCopyWithImpl<StoresListResponse>(this as StoresListResponse, _$identity);

  /// Serializes this StoresListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoresListResponse&&const DeepCollectionEquality().equals(other.stores, stores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(stores));

@override
String toString() {
  return 'StoresListResponse(stores: $stores)';
}


}

/// @nodoc
abstract mixin class $StoresListResponseCopyWith<$Res>  {
  factory $StoresListResponseCopyWith(StoresListResponse value, $Res Function(StoresListResponse) _then) = _$StoresListResponseCopyWithImpl;
@useResult
$Res call({
 List<StoreLocation> stores
});




}
/// @nodoc
class _$StoresListResponseCopyWithImpl<$Res>
    implements $StoresListResponseCopyWith<$Res> {
  _$StoresListResponseCopyWithImpl(this._self, this._then);

  final StoresListResponse _self;
  final $Res Function(StoresListResponse) _then;

/// Create a copy of StoresListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stores = null,}) {
  return _then(_self.copyWith(
stores: null == stores ? _self.stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreLocation>,
  ));
}

}


/// Adds pattern-matching-related methods to [StoresListResponse].
extension StoresListResponsePatterns on StoresListResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoresListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoresListResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoresListResponse value)  $default,){
final _that = this;
switch (_that) {
case _StoresListResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoresListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StoresListResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<StoreLocation> stores)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoresListResponse() when $default != null:
return $default(_that.stores);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<StoreLocation> stores)  $default,) {final _that = this;
switch (_that) {
case _StoresListResponse():
return $default(_that.stores);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<StoreLocation> stores)?  $default,) {final _that = this;
switch (_that) {
case _StoresListResponse() when $default != null:
return $default(_that.stores);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoresListResponse implements StoresListResponse {
  const _StoresListResponse({required final  List<StoreLocation> stores}): _stores = stores;
  factory _StoresListResponse.fromJson(Map<String, dynamic> json) => _$StoresListResponseFromJson(json);

 final  List<StoreLocation> _stores;
@override List<StoreLocation> get stores {
  if (_stores is EqualUnmodifiableListView) return _stores;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stores);
}


/// Create a copy of StoresListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoresListResponseCopyWith<_StoresListResponse> get copyWith => __$StoresListResponseCopyWithImpl<_StoresListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoresListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoresListResponse&&const DeepCollectionEquality().equals(other._stores, _stores));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_stores));

@override
String toString() {
  return 'StoresListResponse(stores: $stores)';
}


}

/// @nodoc
abstract mixin class _$StoresListResponseCopyWith<$Res> implements $StoresListResponseCopyWith<$Res> {
  factory _$StoresListResponseCopyWith(_StoresListResponse value, $Res Function(_StoresListResponse) _then) = __$StoresListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<StoreLocation> stores
});




}
/// @nodoc
class __$StoresListResponseCopyWithImpl<$Res>
    implements _$StoresListResponseCopyWith<$Res> {
  __$StoresListResponseCopyWithImpl(this._self, this._then);

  final _StoresListResponse _self;
  final $Res Function(_StoresListResponse) _then;

/// Create a copy of StoresListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stores = null,}) {
  return _then(_StoresListResponse(
stores: null == stores ? _self._stores : stores // ignore: cast_nullable_to_non_nullable
as List<StoreLocation>,
  ));
}


}


/// @nodoc
mixin _$StoreDetailResponse {

 StoreLocation get store;
/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StoreDetailResponseCopyWith<StoreDetailResponse> get copyWith => _$StoreDetailResponseCopyWithImpl<StoreDetailResponse>(this as StoreDetailResponse, _$identity);

  /// Serializes this StoreDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StoreDetailResponse&&(identical(other.store, store) || other.store == store));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,store);

@override
String toString() {
  return 'StoreDetailResponse(store: $store)';
}


}

/// @nodoc
abstract mixin class $StoreDetailResponseCopyWith<$Res>  {
  factory $StoreDetailResponseCopyWith(StoreDetailResponse value, $Res Function(StoreDetailResponse) _then) = _$StoreDetailResponseCopyWithImpl;
@useResult
$Res call({
 StoreLocation store
});


$StoreLocationCopyWith<$Res> get store;

}
/// @nodoc
class _$StoreDetailResponseCopyWithImpl<$Res>
    implements $StoreDetailResponseCopyWith<$Res> {
  _$StoreDetailResponseCopyWithImpl(this._self, this._then);

  final StoreDetailResponse _self;
  final $Res Function(StoreDetailResponse) _then;

/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? store = null,}) {
  return _then(_self.copyWith(
store: null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as StoreLocation,
  ));
}
/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreLocationCopyWith<$Res> get store {
  
  return $StoreLocationCopyWith<$Res>(_self.store, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}


/// Adds pattern-matching-related methods to [StoreDetailResponse].
extension StoreDetailResponsePatterns on StoreDetailResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StoreDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StoreDetailResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StoreDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _StoreDetailResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StoreDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _StoreDetailResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( StoreLocation store)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StoreDetailResponse() when $default != null:
return $default(_that.store);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( StoreLocation store)  $default,) {final _that = this;
switch (_that) {
case _StoreDetailResponse():
return $default(_that.store);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( StoreLocation store)?  $default,) {final _that = this;
switch (_that) {
case _StoreDetailResponse() when $default != null:
return $default(_that.store);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StoreDetailResponse implements StoreDetailResponse {
  const _StoreDetailResponse({required this.store});
  factory _StoreDetailResponse.fromJson(Map<String, dynamic> json) => _$StoreDetailResponseFromJson(json);

@override final  StoreLocation store;

/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StoreDetailResponseCopyWith<_StoreDetailResponse> get copyWith => __$StoreDetailResponseCopyWithImpl<_StoreDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StoreDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StoreDetailResponse&&(identical(other.store, store) || other.store == store));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,store);

@override
String toString() {
  return 'StoreDetailResponse(store: $store)';
}


}

/// @nodoc
abstract mixin class _$StoreDetailResponseCopyWith<$Res> implements $StoreDetailResponseCopyWith<$Res> {
  factory _$StoreDetailResponseCopyWith(_StoreDetailResponse value, $Res Function(_StoreDetailResponse) _then) = __$StoreDetailResponseCopyWithImpl;
@override @useResult
$Res call({
 StoreLocation store
});


@override $StoreLocationCopyWith<$Res> get store;

}
/// @nodoc
class __$StoreDetailResponseCopyWithImpl<$Res>
    implements _$StoreDetailResponseCopyWith<$Res> {
  __$StoreDetailResponseCopyWithImpl(this._self, this._then);

  final _StoreDetailResponse _self;
  final $Res Function(_StoreDetailResponse) _then;

/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? store = null,}) {
  return _then(_StoreDetailResponse(
store: null == store ? _self.store : store // ignore: cast_nullable_to_non_nullable
as StoreLocation,
  ));
}

/// Create a copy of StoreDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StoreLocationCopyWith<$Res> get store {
  
  return $StoreLocationCopyWith<$Res>(_self.store, (value) {
    return _then(_self.copyWith(store: value));
  });
}
}

// dart format on

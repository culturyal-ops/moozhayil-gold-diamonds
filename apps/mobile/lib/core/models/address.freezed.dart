// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAddress {

 String get id; String? get label;@JsonKey(name: 'full_name') String get fullName; String get phone; String get line1; String? get line2; String get city; String get state; String get pincode;@JsonKey(name: 'is_default') bool get isDefault;
/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAddressCopyWith<UserAddress> get copyWith => _$UserAddressCopyWithImpl<UserAddress>(this as UserAddress, _$identity);

  /// Serializes this UserAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,fullName,phone,line1,line2,city,state,pincode,isDefault);

@override
String toString() {
  return 'UserAddress(id: $id, label: $label, fullName: $fullName, phone: $phone, line1: $line1, line2: $line2, city: $city, state: $state, pincode: $pincode, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $UserAddressCopyWith<$Res>  {
  factory $UserAddressCopyWith(UserAddress value, $Res Function(UserAddress) _then) = _$UserAddressCopyWithImpl;
@useResult
$Res call({
 String id, String? label,@JsonKey(name: 'full_name') String fullName, String phone, String line1, String? line2, String city, String state, String pincode,@JsonKey(name: 'is_default') bool isDefault
});




}
/// @nodoc
class _$UserAddressCopyWithImpl<$Res>
    implements $UserAddressCopyWith<$Res> {
  _$UserAddressCopyWithImpl(this._self, this._then);

  final UserAddress _self;
  final $Res Function(UserAddress) _then;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = freezed,Object? fullName = null,Object? phone = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? state = null,Object? pincode = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,pincode: null == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAddress].
extension UserAddressPatterns on UserAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAddress value)  $default,){
final _that = this;
switch (_that) {
case _UserAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAddress value)?  $default,){
final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? label, @JsonKey(name: 'full_name')  String fullName,  String phone,  String line1,  String? line2,  String city,  String state,  String pincode, @JsonKey(name: 'is_default')  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that.id,_that.label,_that.fullName,_that.phone,_that.line1,_that.line2,_that.city,_that.state,_that.pincode,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? label, @JsonKey(name: 'full_name')  String fullName,  String phone,  String line1,  String? line2,  String city,  String state,  String pincode, @JsonKey(name: 'is_default')  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _UserAddress():
return $default(_that.id,_that.label,_that.fullName,_that.phone,_that.line1,_that.line2,_that.city,_that.state,_that.pincode,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? label, @JsonKey(name: 'full_name')  String fullName,  String phone,  String line1,  String? line2,  String city,  String state,  String pincode, @JsonKey(name: 'is_default')  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that.id,_that.label,_that.fullName,_that.phone,_that.line1,_that.line2,_that.city,_that.state,_that.pincode,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAddress implements UserAddress {
  const _UserAddress({required this.id, this.label, @JsonKey(name: 'full_name') required this.fullName, required this.phone, required this.line1, this.line2, required this.city, required this.state, required this.pincode, @JsonKey(name: 'is_default') this.isDefault = false});
  factory _UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);

@override final  String id;
@override final  String? label;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String phone;
@override final  String line1;
@override final  String? line2;
@override final  String city;
@override final  String state;
@override final  String pincode;
@override@JsonKey(name: 'is_default') final  bool isDefault;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAddressCopyWith<_UserAddress> get copyWith => __$UserAddressCopyWithImpl<_UserAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.line1, line1) || other.line1 == line1)&&(identical(other.line2, line2) || other.line2 == line2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.pincode, pincode) || other.pincode == pincode)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,fullName,phone,line1,line2,city,state,pincode,isDefault);

@override
String toString() {
  return 'UserAddress(id: $id, label: $label, fullName: $fullName, phone: $phone, line1: $line1, line2: $line2, city: $city, state: $state, pincode: $pincode, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$UserAddressCopyWith<$Res> implements $UserAddressCopyWith<$Res> {
  factory _$UserAddressCopyWith(_UserAddress value, $Res Function(_UserAddress) _then) = __$UserAddressCopyWithImpl;
@override @useResult
$Res call({
 String id, String? label,@JsonKey(name: 'full_name') String fullName, String phone, String line1, String? line2, String city, String state, String pincode,@JsonKey(name: 'is_default') bool isDefault
});




}
/// @nodoc
class __$UserAddressCopyWithImpl<$Res>
    implements _$UserAddressCopyWith<$Res> {
  __$UserAddressCopyWithImpl(this._self, this._then);

  final _UserAddress _self;
  final $Res Function(_UserAddress) _then;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = freezed,Object? fullName = null,Object? phone = null,Object? line1 = null,Object? line2 = freezed,Object? city = null,Object? state = null,Object? pincode = null,Object? isDefault = null,}) {
  return _then(_UserAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,line1: null == line1 ? _self.line1 : line1 // ignore: cast_nullable_to_non_nullable
as String,line2: freezed == line2 ? _self.line2 : line2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,pincode: null == pincode ? _self.pincode : pincode // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AddressListResponse {

 List<UserAddress> get addresses;
/// Create a copy of AddressListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressListResponseCopyWith<AddressListResponse> get copyWith => _$AddressListResponseCopyWithImpl<AddressListResponse>(this as AddressListResponse, _$identity);

  /// Serializes this AddressListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressListResponse&&const DeepCollectionEquality().equals(other.addresses, addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(addresses));

@override
String toString() {
  return 'AddressListResponse(addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class $AddressListResponseCopyWith<$Res>  {
  factory $AddressListResponseCopyWith(AddressListResponse value, $Res Function(AddressListResponse) _then) = _$AddressListResponseCopyWithImpl;
@useResult
$Res call({
 List<UserAddress> addresses
});




}
/// @nodoc
class _$AddressListResponseCopyWithImpl<$Res>
    implements $AddressListResponseCopyWith<$Res> {
  _$AddressListResponseCopyWithImpl(this._self, this._then);

  final AddressListResponse _self;
  final $Res Function(AddressListResponse) _then;

/// Create a copy of AddressListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? addresses = null,}) {
  return _then(_self.copyWith(
addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<UserAddress>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddressListResponse].
extension AddressListResponsePatterns on AddressListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddressListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddressListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddressListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AddressListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddressListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AddressListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<UserAddress> addresses)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddressListResponse() when $default != null:
return $default(_that.addresses);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<UserAddress> addresses)  $default,) {final _that = this;
switch (_that) {
case _AddressListResponse():
return $default(_that.addresses);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<UserAddress> addresses)?  $default,) {final _that = this;
switch (_that) {
case _AddressListResponse() when $default != null:
return $default(_that.addresses);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddressListResponse implements AddressListResponse {
  const _AddressListResponse({required final  List<UserAddress> addresses}): _addresses = addresses;
  factory _AddressListResponse.fromJson(Map<String, dynamic> json) => _$AddressListResponseFromJson(json);

 final  List<UserAddress> _addresses;
@override List<UserAddress> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}


/// Create a copy of AddressListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressListResponseCopyWith<_AddressListResponse> get copyWith => __$AddressListResponseCopyWithImpl<_AddressListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressListResponse&&const DeepCollectionEquality().equals(other._addresses, _addresses));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_addresses));

@override
String toString() {
  return 'AddressListResponse(addresses: $addresses)';
}


}

/// @nodoc
abstract mixin class _$AddressListResponseCopyWith<$Res> implements $AddressListResponseCopyWith<$Res> {
  factory _$AddressListResponseCopyWith(_AddressListResponse value, $Res Function(_AddressListResponse) _then) = __$AddressListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<UserAddress> addresses
});




}
/// @nodoc
class __$AddressListResponseCopyWithImpl<$Res>
    implements _$AddressListResponseCopyWith<$Res> {
  __$AddressListResponseCopyWithImpl(this._self, this._then);

  final _AddressListResponse _self;
  final $Res Function(_AddressListResponse) _then;

/// Create a copy of AddressListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? addresses = null,}) {
  return _then(_AddressListResponse(
addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<UserAddress>,
  ));
}


}


/// @nodoc
mixin _$PincodeValidation {

 bool get serviceable; String? get city; String? get state;@JsonKey(name: 'estimated_delivery_days') int? get estimatedDeliveryDays;@JsonKey(name: 'pickup_available') bool get pickupAvailable;
/// Create a copy of PincodeValidation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PincodeValidationCopyWith<PincodeValidation> get copyWith => _$PincodeValidationCopyWithImpl<PincodeValidation>(this as PincodeValidation, _$identity);

  /// Serializes this PincodeValidation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PincodeValidation&&(identical(other.serviceable, serviceable) || other.serviceable == serviceable)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.estimatedDeliveryDays, estimatedDeliveryDays) || other.estimatedDeliveryDays == estimatedDeliveryDays)&&(identical(other.pickupAvailable, pickupAvailable) || other.pickupAvailable == pickupAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceable,city,state,estimatedDeliveryDays,pickupAvailable);

@override
String toString() {
  return 'PincodeValidation(serviceable: $serviceable, city: $city, state: $state, estimatedDeliveryDays: $estimatedDeliveryDays, pickupAvailable: $pickupAvailable)';
}


}

/// @nodoc
abstract mixin class $PincodeValidationCopyWith<$Res>  {
  factory $PincodeValidationCopyWith(PincodeValidation value, $Res Function(PincodeValidation) _then) = _$PincodeValidationCopyWithImpl;
@useResult
$Res call({
 bool serviceable, String? city, String? state,@JsonKey(name: 'estimated_delivery_days') int? estimatedDeliveryDays,@JsonKey(name: 'pickup_available') bool pickupAvailable
});




}
/// @nodoc
class _$PincodeValidationCopyWithImpl<$Res>
    implements $PincodeValidationCopyWith<$Res> {
  _$PincodeValidationCopyWithImpl(this._self, this._then);

  final PincodeValidation _self;
  final $Res Function(PincodeValidation) _then;

/// Create a copy of PincodeValidation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? serviceable = null,Object? city = freezed,Object? state = freezed,Object? estimatedDeliveryDays = freezed,Object? pickupAvailable = null,}) {
  return _then(_self.copyWith(
serviceable: null == serviceable ? _self.serviceable : serviceable // ignore: cast_nullable_to_non_nullable
as bool,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryDays: freezed == estimatedDeliveryDays ? _self.estimatedDeliveryDays : estimatedDeliveryDays // ignore: cast_nullable_to_non_nullable
as int?,pickupAvailable: null == pickupAvailable ? _self.pickupAvailable : pickupAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PincodeValidation].
extension PincodeValidationPatterns on PincodeValidation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PincodeValidation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PincodeValidation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PincodeValidation value)  $default,){
final _that = this;
switch (_that) {
case _PincodeValidation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PincodeValidation value)?  $default,){
final _that = this;
switch (_that) {
case _PincodeValidation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool serviceable,  String? city,  String? state, @JsonKey(name: 'estimated_delivery_days')  int? estimatedDeliveryDays, @JsonKey(name: 'pickup_available')  bool pickupAvailable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PincodeValidation() when $default != null:
return $default(_that.serviceable,_that.city,_that.state,_that.estimatedDeliveryDays,_that.pickupAvailable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool serviceable,  String? city,  String? state, @JsonKey(name: 'estimated_delivery_days')  int? estimatedDeliveryDays, @JsonKey(name: 'pickup_available')  bool pickupAvailable)  $default,) {final _that = this;
switch (_that) {
case _PincodeValidation():
return $default(_that.serviceable,_that.city,_that.state,_that.estimatedDeliveryDays,_that.pickupAvailable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool serviceable,  String? city,  String? state, @JsonKey(name: 'estimated_delivery_days')  int? estimatedDeliveryDays, @JsonKey(name: 'pickup_available')  bool pickupAvailable)?  $default,) {final _that = this;
switch (_that) {
case _PincodeValidation() when $default != null:
return $default(_that.serviceable,_that.city,_that.state,_that.estimatedDeliveryDays,_that.pickupAvailable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PincodeValidation implements PincodeValidation {
  const _PincodeValidation({required this.serviceable, this.city, this.state, @JsonKey(name: 'estimated_delivery_days') this.estimatedDeliveryDays, @JsonKey(name: 'pickup_available') this.pickupAvailable = false});
  factory _PincodeValidation.fromJson(Map<String, dynamic> json) => _$PincodeValidationFromJson(json);

@override final  bool serviceable;
@override final  String? city;
@override final  String? state;
@override@JsonKey(name: 'estimated_delivery_days') final  int? estimatedDeliveryDays;
@override@JsonKey(name: 'pickup_available') final  bool pickupAvailable;

/// Create a copy of PincodeValidation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PincodeValidationCopyWith<_PincodeValidation> get copyWith => __$PincodeValidationCopyWithImpl<_PincodeValidation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PincodeValidationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PincodeValidation&&(identical(other.serviceable, serviceable) || other.serviceable == serviceable)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.estimatedDeliveryDays, estimatedDeliveryDays) || other.estimatedDeliveryDays == estimatedDeliveryDays)&&(identical(other.pickupAvailable, pickupAvailable) || other.pickupAvailable == pickupAvailable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,serviceable,city,state,estimatedDeliveryDays,pickupAvailable);

@override
String toString() {
  return 'PincodeValidation(serviceable: $serviceable, city: $city, state: $state, estimatedDeliveryDays: $estimatedDeliveryDays, pickupAvailable: $pickupAvailable)';
}


}

/// @nodoc
abstract mixin class _$PincodeValidationCopyWith<$Res> implements $PincodeValidationCopyWith<$Res> {
  factory _$PincodeValidationCopyWith(_PincodeValidation value, $Res Function(_PincodeValidation) _then) = __$PincodeValidationCopyWithImpl;
@override @useResult
$Res call({
 bool serviceable, String? city, String? state,@JsonKey(name: 'estimated_delivery_days') int? estimatedDeliveryDays,@JsonKey(name: 'pickup_available') bool pickupAvailable
});




}
/// @nodoc
class __$PincodeValidationCopyWithImpl<$Res>
    implements _$PincodeValidationCopyWith<$Res> {
  __$PincodeValidationCopyWithImpl(this._self, this._then);

  final _PincodeValidation _self;
  final $Res Function(_PincodeValidation) _then;

/// Create a copy of PincodeValidation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? serviceable = null,Object? city = freezed,Object? state = freezed,Object? estimatedDeliveryDays = freezed,Object? pickupAvailable = null,}) {
  return _then(_PincodeValidation(
serviceable: null == serviceable ? _self.serviceable : serviceable // ignore: cast_nullable_to_non_nullable
as bool,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,estimatedDeliveryDays: freezed == estimatedDeliveryDays ? _self.estimatedDeliveryDays : estimatedDeliveryDays // ignore: cast_nullable_to_non_nullable
as int?,pickupAvailable: null == pickupAvailable ? _self.pickupAvailable : pickupAvailable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

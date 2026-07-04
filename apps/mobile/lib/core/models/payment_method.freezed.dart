// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethod {

 String get id; String get type;@JsonKey(name: 'display_label') String get displayLabel;@JsonKey(name: 'is_default') bool get isDefault;@JsonKey(name: 'is_autopay_enabled') bool get isAutopayEnabled;
/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodCopyWith<PaymentMethod> get copyWith => _$PaymentMethodCopyWithImpl<PaymentMethod>(this as PaymentMethod, _$identity);

  /// Serializes this PaymentMethod to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.displayLabel, displayLabel) || other.displayLabel == displayLabel)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isAutopayEnabled, isAutopayEnabled) || other.isAutopayEnabled == isAutopayEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,displayLabel,isDefault,isAutopayEnabled);

@override
String toString() {
  return 'PaymentMethod(id: $id, type: $type, displayLabel: $displayLabel, isDefault: $isDefault, isAutopayEnabled: $isAutopayEnabled)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodCopyWith<$Res>  {
  factory $PaymentMethodCopyWith(PaymentMethod value, $Res Function(PaymentMethod) _then) = _$PaymentMethodCopyWithImpl;
@useResult
$Res call({
 String id, String type,@JsonKey(name: 'display_label') String displayLabel,@JsonKey(name: 'is_default') bool isDefault,@JsonKey(name: 'is_autopay_enabled') bool isAutopayEnabled
});




}
/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._self, this._then);

  final PaymentMethod _self;
  final $Res Function(PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? displayLabel = null,Object? isDefault = null,Object? isAutopayEnabled = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,displayLabel: null == displayLabel ? _self.displayLabel : displayLabel // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isAutopayEnabled: null == isAutopayEnabled ? _self.isAutopayEnabled : isAutopayEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethod].
extension PaymentMethodPatterns on PaymentMethod {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethod value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethod value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethod value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'display_label')  String displayLabel, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'is_autopay_enabled')  bool isAutopayEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.id,_that.type,_that.displayLabel,_that.isDefault,_that.isAutopayEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type, @JsonKey(name: 'display_label')  String displayLabel, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'is_autopay_enabled')  bool isAutopayEnabled)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod():
return $default(_that.id,_that.type,_that.displayLabel,_that.isDefault,_that.isAutopayEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type, @JsonKey(name: 'display_label')  String displayLabel, @JsonKey(name: 'is_default')  bool isDefault, @JsonKey(name: 'is_autopay_enabled')  bool isAutopayEnabled)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethod() when $default != null:
return $default(_that.id,_that.type,_that.displayLabel,_that.isDefault,_that.isAutopayEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethod implements PaymentMethod {
  const _PaymentMethod({required this.id, required this.type, @JsonKey(name: 'display_label') required this.displayLabel, @JsonKey(name: 'is_default') required this.isDefault, @JsonKey(name: 'is_autopay_enabled') required this.isAutopayEnabled});
  factory _PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

@override final  String id;
@override final  String type;
@override@JsonKey(name: 'display_label') final  String displayLabel;
@override@JsonKey(name: 'is_default') final  bool isDefault;
@override@JsonKey(name: 'is_autopay_enabled') final  bool isAutopayEnabled;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodCopyWith<_PaymentMethod> get copyWith => __$PaymentMethodCopyWithImpl<_PaymentMethod>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethod&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.displayLabel, displayLabel) || other.displayLabel == displayLabel)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isAutopayEnabled, isAutopayEnabled) || other.isAutopayEnabled == isAutopayEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,displayLabel,isDefault,isAutopayEnabled);

@override
String toString() {
  return 'PaymentMethod(id: $id, type: $type, displayLabel: $displayLabel, isDefault: $isDefault, isAutopayEnabled: $isAutopayEnabled)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodCopyWith<$Res> implements $PaymentMethodCopyWith<$Res> {
  factory _$PaymentMethodCopyWith(_PaymentMethod value, $Res Function(_PaymentMethod) _then) = __$PaymentMethodCopyWithImpl;
@override @useResult
$Res call({
 String id, String type,@JsonKey(name: 'display_label') String displayLabel,@JsonKey(name: 'is_default') bool isDefault,@JsonKey(name: 'is_autopay_enabled') bool isAutopayEnabled
});




}
/// @nodoc
class __$PaymentMethodCopyWithImpl<$Res>
    implements _$PaymentMethodCopyWith<$Res> {
  __$PaymentMethodCopyWithImpl(this._self, this._then);

  final _PaymentMethod _self;
  final $Res Function(_PaymentMethod) _then;

/// Create a copy of PaymentMethod
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? displayLabel = null,Object? isDefault = null,Object? isAutopayEnabled = null,}) {
  return _then(_PaymentMethod(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,displayLabel: null == displayLabel ? _self.displayLabel : displayLabel // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isAutopayEnabled: null == isAutopayEnabled ? _self.isAutopayEnabled : isAutopayEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$PaymentMethodsResponse {

@JsonKey(name: 'payment_methods') List<PaymentMethod> get paymentMethods;
/// Create a copy of PaymentMethodsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodsResponseCopyWith<PaymentMethodsResponse> get copyWith => _$PaymentMethodsResponseCopyWithImpl<PaymentMethodsResponse>(this as PaymentMethodsResponse, _$identity);

  /// Serializes this PaymentMethodsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodsResponse&&const DeepCollectionEquality().equals(other.paymentMethods, paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(paymentMethods));

@override
String toString() {
  return 'PaymentMethodsResponse(paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodsResponseCopyWith<$Res>  {
  factory $PaymentMethodsResponseCopyWith(PaymentMethodsResponse value, $Res Function(PaymentMethodsResponse) _then) = _$PaymentMethodsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_methods') List<PaymentMethod> paymentMethods
});




}
/// @nodoc
class _$PaymentMethodsResponseCopyWithImpl<$Res>
    implements $PaymentMethodsResponseCopyWith<$Res> {
  _$PaymentMethodsResponseCopyWithImpl(this._self, this._then);

  final PaymentMethodsResponse _self;
  final $Res Function(PaymentMethodsResponse) _then;

/// Create a copy of PaymentMethodsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentMethods = null,}) {
  return _then(_self.copyWith(
paymentMethods: null == paymentMethods ? _self.paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodsResponse].
extension PaymentMethodsResponsePatterns on PaymentMethodsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodsResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_methods')  List<PaymentMethod> paymentMethods)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodsResponse() when $default != null:
return $default(_that.paymentMethods);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_methods')  List<PaymentMethod> paymentMethods)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodsResponse():
return $default(_that.paymentMethods);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_methods')  List<PaymentMethod> paymentMethods)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodsResponse() when $default != null:
return $default(_that.paymentMethods);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodsResponse implements PaymentMethodsResponse {
  const _PaymentMethodsResponse({@JsonKey(name: 'payment_methods') required final  List<PaymentMethod> paymentMethods}): _paymentMethods = paymentMethods;
  factory _PaymentMethodsResponse.fromJson(Map<String, dynamic> json) => _$PaymentMethodsResponseFromJson(json);

 final  List<PaymentMethod> _paymentMethods;
@override@JsonKey(name: 'payment_methods') List<PaymentMethod> get paymentMethods {
  if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentMethods);
}


/// Create a copy of PaymentMethodsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodsResponseCopyWith<_PaymentMethodsResponse> get copyWith => __$PaymentMethodsResponseCopyWithImpl<_PaymentMethodsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodsResponse&&const DeepCollectionEquality().equals(other._paymentMethods, _paymentMethods));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_paymentMethods));

@override
String toString() {
  return 'PaymentMethodsResponse(paymentMethods: $paymentMethods)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodsResponseCopyWith<$Res> implements $PaymentMethodsResponseCopyWith<$Res> {
  factory _$PaymentMethodsResponseCopyWith(_PaymentMethodsResponse value, $Res Function(_PaymentMethodsResponse) _then) = __$PaymentMethodsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_methods') List<PaymentMethod> paymentMethods
});




}
/// @nodoc
class __$PaymentMethodsResponseCopyWithImpl<$Res>
    implements _$PaymentMethodsResponseCopyWith<$Res> {
  __$PaymentMethodsResponseCopyWithImpl(this._self, this._then);

  final _PaymentMethodsResponse _self;
  final $Res Function(_PaymentMethodsResponse) _then;

/// Create a copy of PaymentMethodsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentMethods = null,}) {
  return _then(_PaymentMethodsResponse(
paymentMethods: null == paymentMethods ? _self._paymentMethods : paymentMethods // ignore: cast_nullable_to_non_nullable
as List<PaymentMethod>,
  ));
}


}


/// @nodoc
mixin _$VerifyUpiResponse {

 bool get verified;@JsonKey(name: 'display_label') String get displayLabel;
/// Create a copy of VerifyUpiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyUpiResponseCopyWith<VerifyUpiResponse> get copyWith => _$VerifyUpiResponseCopyWithImpl<VerifyUpiResponse>(this as VerifyUpiResponse, _$identity);

  /// Serializes this VerifyUpiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyUpiResponse&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.displayLabel, displayLabel) || other.displayLabel == displayLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verified,displayLabel);

@override
String toString() {
  return 'VerifyUpiResponse(verified: $verified, displayLabel: $displayLabel)';
}


}

/// @nodoc
abstract mixin class $VerifyUpiResponseCopyWith<$Res>  {
  factory $VerifyUpiResponseCopyWith(VerifyUpiResponse value, $Res Function(VerifyUpiResponse) _then) = _$VerifyUpiResponseCopyWithImpl;
@useResult
$Res call({
 bool verified,@JsonKey(name: 'display_label') String displayLabel
});




}
/// @nodoc
class _$VerifyUpiResponseCopyWithImpl<$Res>
    implements $VerifyUpiResponseCopyWith<$Res> {
  _$VerifyUpiResponseCopyWithImpl(this._self, this._then);

  final VerifyUpiResponse _self;
  final $Res Function(VerifyUpiResponse) _then;

/// Create a copy of VerifyUpiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? verified = null,Object? displayLabel = null,}) {
  return _then(_self.copyWith(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,displayLabel: null == displayLabel ? _self.displayLabel : displayLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VerifyUpiResponse].
extension VerifyUpiResponsePatterns on VerifyUpiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyUpiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyUpiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyUpiResponse value)  $default,){
final _that = this;
switch (_that) {
case _VerifyUpiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyUpiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyUpiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool verified, @JsonKey(name: 'display_label')  String displayLabel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyUpiResponse() when $default != null:
return $default(_that.verified,_that.displayLabel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool verified, @JsonKey(name: 'display_label')  String displayLabel)  $default,) {final _that = this;
switch (_that) {
case _VerifyUpiResponse():
return $default(_that.verified,_that.displayLabel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool verified, @JsonKey(name: 'display_label')  String displayLabel)?  $default,) {final _that = this;
switch (_that) {
case _VerifyUpiResponse() when $default != null:
return $default(_that.verified,_that.displayLabel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyUpiResponse implements VerifyUpiResponse {
  const _VerifyUpiResponse({required this.verified, @JsonKey(name: 'display_label') required this.displayLabel});
  factory _VerifyUpiResponse.fromJson(Map<String, dynamic> json) => _$VerifyUpiResponseFromJson(json);

@override final  bool verified;
@override@JsonKey(name: 'display_label') final  String displayLabel;

/// Create a copy of VerifyUpiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyUpiResponseCopyWith<_VerifyUpiResponse> get copyWith => __$VerifyUpiResponseCopyWithImpl<_VerifyUpiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyUpiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyUpiResponse&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.displayLabel, displayLabel) || other.displayLabel == displayLabel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,verified,displayLabel);

@override
String toString() {
  return 'VerifyUpiResponse(verified: $verified, displayLabel: $displayLabel)';
}


}

/// @nodoc
abstract mixin class _$VerifyUpiResponseCopyWith<$Res> implements $VerifyUpiResponseCopyWith<$Res> {
  factory _$VerifyUpiResponseCopyWith(_VerifyUpiResponse value, $Res Function(_VerifyUpiResponse) _then) = __$VerifyUpiResponseCopyWithImpl;
@override @useResult
$Res call({
 bool verified,@JsonKey(name: 'display_label') String displayLabel
});




}
/// @nodoc
class __$VerifyUpiResponseCopyWithImpl<$Res>
    implements _$VerifyUpiResponseCopyWith<$Res> {
  __$VerifyUpiResponseCopyWithImpl(this._self, this._then);

  final _VerifyUpiResponse _self;
  final $Res Function(_VerifyUpiResponse) _then;

/// Create a copy of VerifyUpiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? verified = null,Object? displayLabel = null,}) {
  return _then(_VerifyUpiResponse(
verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,displayLabel: null == displayLabel ? _self.displayLabel : displayLabel // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on

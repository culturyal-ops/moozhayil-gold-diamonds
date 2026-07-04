// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'referral.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReferralCodeResponse {

@JsonKey(name: 'referral_code') String get referralCode;@JsonKey(name: 'share_url') String get shareUrl;@JsonKey(name: 'reward_description') String get rewardDescription;@JsonKey(name: 'successful_referrals') int get successfulReferrals;@JsonKey(name: 'pending_referrals') int get pendingReferrals;
/// Create a copy of ReferralCodeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralCodeResponseCopyWith<ReferralCodeResponse> get copyWith => _$ReferralCodeResponseCopyWithImpl<ReferralCodeResponse>(this as ReferralCodeResponse, _$identity);

  /// Serializes this ReferralCodeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralCodeResponse&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.rewardDescription, rewardDescription) || other.rewardDescription == rewardDescription)&&(identical(other.successfulReferrals, successfulReferrals) || other.successfulReferrals == successfulReferrals)&&(identical(other.pendingReferrals, pendingReferrals) || other.pendingReferrals == pendingReferrals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referralCode,shareUrl,rewardDescription,successfulReferrals,pendingReferrals);

@override
String toString() {
  return 'ReferralCodeResponse(referralCode: $referralCode, shareUrl: $shareUrl, rewardDescription: $rewardDescription, successfulReferrals: $successfulReferrals, pendingReferrals: $pendingReferrals)';
}


}

/// @nodoc
abstract mixin class $ReferralCodeResponseCopyWith<$Res>  {
  factory $ReferralCodeResponseCopyWith(ReferralCodeResponse value, $Res Function(ReferralCodeResponse) _then) = _$ReferralCodeResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'referral_code') String referralCode,@JsonKey(name: 'share_url') String shareUrl,@JsonKey(name: 'reward_description') String rewardDescription,@JsonKey(name: 'successful_referrals') int successfulReferrals,@JsonKey(name: 'pending_referrals') int pendingReferrals
});




}
/// @nodoc
class _$ReferralCodeResponseCopyWithImpl<$Res>
    implements $ReferralCodeResponseCopyWith<$Res> {
  _$ReferralCodeResponseCopyWithImpl(this._self, this._then);

  final ReferralCodeResponse _self;
  final $Res Function(ReferralCodeResponse) _then;

/// Create a copy of ReferralCodeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? referralCode = null,Object? shareUrl = null,Object? rewardDescription = null,Object? successfulReferrals = null,Object? pendingReferrals = null,}) {
  return _then(_self.copyWith(
referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,shareUrl: null == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String,rewardDescription: null == rewardDescription ? _self.rewardDescription : rewardDescription // ignore: cast_nullable_to_non_nullable
as String,successfulReferrals: null == successfulReferrals ? _self.successfulReferrals : successfulReferrals // ignore: cast_nullable_to_non_nullable
as int,pendingReferrals: null == pendingReferrals ? _self.pendingReferrals : pendingReferrals // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralCodeResponse].
extension ReferralCodeResponsePatterns on ReferralCodeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralCodeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralCodeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralCodeResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReferralCodeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralCodeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralCodeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'referral_code')  String referralCode, @JsonKey(name: 'share_url')  String shareUrl, @JsonKey(name: 'reward_description')  String rewardDescription, @JsonKey(name: 'successful_referrals')  int successfulReferrals, @JsonKey(name: 'pending_referrals')  int pendingReferrals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralCodeResponse() when $default != null:
return $default(_that.referralCode,_that.shareUrl,_that.rewardDescription,_that.successfulReferrals,_that.pendingReferrals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'referral_code')  String referralCode, @JsonKey(name: 'share_url')  String shareUrl, @JsonKey(name: 'reward_description')  String rewardDescription, @JsonKey(name: 'successful_referrals')  int successfulReferrals, @JsonKey(name: 'pending_referrals')  int pendingReferrals)  $default,) {final _that = this;
switch (_that) {
case _ReferralCodeResponse():
return $default(_that.referralCode,_that.shareUrl,_that.rewardDescription,_that.successfulReferrals,_that.pendingReferrals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'referral_code')  String referralCode, @JsonKey(name: 'share_url')  String shareUrl, @JsonKey(name: 'reward_description')  String rewardDescription, @JsonKey(name: 'successful_referrals')  int successfulReferrals, @JsonKey(name: 'pending_referrals')  int pendingReferrals)?  $default,) {final _that = this;
switch (_that) {
case _ReferralCodeResponse() when $default != null:
return $default(_that.referralCode,_that.shareUrl,_that.rewardDescription,_that.successfulReferrals,_that.pendingReferrals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralCodeResponse implements ReferralCodeResponse {
  const _ReferralCodeResponse({@JsonKey(name: 'referral_code') required this.referralCode, @JsonKey(name: 'share_url') required this.shareUrl, @JsonKey(name: 'reward_description') required this.rewardDescription, @JsonKey(name: 'successful_referrals') required this.successfulReferrals, @JsonKey(name: 'pending_referrals') required this.pendingReferrals});
  factory _ReferralCodeResponse.fromJson(Map<String, dynamic> json) => _$ReferralCodeResponseFromJson(json);

@override@JsonKey(name: 'referral_code') final  String referralCode;
@override@JsonKey(name: 'share_url') final  String shareUrl;
@override@JsonKey(name: 'reward_description') final  String rewardDescription;
@override@JsonKey(name: 'successful_referrals') final  int successfulReferrals;
@override@JsonKey(name: 'pending_referrals') final  int pendingReferrals;

/// Create a copy of ReferralCodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralCodeResponseCopyWith<_ReferralCodeResponse> get copyWith => __$ReferralCodeResponseCopyWithImpl<_ReferralCodeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralCodeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralCodeResponse&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.shareUrl, shareUrl) || other.shareUrl == shareUrl)&&(identical(other.rewardDescription, rewardDescription) || other.rewardDescription == rewardDescription)&&(identical(other.successfulReferrals, successfulReferrals) || other.successfulReferrals == successfulReferrals)&&(identical(other.pendingReferrals, pendingReferrals) || other.pendingReferrals == pendingReferrals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,referralCode,shareUrl,rewardDescription,successfulReferrals,pendingReferrals);

@override
String toString() {
  return 'ReferralCodeResponse(referralCode: $referralCode, shareUrl: $shareUrl, rewardDescription: $rewardDescription, successfulReferrals: $successfulReferrals, pendingReferrals: $pendingReferrals)';
}


}

/// @nodoc
abstract mixin class _$ReferralCodeResponseCopyWith<$Res> implements $ReferralCodeResponseCopyWith<$Res> {
  factory _$ReferralCodeResponseCopyWith(_ReferralCodeResponse value, $Res Function(_ReferralCodeResponse) _then) = __$ReferralCodeResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'referral_code') String referralCode,@JsonKey(name: 'share_url') String shareUrl,@JsonKey(name: 'reward_description') String rewardDescription,@JsonKey(name: 'successful_referrals') int successfulReferrals,@JsonKey(name: 'pending_referrals') int pendingReferrals
});




}
/// @nodoc
class __$ReferralCodeResponseCopyWithImpl<$Res>
    implements _$ReferralCodeResponseCopyWith<$Res> {
  __$ReferralCodeResponseCopyWithImpl(this._self, this._then);

  final _ReferralCodeResponse _self;
  final $Res Function(_ReferralCodeResponse) _then;

/// Create a copy of ReferralCodeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? referralCode = null,Object? shareUrl = null,Object? rewardDescription = null,Object? successfulReferrals = null,Object? pendingReferrals = null,}) {
  return _then(_ReferralCodeResponse(
referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,shareUrl: null == shareUrl ? _self.shareUrl : shareUrl // ignore: cast_nullable_to_non_nullable
as String,rewardDescription: null == rewardDescription ? _self.rewardDescription : rewardDescription // ignore: cast_nullable_to_non_nullable
as String,successfulReferrals: null == successfulReferrals ? _self.successfulReferrals : successfulReferrals // ignore: cast_nullable_to_non_nullable
as int,pendingReferrals: null == pendingReferrals ? _self.pendingReferrals : pendingReferrals // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ApplyReferralResponse {

 bool get success; String get reward;
/// Create a copy of ApplyReferralResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplyReferralResponseCopyWith<ApplyReferralResponse> get copyWith => _$ApplyReferralResponseCopyWithImpl<ApplyReferralResponse>(this as ApplyReferralResponse, _$identity);

  /// Serializes this ApplyReferralResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplyReferralResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.reward, reward) || other.reward == reward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,reward);

@override
String toString() {
  return 'ApplyReferralResponse(success: $success, reward: $reward)';
}


}

/// @nodoc
abstract mixin class $ApplyReferralResponseCopyWith<$Res>  {
  factory $ApplyReferralResponseCopyWith(ApplyReferralResponse value, $Res Function(ApplyReferralResponse) _then) = _$ApplyReferralResponseCopyWithImpl;
@useResult
$Res call({
 bool success, String reward
});




}
/// @nodoc
class _$ApplyReferralResponseCopyWithImpl<$Res>
    implements $ApplyReferralResponseCopyWith<$Res> {
  _$ApplyReferralResponseCopyWithImpl(this._self, this._then);

  final ApplyReferralResponse _self;
  final $Res Function(ApplyReferralResponse) _then;

/// Create a copy of ApplyReferralResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? reward = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplyReferralResponse].
extension ApplyReferralResponsePatterns on ApplyReferralResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplyReferralResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplyReferralResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplyReferralResponse value)  $default,){
final _that = this;
switch (_that) {
case _ApplyReferralResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplyReferralResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ApplyReferralResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success,  String reward)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplyReferralResponse() when $default != null:
return $default(_that.success,_that.reward);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success,  String reward)  $default,) {final _that = this;
switch (_that) {
case _ApplyReferralResponse():
return $default(_that.success,_that.reward);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success,  String reward)?  $default,) {final _that = this;
switch (_that) {
case _ApplyReferralResponse() when $default != null:
return $default(_that.success,_that.reward);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplyReferralResponse implements ApplyReferralResponse {
  const _ApplyReferralResponse({required this.success, required this.reward});
  factory _ApplyReferralResponse.fromJson(Map<String, dynamic> json) => _$ApplyReferralResponseFromJson(json);

@override final  bool success;
@override final  String reward;

/// Create a copy of ApplyReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplyReferralResponseCopyWith<_ApplyReferralResponse> get copyWith => __$ApplyReferralResponseCopyWithImpl<_ApplyReferralResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplyReferralResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplyReferralResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.reward, reward) || other.reward == reward));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,reward);

@override
String toString() {
  return 'ApplyReferralResponse(success: $success, reward: $reward)';
}


}

/// @nodoc
abstract mixin class _$ApplyReferralResponseCopyWith<$Res> implements $ApplyReferralResponseCopyWith<$Res> {
  factory _$ApplyReferralResponseCopyWith(_ApplyReferralResponse value, $Res Function(_ApplyReferralResponse) _then) = __$ApplyReferralResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success, String reward
});




}
/// @nodoc
class __$ApplyReferralResponseCopyWithImpl<$Res>
    implements _$ApplyReferralResponseCopyWith<$Res> {
  __$ApplyReferralResponseCopyWithImpl(this._self, this._then);

  final _ApplyReferralResponse _self;
  final $Res Function(_ApplyReferralResponse) _then;

/// Create a copy of ApplyReferralResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? reward = null,}) {
  return _then(_ApplyReferralResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,reward: null == reward ? _self.reward : reward // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReferralHistoryItem {

 String get id;@JsonKey(name: 'referral_code') String get referralCode; String get status;@JsonKey(name: 'registered_at') String? get registeredAt;@JsonKey(name: 'rewarded_at') String? get rewardedAt;@JsonKey(name: 'reward_value_display') String? get rewardValueDisplay;
/// Create a copy of ReferralHistoryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralHistoryItemCopyWith<ReferralHistoryItem> get copyWith => _$ReferralHistoryItemCopyWithImpl<ReferralHistoryItem>(this as ReferralHistoryItem, _$identity);

  /// Serializes this ReferralHistoryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.rewardedAt, rewardedAt) || other.rewardedAt == rewardedAt)&&(identical(other.rewardValueDisplay, rewardValueDisplay) || other.rewardValueDisplay == rewardValueDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,referralCode,status,registeredAt,rewardedAt,rewardValueDisplay);

@override
String toString() {
  return 'ReferralHistoryItem(id: $id, referralCode: $referralCode, status: $status, registeredAt: $registeredAt, rewardedAt: $rewardedAt, rewardValueDisplay: $rewardValueDisplay)';
}


}

/// @nodoc
abstract mixin class $ReferralHistoryItemCopyWith<$Res>  {
  factory $ReferralHistoryItemCopyWith(ReferralHistoryItem value, $Res Function(ReferralHistoryItem) _then) = _$ReferralHistoryItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'referral_code') String referralCode, String status,@JsonKey(name: 'registered_at') String? registeredAt,@JsonKey(name: 'rewarded_at') String? rewardedAt,@JsonKey(name: 'reward_value_display') String? rewardValueDisplay
});




}
/// @nodoc
class _$ReferralHistoryItemCopyWithImpl<$Res>
    implements $ReferralHistoryItemCopyWith<$Res> {
  _$ReferralHistoryItemCopyWithImpl(this._self, this._then);

  final ReferralHistoryItem _self;
  final $Res Function(ReferralHistoryItem) _then;

/// Create a copy of ReferralHistoryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? referralCode = null,Object? status = null,Object? registeredAt = freezed,Object? rewardedAt = freezed,Object? rewardValueDisplay = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String?,rewardedAt: freezed == rewardedAt ? _self.rewardedAt : rewardedAt // ignore: cast_nullable_to_non_nullable
as String?,rewardValueDisplay: freezed == rewardValueDisplay ? _self.rewardValueDisplay : rewardValueDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralHistoryItem].
extension ReferralHistoryItemPatterns on ReferralHistoryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralHistoryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralHistoryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralHistoryItem value)  $default,){
final _that = this;
switch (_that) {
case _ReferralHistoryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralHistoryItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralHistoryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'referral_code')  String referralCode,  String status, @JsonKey(name: 'registered_at')  String? registeredAt, @JsonKey(name: 'rewarded_at')  String? rewardedAt, @JsonKey(name: 'reward_value_display')  String? rewardValueDisplay)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralHistoryItem() when $default != null:
return $default(_that.id,_that.referralCode,_that.status,_that.registeredAt,_that.rewardedAt,_that.rewardValueDisplay);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'referral_code')  String referralCode,  String status, @JsonKey(name: 'registered_at')  String? registeredAt, @JsonKey(name: 'rewarded_at')  String? rewardedAt, @JsonKey(name: 'reward_value_display')  String? rewardValueDisplay)  $default,) {final _that = this;
switch (_that) {
case _ReferralHistoryItem():
return $default(_that.id,_that.referralCode,_that.status,_that.registeredAt,_that.rewardedAt,_that.rewardValueDisplay);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'referral_code')  String referralCode,  String status, @JsonKey(name: 'registered_at')  String? registeredAt, @JsonKey(name: 'rewarded_at')  String? rewardedAt, @JsonKey(name: 'reward_value_display')  String? rewardValueDisplay)?  $default,) {final _that = this;
switch (_that) {
case _ReferralHistoryItem() when $default != null:
return $default(_that.id,_that.referralCode,_that.status,_that.registeredAt,_that.rewardedAt,_that.rewardValueDisplay);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralHistoryItem implements ReferralHistoryItem {
  const _ReferralHistoryItem({required this.id, @JsonKey(name: 'referral_code') required this.referralCode, required this.status, @JsonKey(name: 'registered_at') this.registeredAt, @JsonKey(name: 'rewarded_at') this.rewardedAt, @JsonKey(name: 'reward_value_display') this.rewardValueDisplay});
  factory _ReferralHistoryItem.fromJson(Map<String, dynamic> json) => _$ReferralHistoryItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'referral_code') final  String referralCode;
@override final  String status;
@override@JsonKey(name: 'registered_at') final  String? registeredAt;
@override@JsonKey(name: 'rewarded_at') final  String? rewardedAt;
@override@JsonKey(name: 'reward_value_display') final  String? rewardValueDisplay;

/// Create a copy of ReferralHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralHistoryItemCopyWith<_ReferralHistoryItem> get copyWith => __$ReferralHistoryItemCopyWithImpl<_ReferralHistoryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralHistoryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralHistoryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.rewardedAt, rewardedAt) || other.rewardedAt == rewardedAt)&&(identical(other.rewardValueDisplay, rewardValueDisplay) || other.rewardValueDisplay == rewardValueDisplay));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,referralCode,status,registeredAt,rewardedAt,rewardValueDisplay);

@override
String toString() {
  return 'ReferralHistoryItem(id: $id, referralCode: $referralCode, status: $status, registeredAt: $registeredAt, rewardedAt: $rewardedAt, rewardValueDisplay: $rewardValueDisplay)';
}


}

/// @nodoc
abstract mixin class _$ReferralHistoryItemCopyWith<$Res> implements $ReferralHistoryItemCopyWith<$Res> {
  factory _$ReferralHistoryItemCopyWith(_ReferralHistoryItem value, $Res Function(_ReferralHistoryItem) _then) = __$ReferralHistoryItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'referral_code') String referralCode, String status,@JsonKey(name: 'registered_at') String? registeredAt,@JsonKey(name: 'rewarded_at') String? rewardedAt,@JsonKey(name: 'reward_value_display') String? rewardValueDisplay
});




}
/// @nodoc
class __$ReferralHistoryItemCopyWithImpl<$Res>
    implements _$ReferralHistoryItemCopyWith<$Res> {
  __$ReferralHistoryItemCopyWithImpl(this._self, this._then);

  final _ReferralHistoryItem _self;
  final $Res Function(_ReferralHistoryItem) _then;

/// Create a copy of ReferralHistoryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? referralCode = null,Object? status = null,Object? registeredAt = freezed,Object? rewardedAt = freezed,Object? rewardValueDisplay = freezed,}) {
  return _then(_ReferralHistoryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String?,rewardedAt: freezed == rewardedAt ? _self.rewardedAt : rewardedAt // ignore: cast_nullable_to_non_nullable
as String?,rewardValueDisplay: freezed == rewardValueDisplay ? _self.rewardValueDisplay : rewardValueDisplay // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReferralHistoryResponse {

 List<ReferralHistoryItem> get referrals;
/// Create a copy of ReferralHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReferralHistoryResponseCopyWith<ReferralHistoryResponse> get copyWith => _$ReferralHistoryResponseCopyWithImpl<ReferralHistoryResponse>(this as ReferralHistoryResponse, _$identity);

  /// Serializes this ReferralHistoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReferralHistoryResponse&&const DeepCollectionEquality().equals(other.referrals, referrals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(referrals));

@override
String toString() {
  return 'ReferralHistoryResponse(referrals: $referrals)';
}


}

/// @nodoc
abstract mixin class $ReferralHistoryResponseCopyWith<$Res>  {
  factory $ReferralHistoryResponseCopyWith(ReferralHistoryResponse value, $Res Function(ReferralHistoryResponse) _then) = _$ReferralHistoryResponseCopyWithImpl;
@useResult
$Res call({
 List<ReferralHistoryItem> referrals
});




}
/// @nodoc
class _$ReferralHistoryResponseCopyWithImpl<$Res>
    implements $ReferralHistoryResponseCopyWith<$Res> {
  _$ReferralHistoryResponseCopyWithImpl(this._self, this._then);

  final ReferralHistoryResponse _self;
  final $Res Function(ReferralHistoryResponse) _then;

/// Create a copy of ReferralHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? referrals = null,}) {
  return _then(_self.copyWith(
referrals: null == referrals ? _self.referrals : referrals // ignore: cast_nullable_to_non_nullable
as List<ReferralHistoryItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReferralHistoryResponse].
extension ReferralHistoryResponsePatterns on ReferralHistoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReferralHistoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReferralHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReferralHistoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _ReferralHistoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReferralHistoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ReferralHistoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ReferralHistoryItem> referrals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReferralHistoryResponse() when $default != null:
return $default(_that.referrals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ReferralHistoryItem> referrals)  $default,) {final _that = this;
switch (_that) {
case _ReferralHistoryResponse():
return $default(_that.referrals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ReferralHistoryItem> referrals)?  $default,) {final _that = this;
switch (_that) {
case _ReferralHistoryResponse() when $default != null:
return $default(_that.referrals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReferralHistoryResponse implements ReferralHistoryResponse {
  const _ReferralHistoryResponse({required final  List<ReferralHistoryItem> referrals}): _referrals = referrals;
  factory _ReferralHistoryResponse.fromJson(Map<String, dynamic> json) => _$ReferralHistoryResponseFromJson(json);

 final  List<ReferralHistoryItem> _referrals;
@override List<ReferralHistoryItem> get referrals {
  if (_referrals is EqualUnmodifiableListView) return _referrals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_referrals);
}


/// Create a copy of ReferralHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReferralHistoryResponseCopyWith<_ReferralHistoryResponse> get copyWith => __$ReferralHistoryResponseCopyWithImpl<_ReferralHistoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReferralHistoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReferralHistoryResponse&&const DeepCollectionEquality().equals(other._referrals, _referrals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_referrals));

@override
String toString() {
  return 'ReferralHistoryResponse(referrals: $referrals)';
}


}

/// @nodoc
abstract mixin class _$ReferralHistoryResponseCopyWith<$Res> implements $ReferralHistoryResponseCopyWith<$Res> {
  factory _$ReferralHistoryResponseCopyWith(_ReferralHistoryResponse value, $Res Function(_ReferralHistoryResponse) _then) = __$ReferralHistoryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ReferralHistoryItem> referrals
});




}
/// @nodoc
class __$ReferralHistoryResponseCopyWithImpl<$Res>
    implements _$ReferralHistoryResponseCopyWith<$Res> {
  __$ReferralHistoryResponseCopyWithImpl(this._self, this._then);

  final _ReferralHistoryResponse _self;
  final $Res Function(_ReferralHistoryResponse) _then;

/// Create a copy of ReferralHistoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? referrals = null,}) {
  return _then(_ReferralHistoryResponse(
referrals: null == referrals ? _self._referrals : referrals // ignore: cast_nullable_to_non_nullable
as List<ReferralHistoryItem>,
  ));
}


}

// dart format on

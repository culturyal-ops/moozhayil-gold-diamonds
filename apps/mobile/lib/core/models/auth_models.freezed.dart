// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpChallenge {

@JsonKey(name: 'otp_session_id') String get otpSessionId;@JsonKey(name: 'expires_in_seconds') int get expiresInSeconds;@JsonKey(name: 'resend_allowed_after_seconds') int get resendAllowedAfterSeconds;
/// Create a copy of OtpChallenge
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpChallengeCopyWith<OtpChallenge> get copyWith => _$OtpChallengeCopyWithImpl<OtpChallenge>(this as OtpChallenge, _$identity);

  /// Serializes this OtpChallenge to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpChallenge&&(identical(other.otpSessionId, otpSessionId) || other.otpSessionId == otpSessionId)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.resendAllowedAfterSeconds, resendAllowedAfterSeconds) || other.resendAllowedAfterSeconds == resendAllowedAfterSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otpSessionId,expiresInSeconds,resendAllowedAfterSeconds);

@override
String toString() {
  return 'OtpChallenge(otpSessionId: $otpSessionId, expiresInSeconds: $expiresInSeconds, resendAllowedAfterSeconds: $resendAllowedAfterSeconds)';
}


}

/// @nodoc
abstract mixin class $OtpChallengeCopyWith<$Res>  {
  factory $OtpChallengeCopyWith(OtpChallenge value, $Res Function(OtpChallenge) _then) = _$OtpChallengeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'otp_session_id') String otpSessionId,@JsonKey(name: 'expires_in_seconds') int expiresInSeconds,@JsonKey(name: 'resend_allowed_after_seconds') int resendAllowedAfterSeconds
});




}
/// @nodoc
class _$OtpChallengeCopyWithImpl<$Res>
    implements $OtpChallengeCopyWith<$Res> {
  _$OtpChallengeCopyWithImpl(this._self, this._then);

  final OtpChallenge _self;
  final $Res Function(OtpChallenge) _then;

/// Create a copy of OtpChallenge
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? otpSessionId = null,Object? expiresInSeconds = null,Object? resendAllowedAfterSeconds = null,}) {
  return _then(_self.copyWith(
otpSessionId: null == otpSessionId ? _self.otpSessionId : otpSessionId // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,resendAllowedAfterSeconds: null == resendAllowedAfterSeconds ? _self.resendAllowedAfterSeconds : resendAllowedAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpChallenge].
extension OtpChallengePatterns on OtpChallenge {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpChallenge value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpChallenge() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpChallenge value)  $default,){
final _that = this;
switch (_that) {
case _OtpChallenge():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpChallenge value)?  $default,){
final _that = this;
switch (_that) {
case _OtpChallenge() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'otp_session_id')  String otpSessionId, @JsonKey(name: 'expires_in_seconds')  int expiresInSeconds, @JsonKey(name: 'resend_allowed_after_seconds')  int resendAllowedAfterSeconds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpChallenge() when $default != null:
return $default(_that.otpSessionId,_that.expiresInSeconds,_that.resendAllowedAfterSeconds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'otp_session_id')  String otpSessionId, @JsonKey(name: 'expires_in_seconds')  int expiresInSeconds, @JsonKey(name: 'resend_allowed_after_seconds')  int resendAllowedAfterSeconds)  $default,) {final _that = this;
switch (_that) {
case _OtpChallenge():
return $default(_that.otpSessionId,_that.expiresInSeconds,_that.resendAllowedAfterSeconds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'otp_session_id')  String otpSessionId, @JsonKey(name: 'expires_in_seconds')  int expiresInSeconds, @JsonKey(name: 'resend_allowed_after_seconds')  int resendAllowedAfterSeconds)?  $default,) {final _that = this;
switch (_that) {
case _OtpChallenge() when $default != null:
return $default(_that.otpSessionId,_that.expiresInSeconds,_that.resendAllowedAfterSeconds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpChallenge implements OtpChallenge {
  const _OtpChallenge({@JsonKey(name: 'otp_session_id') required this.otpSessionId, @JsonKey(name: 'expires_in_seconds') required this.expiresInSeconds, @JsonKey(name: 'resend_allowed_after_seconds') required this.resendAllowedAfterSeconds});
  factory _OtpChallenge.fromJson(Map<String, dynamic> json) => _$OtpChallengeFromJson(json);

@override@JsonKey(name: 'otp_session_id') final  String otpSessionId;
@override@JsonKey(name: 'expires_in_seconds') final  int expiresInSeconds;
@override@JsonKey(name: 'resend_allowed_after_seconds') final  int resendAllowedAfterSeconds;

/// Create a copy of OtpChallenge
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpChallengeCopyWith<_OtpChallenge> get copyWith => __$OtpChallengeCopyWithImpl<_OtpChallenge>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpChallengeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpChallenge&&(identical(other.otpSessionId, otpSessionId) || other.otpSessionId == otpSessionId)&&(identical(other.expiresInSeconds, expiresInSeconds) || other.expiresInSeconds == expiresInSeconds)&&(identical(other.resendAllowedAfterSeconds, resendAllowedAfterSeconds) || other.resendAllowedAfterSeconds == resendAllowedAfterSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,otpSessionId,expiresInSeconds,resendAllowedAfterSeconds);

@override
String toString() {
  return 'OtpChallenge(otpSessionId: $otpSessionId, expiresInSeconds: $expiresInSeconds, resendAllowedAfterSeconds: $resendAllowedAfterSeconds)';
}


}

/// @nodoc
abstract mixin class _$OtpChallengeCopyWith<$Res> implements $OtpChallengeCopyWith<$Res> {
  factory _$OtpChallengeCopyWith(_OtpChallenge value, $Res Function(_OtpChallenge) _then) = __$OtpChallengeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'otp_session_id') String otpSessionId,@JsonKey(name: 'expires_in_seconds') int expiresInSeconds,@JsonKey(name: 'resend_allowed_after_seconds') int resendAllowedAfterSeconds
});




}
/// @nodoc
class __$OtpChallengeCopyWithImpl<$Res>
    implements _$OtpChallengeCopyWith<$Res> {
  __$OtpChallengeCopyWithImpl(this._self, this._then);

  final _OtpChallenge _self;
  final $Res Function(_OtpChallenge) _then;

/// Create a copy of OtpChallenge
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? otpSessionId = null,Object? expiresInSeconds = null,Object? resendAllowedAfterSeconds = null,}) {
  return _then(_OtpChallenge(
otpSessionId: null == otpSessionId ? _self.otpSessionId : otpSessionId // ignore: cast_nullable_to_non_nullable
as String,expiresInSeconds: null == expiresInSeconds ? _self.expiresInSeconds : expiresInSeconds // ignore: cast_nullable_to_non_nullable
as int,resendAllowedAfterSeconds: null == resendAllowedAfterSeconds ? _self.resendAllowedAfterSeconds : resendAllowedAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$VerifyOtpResult {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int get expiresIn; User get user;
/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerifyOtpResultCopyWith<VerifyOtpResult> get copyWith => _$VerifyOtpResultCopyWithImpl<VerifyOtpResult>(this as VerifyOtpResult, _$identity);

  /// Serializes this VerifyOtpResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VerifyOtpResult&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,user);

@override
String toString() {
  return 'VerifyOtpResult(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, user: $user)';
}


}

/// @nodoc
abstract mixin class $VerifyOtpResultCopyWith<$Res>  {
  factory $VerifyOtpResultCopyWith(VerifyOtpResult value, $Res Function(VerifyOtpResult) _then) = _$VerifyOtpResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn, User user
});


$UserCopyWith<$Res> get user;

}
/// @nodoc
class _$VerifyOtpResultCopyWithImpl<$Res>
    implements $VerifyOtpResultCopyWith<$Res> {
  _$VerifyOtpResultCopyWithImpl(this._self, this._then);

  final VerifyOtpResult _self;
  final $Res Function(VerifyOtpResult) _then;

/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? user = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}
/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// Adds pattern-matching-related methods to [VerifyOtpResult].
extension VerifyOtpResultPatterns on VerifyOtpResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VerifyOtpResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VerifyOtpResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VerifyOtpResult value)  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VerifyOtpResult value)?  $default,){
final _that = this;
switch (_that) {
case _VerifyOtpResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn,  User user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VerifyOtpResult() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn,  User user)  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResult():
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int expiresIn,  User user)?  $default,) {final _that = this;
switch (_that) {
case _VerifyOtpResult() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.user);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VerifyOtpResult implements VerifyOtpResult {
  const _VerifyOtpResult({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'expires_in') required this.expiresIn, required this.user});
  factory _VerifyOtpResult.fromJson(Map<String, dynamic> json) => _$VerifyOtpResultFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override final  User user;

/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerifyOtpResultCopyWith<_VerifyOtpResult> get copyWith => __$VerifyOtpResultCopyWithImpl<_VerifyOtpResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerifyOtpResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VerifyOtpResult&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.user, user) || other.user == user));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,user);

@override
String toString() {
  return 'VerifyOtpResult(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, user: $user)';
}


}

/// @nodoc
abstract mixin class _$VerifyOtpResultCopyWith<$Res> implements $VerifyOtpResultCopyWith<$Res> {
  factory _$VerifyOtpResultCopyWith(_VerifyOtpResult value, $Res Function(_VerifyOtpResult) _then) = __$VerifyOtpResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int expiresIn, User user
});


@override $UserCopyWith<$Res> get user;

}
/// @nodoc
class __$VerifyOtpResultCopyWithImpl<$Res>
    implements _$VerifyOtpResultCopyWith<$Res> {
  __$VerifyOtpResultCopyWithImpl(this._self, this._then);

  final _VerifyOtpResult _self;
  final $Res Function(_VerifyOtpResult) _then;

/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = null,Object? user = null,}) {
  return _then(_VerifyOtpResult(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User,
  ));
}

/// Create a copy of VerifyOtpResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get user {
  
  return $UserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}
}


/// @nodoc
mixin _$RefreshTokenResult {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'expires_in') int get expiresIn;
/// Create a copy of RefreshTokenResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshTokenResultCopyWith<RefreshTokenResult> get copyWith => _$RefreshTokenResultCopyWithImpl<RefreshTokenResult>(this as RefreshTokenResult, _$identity);

  /// Serializes this RefreshTokenResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshTokenResult&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn);

@override
String toString() {
  return 'RefreshTokenResult(accessToken: $accessToken, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class $RefreshTokenResultCopyWith<$Res>  {
  factory $RefreshTokenResultCopyWith(RefreshTokenResult value, $Res Function(RefreshTokenResult) _then) = _$RefreshTokenResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'expires_in') int expiresIn
});




}
/// @nodoc
class _$RefreshTokenResultCopyWithImpl<$Res>
    implements $RefreshTokenResultCopyWith<$Res> {
  _$RefreshTokenResultCopyWithImpl(this._self, this._then);

  final RefreshTokenResult _self;
  final $Res Function(RefreshTokenResult) _then;

/// Create a copy of RefreshTokenResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? expiresIn = null,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshTokenResult].
extension RefreshTokenResultPatterns on RefreshTokenResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshTokenResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshTokenResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshTokenResult value)  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshTokenResult value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshTokenResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshTokenResult() when $default != null:
return $default(_that.accessToken,_that.expiresIn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn)  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResult():
return $default(_that.accessToken,_that.expiresIn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'expires_in')  int expiresIn)?  $default,) {final _that = this;
switch (_that) {
case _RefreshTokenResult() when $default != null:
return $default(_that.accessToken,_that.expiresIn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshTokenResult implements RefreshTokenResult {
  const _RefreshTokenResult({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'expires_in') required this.expiresIn});
  factory _RefreshTokenResult.fromJson(Map<String, dynamic> json) => _$RefreshTokenResultFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'expires_in') final  int expiresIn;

/// Create a copy of RefreshTokenResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshTokenResultCopyWith<_RefreshTokenResult> get copyWith => __$RefreshTokenResultCopyWithImpl<_RefreshTokenResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshTokenResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshTokenResult&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,expiresIn);

@override
String toString() {
  return 'RefreshTokenResult(accessToken: $accessToken, expiresIn: $expiresIn)';
}


}

/// @nodoc
abstract mixin class _$RefreshTokenResultCopyWith<$Res> implements $RefreshTokenResultCopyWith<$Res> {
  factory _$RefreshTokenResultCopyWith(_RefreshTokenResult value, $Res Function(_RefreshTokenResult) _then) = __$RefreshTokenResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'expires_in') int expiresIn
});




}
/// @nodoc
class __$RefreshTokenResultCopyWithImpl<$Res>
    implements _$RefreshTokenResultCopyWith<$Res> {
  __$RefreshTokenResultCopyWithImpl(this._self, this._then);

  final _RefreshTokenResult _self;
  final $Res Function(_RefreshTokenResult) _then;

/// Create a copy of RefreshTokenResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? expiresIn = null,}) {
  return _then(_RefreshTokenResult(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

 String get id; String get phone; String? get name; String? get email; String? get city;@JsonKey(name: 'kyc_status') String get kycStatus;@JsonKey(name: 'kyc_display') String? get kycDisplay;@JsonKey(name: 'member_since') String? get memberSince;@JsonKey(name: 'intent_tags') List<String> get intentTags;@JsonKey(name: 'active_goals_count') int get activeGoalsCount;@JsonKey(name: 'is_new_user') bool get isNewUser;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.kycStatus, kycStatus) || other.kycStatus == kycStatus)&&(identical(other.kycDisplay, kycDisplay) || other.kycDisplay == kycDisplay)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&const DeepCollectionEquality().equals(other.intentTags, intentTags)&&(identical(other.activeGoalsCount, activeGoalsCount) || other.activeGoalsCount == activeGoalsCount)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,name,email,city,kycStatus,kycDisplay,memberSince,const DeepCollectionEquality().hash(intentTags),activeGoalsCount,isNewUser);

@override
String toString() {
  return 'User(id: $id, phone: $phone, name: $name, email: $email, city: $city, kycStatus: $kycStatus, kycDisplay: $kycDisplay, memberSince: $memberSince, intentTags: $intentTags, activeGoalsCount: $activeGoalsCount, isNewUser: $isNewUser)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
 String id, String phone, String? name, String? email, String? city,@JsonKey(name: 'kyc_status') String kycStatus,@JsonKey(name: 'kyc_display') String? kycDisplay,@JsonKey(name: 'member_since') String? memberSince,@JsonKey(name: 'intent_tags') List<String> intentTags,@JsonKey(name: 'active_goals_count') int activeGoalsCount,@JsonKey(name: 'is_new_user') bool isNewUser
});




}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? city = freezed,Object? kycStatus = null,Object? kycDisplay = freezed,Object? memberSince = freezed,Object? intentTags = null,Object? activeGoalsCount = null,Object? isNewUser = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as String,kycDisplay: freezed == kycDisplay ? _self.kycDisplay : kycDisplay // ignore: cast_nullable_to_non_nullable
as String?,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,intentTags: null == intentTags ? _self.intentTags : intentTags // ignore: cast_nullable_to_non_nullable
as List<String>,activeGoalsCount: null == activeGoalsCount ? _self.activeGoalsCount : activeGoalsCount // ignore: cast_nullable_to_non_nullable
as int,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String phone,  String? name,  String? email,  String? city, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'kyc_display')  String? kycDisplay, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'intent_tags')  List<String> intentTags, @JsonKey(name: 'active_goals_count')  int activeGoalsCount, @JsonKey(name: 'is_new_user')  bool isNewUser)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.phone,_that.name,_that.email,_that.city,_that.kycStatus,_that.kycDisplay,_that.memberSince,_that.intentTags,_that.activeGoalsCount,_that.isNewUser);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String phone,  String? name,  String? email,  String? city, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'kyc_display')  String? kycDisplay, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'intent_tags')  List<String> intentTags, @JsonKey(name: 'active_goals_count')  int activeGoalsCount, @JsonKey(name: 'is_new_user')  bool isNewUser)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.phone,_that.name,_that.email,_that.city,_that.kycStatus,_that.kycDisplay,_that.memberSince,_that.intentTags,_that.activeGoalsCount,_that.isNewUser);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String phone,  String? name,  String? email,  String? city, @JsonKey(name: 'kyc_status')  String kycStatus, @JsonKey(name: 'kyc_display')  String? kycDisplay, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'intent_tags')  List<String> intentTags, @JsonKey(name: 'active_goals_count')  int activeGoalsCount, @JsonKey(name: 'is_new_user')  bool isNewUser)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.phone,_that.name,_that.email,_that.city,_that.kycStatus,_that.kycDisplay,_that.memberSince,_that.intentTags,_that.activeGoalsCount,_that.isNewUser);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
  const _User({required this.id, required this.phone, this.name, this.email, this.city, @JsonKey(name: 'kyc_status') required this.kycStatus, @JsonKey(name: 'kyc_display') this.kycDisplay, @JsonKey(name: 'member_since') this.memberSince, @JsonKey(name: 'intent_tags') final  List<String> intentTags = const <String>[], @JsonKey(name: 'active_goals_count') this.activeGoalsCount = 0, @JsonKey(name: 'is_new_user') this.isNewUser = false}): _intentTags = intentTags;
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override final  String id;
@override final  String phone;
@override final  String? name;
@override final  String? email;
@override final  String? city;
@override@JsonKey(name: 'kyc_status') final  String kycStatus;
@override@JsonKey(name: 'kyc_display') final  String? kycDisplay;
@override@JsonKey(name: 'member_since') final  String? memberSince;
 final  List<String> _intentTags;
@override@JsonKey(name: 'intent_tags') List<String> get intentTags {
  if (_intentTags is EqualUnmodifiableListView) return _intentTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intentTags);
}

@override@JsonKey(name: 'active_goals_count') final  int activeGoalsCount;
@override@JsonKey(name: 'is_new_user') final  bool isNewUser;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.city, city) || other.city == city)&&(identical(other.kycStatus, kycStatus) || other.kycStatus == kycStatus)&&(identical(other.kycDisplay, kycDisplay) || other.kycDisplay == kycDisplay)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&const DeepCollectionEquality().equals(other._intentTags, _intentTags)&&(identical(other.activeGoalsCount, activeGoalsCount) || other.activeGoalsCount == activeGoalsCount)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,phone,name,email,city,kycStatus,kycDisplay,memberSince,const DeepCollectionEquality().hash(_intentTags),activeGoalsCount,isNewUser);

@override
String toString() {
  return 'User(id: $id, phone: $phone, name: $name, email: $email, city: $city, kycStatus: $kycStatus, kycDisplay: $kycDisplay, memberSince: $memberSince, intentTags: $intentTags, activeGoalsCount: $activeGoalsCount, isNewUser: $isNewUser)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
 String id, String phone, String? name, String? email, String? city,@JsonKey(name: 'kyc_status') String kycStatus,@JsonKey(name: 'kyc_display') String? kycDisplay,@JsonKey(name: 'member_since') String? memberSince,@JsonKey(name: 'intent_tags') List<String> intentTags,@JsonKey(name: 'active_goals_count') int activeGoalsCount,@JsonKey(name: 'is_new_user') bool isNewUser
});




}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? phone = null,Object? name = freezed,Object? email = freezed,Object? city = freezed,Object? kycStatus = null,Object? kycDisplay = freezed,Object? memberSince = freezed,Object? intentTags = null,Object? activeGoalsCount = null,Object? isNewUser = null,}) {
  return _then(_User(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,kycStatus: null == kycStatus ? _self.kycStatus : kycStatus // ignore: cast_nullable_to_non_nullable
as String,kycDisplay: freezed == kycDisplay ? _self.kycDisplay : kycDisplay // ignore: cast_nullable_to_non_nullable
as String?,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,intentTags: null == intentTags ? _self._intentTags : intentTags // ignore: cast_nullable_to_non_nullable
as List<String>,activeGoalsCount: null == activeGoalsCount ? _self.activeGoalsCount : activeGoalsCount // ignore: cast_nullable_to_non_nullable
as int,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

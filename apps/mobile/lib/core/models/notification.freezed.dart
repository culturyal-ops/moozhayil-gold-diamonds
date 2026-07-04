// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotification {

 String get id; String get type; String get title; String get body;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'deep_link') String? get deepLink;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationCopyWith<AppNotification> get copyWith => _$AppNotificationCopyWithImpl<AppNotification>(this as AppNotification, _$identity);

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,isRead,deepLink,createdAt);

@override
String toString() {
  return 'AppNotification(id: $id, type: $type, title: $title, body: $body, isRead: $isRead, deepLink: $deepLink, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppNotificationCopyWith<$Res>  {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) _then) = _$AppNotificationCopyWithImpl;
@useResult
$Res call({
 String id, String type, String title, String body,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'deep_link') String? deepLink,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$AppNotificationCopyWithImpl<$Res>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._self, this._then);

  final AppNotification _self;
  final $Res Function(AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? isRead = null,Object? deepLink = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotification].
extension AppNotificationPatterns on AppNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotification value)  $default,){
final _that = this;
switch (_that) {
case _AppNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotification value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'deep_link')  String? deepLink, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.isRead,_that.deepLink,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'deep_link')  String? deepLink, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppNotification():
return $default(_that.id,_that.type,_that.title,_that.body,_that.isRead,_that.deepLink,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  String title,  String body, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'deep_link')  String? deepLink, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppNotification() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.body,_that.isRead,_that.deepLink,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotification implements AppNotification {
  const _AppNotification({required this.id, required this.type, required this.title, required this.body, @JsonKey(name: 'is_read') required this.isRead, @JsonKey(name: 'deep_link') this.deepLink, @JsonKey(name: 'created_at') required this.createdAt});
  factory _AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);

@override final  String id;
@override final  String type;
@override final  String title;
@override final  String body;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'deep_link') final  String? deepLink;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationCopyWith<_AppNotification> get copyWith => __$AppNotificationCopyWithImpl<_AppNotification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotification&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.deepLink, deepLink) || other.deepLink == deepLink)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,title,body,isRead,deepLink,createdAt);

@override
String toString() {
  return 'AppNotification(id: $id, type: $type, title: $title, body: $body, isRead: $isRead, deepLink: $deepLink, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$AppNotificationCopyWith(_AppNotification value, $Res Function(_AppNotification) _then) = __$AppNotificationCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, String title, String body,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'deep_link') String? deepLink,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$AppNotificationCopyWithImpl<$Res>
    implements _$AppNotificationCopyWith<$Res> {
  __$AppNotificationCopyWithImpl(this._self, this._then);

  final _AppNotification _self;
  final $Res Function(_AppNotification) _then;

/// Create a copy of AppNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? body = null,Object? isRead = null,Object? deepLink = freezed,Object? createdAt = null,}) {
  return _then(_AppNotification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,deepLink: freezed == deepLink ? _self.deepLink : deepLink // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NotificationsListResponse {

 List<AppNotification> get data;@JsonKey(name: 'unread_count') int get unreadCount;@JsonKey(name: 'next_cursor') String? get nextCursor;@JsonKey(name: 'has_more') bool get hasMore;
/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationsListResponseCopyWith<NotificationsListResponse> get copyWith => _$NotificationsListResponseCopyWithImpl<NotificationsListResponse>(this as NotificationsListResponse, _$identity);

  /// Serializes this NotificationsListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationsListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),unreadCount,nextCursor,hasMore);

@override
String toString() {
  return 'NotificationsListResponse(data: $data, unreadCount: $unreadCount, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class $NotificationsListResponseCopyWith<$Res>  {
  factory $NotificationsListResponseCopyWith(NotificationsListResponse value, $Res Function(NotificationsListResponse) _then) = _$NotificationsListResponseCopyWithImpl;
@useResult
$Res call({
 List<AppNotification> data,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class _$NotificationsListResponseCopyWithImpl<$Res>
    implements $NotificationsListResponseCopyWith<$Res> {
  _$NotificationsListResponseCopyWithImpl(this._self, this._then);

  final NotificationsListResponse _self;
  final $Res Function(NotificationsListResponse) _then;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? unreadCount = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationsListResponse].
extension NotificationsListResponsePatterns on NotificationsListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationsListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationsListResponse value)  $default,){
final _that = this;
switch (_that) {
case _NotificationsListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationsListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppNotification> data, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
return $default(_that.data,_that.unreadCount,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppNotification> data, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _NotificationsListResponse():
return $default(_that.data,_that.unreadCount,_that.nextCursor,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppNotification> data, @JsonKey(name: 'unread_count')  int unreadCount, @JsonKey(name: 'next_cursor')  String? nextCursor, @JsonKey(name: 'has_more')  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _NotificationsListResponse() when $default != null:
return $default(_that.data,_that.unreadCount,_that.nextCursor,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationsListResponse implements NotificationsListResponse {
  const _NotificationsListResponse({required final  List<AppNotification> data, @JsonKey(name: 'unread_count') required this.unreadCount, @JsonKey(name: 'next_cursor') this.nextCursor, @JsonKey(name: 'has_more') required this.hasMore}): _data = data;
  factory _NotificationsListResponse.fromJson(Map<String, dynamic> json) => _$NotificationsListResponseFromJson(json);

 final  List<AppNotification> _data;
@override List<AppNotification> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey(name: 'unread_count') final  int unreadCount;
@override@JsonKey(name: 'next_cursor') final  String? nextCursor;
@override@JsonKey(name: 'has_more') final  bool hasMore;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationsListResponseCopyWith<_NotificationsListResponse> get copyWith => __$NotificationsListResponseCopyWithImpl<_NotificationsListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationsListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationsListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.unreadCount, unreadCount) || other.unreadCount == unreadCount)&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),unreadCount,nextCursor,hasMore);

@override
String toString() {
  return 'NotificationsListResponse(data: $data, unreadCount: $unreadCount, nextCursor: $nextCursor, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$NotificationsListResponseCopyWith<$Res> implements $NotificationsListResponseCopyWith<$Res> {
  factory _$NotificationsListResponseCopyWith(_NotificationsListResponse value, $Res Function(_NotificationsListResponse) _then) = __$NotificationsListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<AppNotification> data,@JsonKey(name: 'unread_count') int unreadCount,@JsonKey(name: 'next_cursor') String? nextCursor,@JsonKey(name: 'has_more') bool hasMore
});




}
/// @nodoc
class __$NotificationsListResponseCopyWithImpl<$Res>
    implements _$NotificationsListResponseCopyWith<$Res> {
  __$NotificationsListResponseCopyWithImpl(this._self, this._then);

  final _NotificationsListResponse _self;
  final $Res Function(_NotificationsListResponse) _then;

/// Create a copy of NotificationsListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? unreadCount = null,Object? nextCursor = freezed,Object? hasMore = null,}) {
  return _then(_NotificationsListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AppNotification>,unreadCount: null == unreadCount ? _self.unreadCount : unreadCount // ignore: cast_nullable_to_non_nullable
as int,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String?,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$NotificationPreferences {

@JsonKey(name: 'push_enabled') bool get pushEnabled;@JsonKey(name: 'contributions_enabled') bool get contributionsEnabled;@JsonKey(name: 'milestones_enabled') bool get milestonesEnabled;@JsonKey(name: 'orders_enabled') bool get ordersEnabled;@JsonKey(name: 'kyc_enabled') bool get kycEnabled;@JsonKey(name: 'aura_enabled') bool get auraEnabled;@JsonKey(name: 'gold_rate_alert_enabled') bool get goldRateAlertEnabled;
/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPreferencesCopyWith<NotificationPreferences> get copyWith => _$NotificationPreferencesCopyWithImpl<NotificationPreferences>(this as NotificationPreferences, _$identity);

  /// Serializes this NotificationPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPreferences&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.contributionsEnabled, contributionsEnabled) || other.contributionsEnabled == contributionsEnabled)&&(identical(other.milestonesEnabled, milestonesEnabled) || other.milestonesEnabled == milestonesEnabled)&&(identical(other.ordersEnabled, ordersEnabled) || other.ordersEnabled == ordersEnabled)&&(identical(other.kycEnabled, kycEnabled) || other.kycEnabled == kycEnabled)&&(identical(other.auraEnabled, auraEnabled) || other.auraEnabled == auraEnabled)&&(identical(other.goldRateAlertEnabled, goldRateAlertEnabled) || other.goldRateAlertEnabled == goldRateAlertEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pushEnabled,contributionsEnabled,milestonesEnabled,ordersEnabled,kycEnabled,auraEnabled,goldRateAlertEnabled);

@override
String toString() {
  return 'NotificationPreferences(pushEnabled: $pushEnabled, contributionsEnabled: $contributionsEnabled, milestonesEnabled: $milestonesEnabled, ordersEnabled: $ordersEnabled, kycEnabled: $kycEnabled, auraEnabled: $auraEnabled, goldRateAlertEnabled: $goldRateAlertEnabled)';
}


}

/// @nodoc
abstract mixin class $NotificationPreferencesCopyWith<$Res>  {
  factory $NotificationPreferencesCopyWith(NotificationPreferences value, $Res Function(NotificationPreferences) _then) = _$NotificationPreferencesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'push_enabled') bool pushEnabled,@JsonKey(name: 'contributions_enabled') bool contributionsEnabled,@JsonKey(name: 'milestones_enabled') bool milestonesEnabled,@JsonKey(name: 'orders_enabled') bool ordersEnabled,@JsonKey(name: 'kyc_enabled') bool kycEnabled,@JsonKey(name: 'aura_enabled') bool auraEnabled,@JsonKey(name: 'gold_rate_alert_enabled') bool goldRateAlertEnabled
});




}
/// @nodoc
class _$NotificationPreferencesCopyWithImpl<$Res>
    implements $NotificationPreferencesCopyWith<$Res> {
  _$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final NotificationPreferences _self;
  final $Res Function(NotificationPreferences) _then;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pushEnabled = null,Object? contributionsEnabled = null,Object? milestonesEnabled = null,Object? ordersEnabled = null,Object? kycEnabled = null,Object? auraEnabled = null,Object? goldRateAlertEnabled = null,}) {
  return _then(_self.copyWith(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,contributionsEnabled: null == contributionsEnabled ? _self.contributionsEnabled : contributionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,milestonesEnabled: null == milestonesEnabled ? _self.milestonesEnabled : milestonesEnabled // ignore: cast_nullable_to_non_nullable
as bool,ordersEnabled: null == ordersEnabled ? _self.ordersEnabled : ordersEnabled // ignore: cast_nullable_to_non_nullable
as bool,kycEnabled: null == kycEnabled ? _self.kycEnabled : kycEnabled // ignore: cast_nullable_to_non_nullable
as bool,auraEnabled: null == auraEnabled ? _self.auraEnabled : auraEnabled // ignore: cast_nullable_to_non_nullable
as bool,goldRateAlertEnabled: null == goldRateAlertEnabled ? _self.goldRateAlertEnabled : goldRateAlertEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPreferences].
extension NotificationPreferencesPatterns on NotificationPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPreferences value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'push_enabled')  bool pushEnabled, @JsonKey(name: 'contributions_enabled')  bool contributionsEnabled, @JsonKey(name: 'milestones_enabled')  bool milestonesEnabled, @JsonKey(name: 'orders_enabled')  bool ordersEnabled, @JsonKey(name: 'kyc_enabled')  bool kycEnabled, @JsonKey(name: 'aura_enabled')  bool auraEnabled, @JsonKey(name: 'gold_rate_alert_enabled')  bool goldRateAlertEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
return $default(_that.pushEnabled,_that.contributionsEnabled,_that.milestonesEnabled,_that.ordersEnabled,_that.kycEnabled,_that.auraEnabled,_that.goldRateAlertEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'push_enabled')  bool pushEnabled, @JsonKey(name: 'contributions_enabled')  bool contributionsEnabled, @JsonKey(name: 'milestones_enabled')  bool milestonesEnabled, @JsonKey(name: 'orders_enabled')  bool ordersEnabled, @JsonKey(name: 'kyc_enabled')  bool kycEnabled, @JsonKey(name: 'aura_enabled')  bool auraEnabled, @JsonKey(name: 'gold_rate_alert_enabled')  bool goldRateAlertEnabled)  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferences():
return $default(_that.pushEnabled,_that.contributionsEnabled,_that.milestonesEnabled,_that.ordersEnabled,_that.kycEnabled,_that.auraEnabled,_that.goldRateAlertEnabled);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'push_enabled')  bool pushEnabled, @JsonKey(name: 'contributions_enabled')  bool contributionsEnabled, @JsonKey(name: 'milestones_enabled')  bool milestonesEnabled, @JsonKey(name: 'orders_enabled')  bool ordersEnabled, @JsonKey(name: 'kyc_enabled')  bool kycEnabled, @JsonKey(name: 'aura_enabled')  bool auraEnabled, @JsonKey(name: 'gold_rate_alert_enabled')  bool goldRateAlertEnabled)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPreferences() when $default != null:
return $default(_that.pushEnabled,_that.contributionsEnabled,_that.milestonesEnabled,_that.ordersEnabled,_that.kycEnabled,_that.auraEnabled,_that.goldRateAlertEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPreferences implements NotificationPreferences {
  const _NotificationPreferences({@JsonKey(name: 'push_enabled') required this.pushEnabled, @JsonKey(name: 'contributions_enabled') required this.contributionsEnabled, @JsonKey(name: 'milestones_enabled') required this.milestonesEnabled, @JsonKey(name: 'orders_enabled') required this.ordersEnabled, @JsonKey(name: 'kyc_enabled') required this.kycEnabled, @JsonKey(name: 'aura_enabled') required this.auraEnabled, @JsonKey(name: 'gold_rate_alert_enabled') required this.goldRateAlertEnabled});
  factory _NotificationPreferences.fromJson(Map<String, dynamic> json) => _$NotificationPreferencesFromJson(json);

@override@JsonKey(name: 'push_enabled') final  bool pushEnabled;
@override@JsonKey(name: 'contributions_enabled') final  bool contributionsEnabled;
@override@JsonKey(name: 'milestones_enabled') final  bool milestonesEnabled;
@override@JsonKey(name: 'orders_enabled') final  bool ordersEnabled;
@override@JsonKey(name: 'kyc_enabled') final  bool kycEnabled;
@override@JsonKey(name: 'aura_enabled') final  bool auraEnabled;
@override@JsonKey(name: 'gold_rate_alert_enabled') final  bool goldRateAlertEnabled;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPreferencesCopyWith<_NotificationPreferences> get copyWith => __$NotificationPreferencesCopyWithImpl<_NotificationPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPreferences&&(identical(other.pushEnabled, pushEnabled) || other.pushEnabled == pushEnabled)&&(identical(other.contributionsEnabled, contributionsEnabled) || other.contributionsEnabled == contributionsEnabled)&&(identical(other.milestonesEnabled, milestonesEnabled) || other.milestonesEnabled == milestonesEnabled)&&(identical(other.ordersEnabled, ordersEnabled) || other.ordersEnabled == ordersEnabled)&&(identical(other.kycEnabled, kycEnabled) || other.kycEnabled == kycEnabled)&&(identical(other.auraEnabled, auraEnabled) || other.auraEnabled == auraEnabled)&&(identical(other.goldRateAlertEnabled, goldRateAlertEnabled) || other.goldRateAlertEnabled == goldRateAlertEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pushEnabled,contributionsEnabled,milestonesEnabled,ordersEnabled,kycEnabled,auraEnabled,goldRateAlertEnabled);

@override
String toString() {
  return 'NotificationPreferences(pushEnabled: $pushEnabled, contributionsEnabled: $contributionsEnabled, milestonesEnabled: $milestonesEnabled, ordersEnabled: $ordersEnabled, kycEnabled: $kycEnabled, auraEnabled: $auraEnabled, goldRateAlertEnabled: $goldRateAlertEnabled)';
}


}

/// @nodoc
abstract mixin class _$NotificationPreferencesCopyWith<$Res> implements $NotificationPreferencesCopyWith<$Res> {
  factory _$NotificationPreferencesCopyWith(_NotificationPreferences value, $Res Function(_NotificationPreferences) _then) = __$NotificationPreferencesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'push_enabled') bool pushEnabled,@JsonKey(name: 'contributions_enabled') bool contributionsEnabled,@JsonKey(name: 'milestones_enabled') bool milestonesEnabled,@JsonKey(name: 'orders_enabled') bool ordersEnabled,@JsonKey(name: 'kyc_enabled') bool kycEnabled,@JsonKey(name: 'aura_enabled') bool auraEnabled,@JsonKey(name: 'gold_rate_alert_enabled') bool goldRateAlertEnabled
});




}
/// @nodoc
class __$NotificationPreferencesCopyWithImpl<$Res>
    implements _$NotificationPreferencesCopyWith<$Res> {
  __$NotificationPreferencesCopyWithImpl(this._self, this._then);

  final _NotificationPreferences _self;
  final $Res Function(_NotificationPreferences) _then;

/// Create a copy of NotificationPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pushEnabled = null,Object? contributionsEnabled = null,Object? milestonesEnabled = null,Object? ordersEnabled = null,Object? kycEnabled = null,Object? auraEnabled = null,Object? goldRateAlertEnabled = null,}) {
  return _then(_NotificationPreferences(
pushEnabled: null == pushEnabled ? _self.pushEnabled : pushEnabled // ignore: cast_nullable_to_non_nullable
as bool,contributionsEnabled: null == contributionsEnabled ? _self.contributionsEnabled : contributionsEnabled // ignore: cast_nullable_to_non_nullable
as bool,milestonesEnabled: null == milestonesEnabled ? _self.milestonesEnabled : milestonesEnabled // ignore: cast_nullable_to_non_nullable
as bool,ordersEnabled: null == ordersEnabled ? _self.ordersEnabled : ordersEnabled // ignore: cast_nullable_to_non_nullable
as bool,kycEnabled: null == kycEnabled ? _self.kycEnabled : kycEnabled // ignore: cast_nullable_to_non_nullable
as bool,auraEnabled: null == auraEnabled ? _self.auraEnabled : auraEnabled // ignore: cast_nullable_to_non_nullable
as bool,goldRateAlertEnabled: null == goldRateAlertEnabled ? _self.goldRateAlertEnabled : goldRateAlertEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MarkReadResponse {

 bool get success;
/// Create a copy of MarkReadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkReadResponseCopyWith<MarkReadResponse> get copyWith => _$MarkReadResponseCopyWithImpl<MarkReadResponse>(this as MarkReadResponse, _$identity);

  /// Serializes this MarkReadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkReadResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'MarkReadResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class $MarkReadResponseCopyWith<$Res>  {
  factory $MarkReadResponseCopyWith(MarkReadResponse value, $Res Function(MarkReadResponse) _then) = _$MarkReadResponseCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class _$MarkReadResponseCopyWithImpl<$Res>
    implements $MarkReadResponseCopyWith<$Res> {
  _$MarkReadResponseCopyWithImpl(this._self, this._then);

  final MarkReadResponse _self;
  final $Res Function(MarkReadResponse) _then;

/// Create a copy of MarkReadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkReadResponse].
extension MarkReadResponsePatterns on MarkReadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkReadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkReadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkReadResponse value)  $default,){
final _that = this;
switch (_that) {
case _MarkReadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkReadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MarkReadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkReadResponse() when $default != null:
return $default(_that.success);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success)  $default,) {final _that = this;
switch (_that) {
case _MarkReadResponse():
return $default(_that.success);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success)?  $default,) {final _that = this;
switch (_that) {
case _MarkReadResponse() when $default != null:
return $default(_that.success);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkReadResponse implements MarkReadResponse {
  const _MarkReadResponse({required this.success});
  factory _MarkReadResponse.fromJson(Map<String, dynamic> json) => _$MarkReadResponseFromJson(json);

@override final  bool success;

/// Create a copy of MarkReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkReadResponseCopyWith<_MarkReadResponse> get copyWith => __$MarkReadResponseCopyWithImpl<_MarkReadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkReadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkReadResponse&&(identical(other.success, success) || other.success == success));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'MarkReadResponse(success: $success)';
}


}

/// @nodoc
abstract mixin class _$MarkReadResponseCopyWith<$Res> implements $MarkReadResponseCopyWith<$Res> {
  factory _$MarkReadResponseCopyWith(_MarkReadResponse value, $Res Function(_MarkReadResponse) _then) = __$MarkReadResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$MarkReadResponseCopyWithImpl<$Res>
    implements _$MarkReadResponseCopyWith<$Res> {
  __$MarkReadResponseCopyWithImpl(this._self, this._then);

  final _MarkReadResponse _self;
  final $Res Function(_MarkReadResponse) _then;

/// Create a copy of MarkReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_MarkReadResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$MarkAllReadResponse {

 bool get success;@JsonKey(name: 'marked_count') int get markedCount;
/// Create a copy of MarkAllReadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkAllReadResponseCopyWith<MarkAllReadResponse> get copyWith => _$MarkAllReadResponseCopyWithImpl<MarkAllReadResponse>(this as MarkAllReadResponse, _$identity);

  /// Serializes this MarkAllReadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkAllReadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.markedCount, markedCount) || other.markedCount == markedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,markedCount);

@override
String toString() {
  return 'MarkAllReadResponse(success: $success, markedCount: $markedCount)';
}


}

/// @nodoc
abstract mixin class $MarkAllReadResponseCopyWith<$Res>  {
  factory $MarkAllReadResponseCopyWith(MarkAllReadResponse value, $Res Function(MarkAllReadResponse) _then) = _$MarkAllReadResponseCopyWithImpl;
@useResult
$Res call({
 bool success,@JsonKey(name: 'marked_count') int markedCount
});




}
/// @nodoc
class _$MarkAllReadResponseCopyWithImpl<$Res>
    implements $MarkAllReadResponseCopyWith<$Res> {
  _$MarkAllReadResponseCopyWithImpl(this._self, this._then);

  final MarkAllReadResponse _self;
  final $Res Function(MarkAllReadResponse) _then;

/// Create a copy of MarkAllReadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? markedCount = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,markedCount: null == markedCount ? _self.markedCount : markedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkAllReadResponse].
extension MarkAllReadResponsePatterns on MarkAllReadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkAllReadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkAllReadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkAllReadResponse value)  $default,){
final _that = this;
switch (_that) {
case _MarkAllReadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkAllReadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MarkAllReadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'marked_count')  int markedCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkAllReadResponse() when $default != null:
return $default(_that.success,_that.markedCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool success, @JsonKey(name: 'marked_count')  int markedCount)  $default,) {final _that = this;
switch (_that) {
case _MarkAllReadResponse():
return $default(_that.success,_that.markedCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool success, @JsonKey(name: 'marked_count')  int markedCount)?  $default,) {final _that = this;
switch (_that) {
case _MarkAllReadResponse() when $default != null:
return $default(_that.success,_that.markedCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkAllReadResponse implements MarkAllReadResponse {
  const _MarkAllReadResponse({required this.success, @JsonKey(name: 'marked_count') required this.markedCount});
  factory _MarkAllReadResponse.fromJson(Map<String, dynamic> json) => _$MarkAllReadResponseFromJson(json);

@override final  bool success;
@override@JsonKey(name: 'marked_count') final  int markedCount;

/// Create a copy of MarkAllReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkAllReadResponseCopyWith<_MarkAllReadResponse> get copyWith => __$MarkAllReadResponseCopyWithImpl<_MarkAllReadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkAllReadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkAllReadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.markedCount, markedCount) || other.markedCount == markedCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,markedCount);

@override
String toString() {
  return 'MarkAllReadResponse(success: $success, markedCount: $markedCount)';
}


}

/// @nodoc
abstract mixin class _$MarkAllReadResponseCopyWith<$Res> implements $MarkAllReadResponseCopyWith<$Res> {
  factory _$MarkAllReadResponseCopyWith(_MarkAllReadResponse value, $Res Function(_MarkAllReadResponse) _then) = __$MarkAllReadResponseCopyWithImpl;
@override @useResult
$Res call({
 bool success,@JsonKey(name: 'marked_count') int markedCount
});




}
/// @nodoc
class __$MarkAllReadResponseCopyWithImpl<$Res>
    implements _$MarkAllReadResponseCopyWith<$Res> {
  __$MarkAllReadResponseCopyWithImpl(this._self, this._then);

  final _MarkAllReadResponse _self;
  final $Res Function(_MarkAllReadResponse) _then;

/// Create a copy of MarkAllReadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? markedCount = null,}) {
  return _then(_MarkAllReadResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,markedCount: null == markedCount ? _self.markedCount : markedCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) =>
    _AppNotification(
      id: json['id'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
      body: json['body'] as String,
      isRead: json['is_read'] as bool,
      deepLink: json['deep_link'] as String?,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$AppNotificationToJson(_AppNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'body': instance.body,
      'is_read': instance.isRead,
      'deep_link': instance.deepLink,
      'created_at': instance.createdAt,
    };

_NotificationsListResponse _$NotificationsListResponseFromJson(
  Map<String, dynamic> json,
) => _NotificationsListResponse(
  data: (json['data'] as List<dynamic>)
      .map((e) => AppNotification.fromJson(e as Map<String, dynamic>))
      .toList(),
  unreadCount: (json['unread_count'] as num).toInt(),
  nextCursor: json['next_cursor'] as String?,
  hasMore: json['has_more'] as bool,
);

Map<String, dynamic> _$NotificationsListResponseToJson(
  _NotificationsListResponse instance,
) => <String, dynamic>{
  'data': instance.data,
  'unread_count': instance.unreadCount,
  'next_cursor': instance.nextCursor,
  'has_more': instance.hasMore,
};

_NotificationPreferences _$NotificationPreferencesFromJson(
  Map<String, dynamic> json,
) => _NotificationPreferences(
  pushEnabled: json['push_enabled'] as bool,
  contributionsEnabled: json['contributions_enabled'] as bool,
  milestonesEnabled: json['milestones_enabled'] as bool,
  ordersEnabled: json['orders_enabled'] as bool,
  kycEnabled: json['kyc_enabled'] as bool,
  auraEnabled: json['aura_enabled'] as bool,
  goldRateAlertEnabled: json['gold_rate_alert_enabled'] as bool,
);

Map<String, dynamic> _$NotificationPreferencesToJson(
  _NotificationPreferences instance,
) => <String, dynamic>{
  'push_enabled': instance.pushEnabled,
  'contributions_enabled': instance.contributionsEnabled,
  'milestones_enabled': instance.milestonesEnabled,
  'orders_enabled': instance.ordersEnabled,
  'kyc_enabled': instance.kycEnabled,
  'aura_enabled': instance.auraEnabled,
  'gold_rate_alert_enabled': instance.goldRateAlertEnabled,
};

_MarkReadResponse _$MarkReadResponseFromJson(Map<String, dynamic> json) =>
    _MarkReadResponse(success: json['success'] as bool);

Map<String, dynamic> _$MarkReadResponseToJson(_MarkReadResponse instance) =>
    <String, dynamic>{'success': instance.success};

_MarkAllReadResponse _$MarkAllReadResponseFromJson(Map<String, dynamic> json) =>
    _MarkAllReadResponse(
      success: json['success'] as bool,
      markedCount: (json['marked_count'] as num).toInt(),
    );

Map<String, dynamic> _$MarkAllReadResponseToJson(
  _MarkAllReadResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'marked_count': instance.markedCount,
};

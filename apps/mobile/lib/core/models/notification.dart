// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required String type,
    required String title,
    required String body,
    @JsonKey(name: 'is_read') required bool isRead,
    @JsonKey(name: 'deep_link') String? deepLink,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);
}

@freezed
abstract class NotificationsListResponse with _$NotificationsListResponse {
  const factory NotificationsListResponse({
    required List<AppNotification> data,
    @JsonKey(name: 'unread_count') required int unreadCount,
    @JsonKey(name: 'next_cursor') String? nextCursor,
    @JsonKey(name: 'has_more') required bool hasMore,
  }) = _NotificationsListResponse;

  factory NotificationsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsListResponseFromJson(json);
}

@freezed
abstract class NotificationPreferences with _$NotificationPreferences {
  const factory NotificationPreferences({
    @JsonKey(name: 'push_enabled') required bool pushEnabled,
    @JsonKey(name: 'contributions_enabled') required bool contributionsEnabled,
    @JsonKey(name: 'milestones_enabled') required bool milestonesEnabled,
    @JsonKey(name: 'orders_enabled') required bool ordersEnabled,
    @JsonKey(name: 'kyc_enabled') required bool kycEnabled,
    @JsonKey(name: 'aura_enabled') required bool auraEnabled,
    @JsonKey(name: 'gold_rate_alert_enabled')
    required bool goldRateAlertEnabled,
  }) = _NotificationPreferences;

  factory NotificationPreferences.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferencesFromJson(json);
}

@freezed
abstract class MarkReadResponse with _$MarkReadResponse {
  const factory MarkReadResponse({required bool success}) = _MarkReadResponse;

  factory MarkReadResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkReadResponseFromJson(json);
}

@freezed
abstract class MarkAllReadResponse with _$MarkAllReadResponse {
  const factory MarkAllReadResponse({
    required bool success,
    @JsonKey(name: 'marked_count') required int markedCount,
  }) = _MarkAllReadResponse;

  factory MarkAllReadResponse.fromJson(Map<String, dynamic> json) =>
      _$MarkAllReadResponseFromJson(json);
}

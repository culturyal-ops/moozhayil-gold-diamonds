// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'referral.freezed.dart';
part 'referral.g.dart';

@freezed
abstract class ReferralCodeResponse with _$ReferralCodeResponse {
  const factory ReferralCodeResponse({
    @JsonKey(name: 'referral_code') required String referralCode,
    @JsonKey(name: 'share_url') required String shareUrl,
    @JsonKey(name: 'reward_description') required String rewardDescription,
    @JsonKey(name: 'successful_referrals') required int successfulReferrals,
    @JsonKey(name: 'pending_referrals') required int pendingReferrals,
  }) = _ReferralCodeResponse;

  factory ReferralCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralCodeResponseFromJson(json);
}

@freezed
abstract class ApplyReferralResponse with _$ApplyReferralResponse {
  const factory ApplyReferralResponse({
    required bool success,
    required String reward,
  }) = _ApplyReferralResponse;

  factory ApplyReferralResponse.fromJson(Map<String, dynamic> json) =>
      _$ApplyReferralResponseFromJson(json);
}

@freezed
abstract class ReferralHistoryItem with _$ReferralHistoryItem {
  const factory ReferralHistoryItem({
    required String id,
    @JsonKey(name: 'referral_code') required String referralCode,
    required String status,
    @JsonKey(name: 'registered_at') String? registeredAt,
    @JsonKey(name: 'rewarded_at') String? rewardedAt,
    @JsonKey(name: 'reward_value_display') String? rewardValueDisplay,
  }) = _ReferralHistoryItem;

  factory ReferralHistoryItem.fromJson(Map<String, dynamic> json) =>
      _$ReferralHistoryItemFromJson(json);
}

@freezed
abstract class ReferralHistoryResponse with _$ReferralHistoryResponse {
  const factory ReferralHistoryResponse({
    required List<ReferralHistoryItem> referrals,
  }) = _ReferralHistoryResponse;

  factory ReferralHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$ReferralHistoryResponseFromJson(json);
}

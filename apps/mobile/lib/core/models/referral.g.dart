// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'referral.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReferralCodeResponse _$ReferralCodeResponseFromJson(
  Map<String, dynamic> json,
) => _ReferralCodeResponse(
  referralCode: json['referral_code'] as String,
  shareUrl: json['share_url'] as String,
  rewardDescription: json['reward_description'] as String,
  successfulReferrals: (json['successful_referrals'] as num).toInt(),
  pendingReferrals: (json['pending_referrals'] as num).toInt(),
);

Map<String, dynamic> _$ReferralCodeResponseToJson(
  _ReferralCodeResponse instance,
) => <String, dynamic>{
  'referral_code': instance.referralCode,
  'share_url': instance.shareUrl,
  'reward_description': instance.rewardDescription,
  'successful_referrals': instance.successfulReferrals,
  'pending_referrals': instance.pendingReferrals,
};

_ApplyReferralResponse _$ApplyReferralResponseFromJson(
  Map<String, dynamic> json,
) => _ApplyReferralResponse(
  success: json['success'] as bool,
  reward: json['reward'] as String,
);

Map<String, dynamic> _$ApplyReferralResponseToJson(
  _ApplyReferralResponse instance,
) => <String, dynamic>{'success': instance.success, 'reward': instance.reward};

_ReferralHistoryItem _$ReferralHistoryItemFromJson(Map<String, dynamic> json) =>
    _ReferralHistoryItem(
      id: json['id'] as String,
      referralCode: json['referral_code'] as String,
      status: json['status'] as String,
      registeredAt: json['registered_at'] as String?,
      rewardedAt: json['rewarded_at'] as String?,
      rewardValueDisplay: json['reward_value_display'] as String?,
    );

Map<String, dynamic> _$ReferralHistoryItemToJson(
  _ReferralHistoryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'referral_code': instance.referralCode,
  'status': instance.status,
  'registered_at': instance.registeredAt,
  'rewarded_at': instance.rewardedAt,
  'reward_value_display': instance.rewardValueDisplay,
};

_ReferralHistoryResponse _$ReferralHistoryResponseFromJson(
  Map<String, dynamic> json,
) => _ReferralHistoryResponse(
  referrals: (json['referrals'] as List<dynamic>)
      .map((e) => ReferralHistoryItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ReferralHistoryResponseToJson(
  _ReferralHistoryResponse instance,
) => <String, dynamic>{'referrals': instance.referrals};

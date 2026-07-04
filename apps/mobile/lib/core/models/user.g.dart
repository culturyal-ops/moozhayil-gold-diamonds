// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  phone: json['phone'] as String,
  name: json['name'] as String?,
  email: json['email'] as String?,
  city: json['city'] as String?,
  kycStatus: json['kyc_status'] as String,
  kycDisplay: json['kyc_display'] as String?,
  memberSince: json['member_since'] as String?,
  intentTags:
      (json['intent_tags'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  activeGoalsCount: (json['active_goals_count'] as num?)?.toInt() ?? 0,
  isNewUser: json['is_new_user'] as bool? ?? false,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'phone': instance.phone,
  'name': instance.name,
  'email': instance.email,
  'city': instance.city,
  'kyc_status': instance.kycStatus,
  'kyc_display': instance.kycDisplay,
  'member_since': instance.memberSince,
  'intent_tags': instance.intentTags,
  'active_goals_count': instance.activeGoalsCount,
  'is_new_user': instance.isNewUser,
};

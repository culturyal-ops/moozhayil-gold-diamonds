// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String phone,
    String? name,
    String? email,
    String? city,
    @JsonKey(name: 'kyc_status') required String kycStatus,
    @JsonKey(name: 'kyc_display') String? kycDisplay,
    @JsonKey(name: 'member_since') String? memberSince,
    @JsonKey(name: 'intent_tags') @Default(<String>[]) List<String> intentTags,
    @JsonKey(name: 'active_goals_count') @Default(0) int activeGoalsCount,
    @JsonKey(name: 'is_new_user') @Default(false) bool isNewUser,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

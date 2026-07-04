// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

@freezed
abstract class OtpChallenge with _$OtpChallenge {
  const factory OtpChallenge({
    @JsonKey(name: 'otp_session_id') required String otpSessionId,
    @JsonKey(name: 'expires_in_seconds') required int expiresInSeconds,
    @JsonKey(name: 'resend_allowed_after_seconds')
    required int resendAllowedAfterSeconds,
  }) = _OtpChallenge;

  factory OtpChallenge.fromJson(Map<String, dynamic> json) =>
      _$OtpChallengeFromJson(json);
}

@freezed
abstract class VerifyOtpResult with _$VerifyOtpResult {
  const factory VerifyOtpResult({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    required User user,
  }) = _VerifyOtpResult;

  factory VerifyOtpResult.fromJson(Map<String, dynamic> json) =>
      _$VerifyOtpResultFromJson(json);
}

@freezed
abstract class RefreshTokenResult with _$RefreshTokenResult {
  const factory RefreshTokenResult({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
  }) = _RefreshTokenResult;

  factory RefreshTokenResult.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResultFromJson(json);
}

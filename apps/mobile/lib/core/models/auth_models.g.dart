// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpChallenge _$OtpChallengeFromJson(Map<String, dynamic> json) =>
    _OtpChallenge(
      otpSessionId: json['otp_session_id'] as String,
      expiresInSeconds: (json['expires_in_seconds'] as num).toInt(),
      resendAllowedAfterSeconds: (json['resend_allowed_after_seconds'] as num)
          .toInt(),
    );

Map<String, dynamic> _$OtpChallengeToJson(_OtpChallenge instance) =>
    <String, dynamic>{
      'otp_session_id': instance.otpSessionId,
      'expires_in_seconds': instance.expiresInSeconds,
      'resend_allowed_after_seconds': instance.resendAllowedAfterSeconds,
    };

_VerifyOtpResult _$VerifyOtpResultFromJson(Map<String, dynamic> json) =>
    _VerifyOtpResult(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VerifyOtpResultToJson(_VerifyOtpResult instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'user': instance.user,
    };

_RefreshTokenResult _$RefreshTokenResultFromJson(Map<String, dynamic> json) =>
    _RefreshTokenResult(
      accessToken: json['access_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
    );

Map<String, dynamic> _$RefreshTokenResultToJson(_RefreshTokenResult instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
    };

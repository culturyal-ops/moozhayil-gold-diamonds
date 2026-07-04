// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_status.freezed.dart';
part 'kyc_status.g.dart';

@freezed
abstract class KycStatusResponse with _$KycStatusResponse {
  const factory KycStatusResponse({
    @JsonKey(name: 'kyc_status') required String kycStatus,
    @JsonKey(name: 'aadhaar_verified') @Default(false) bool aadhaarVerified,
    @JsonKey(name: 'pan_verified') @Default(false) bool panVerified,
    @JsonKey(name: 'selfie_verified') @Default(false) bool selfieVerified,
    @JsonKey(name: 'submitted_at') String? submittedAt,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'resubmission_allowed_at') String? resubmissionAllowedAt,
  }) = _KycStatusResponse;

  factory KycStatusResponse.fromJson(Map<String, dynamic> json) =>
      _$KycStatusResponseFromJson(json);
}

@freezed
abstract class AadhaarOtpSession with _$AadhaarOtpSession {
  const factory AadhaarOtpSession({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'expires_in_seconds') required int expiresInSeconds,
  }) = _AadhaarOtpSession;

  factory AadhaarOtpSession.fromJson(Map<String, dynamic> json) =>
      _$AadhaarOtpSessionFromJson(json);
}

@freezed
abstract class KycSubmitResponse with _$KycSubmitResponse {
  const factory KycSubmitResponse({
    @JsonKey(name: 'kyc_status') required String kycStatus,
    @JsonKey(name: 'estimated_completion') required String estimatedCompletion,
  }) = _KycSubmitResponse;

  factory KycSubmitResponse.fromJson(Map<String, dynamic> json) =>
      _$KycSubmitResponseFromJson(json);
}

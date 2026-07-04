// ignore_for_file: prefer_initializing_formals

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/auth_models.dart';
import '../models/user.dart';
import 'api_service.dart';
import 'storage_service.dart';

part 'auth_service.g.dart';

class AuthService {
  const AuthService({
    required ApiService apiService,
    required StorageService storageService,
  }) : _apiService = apiService,
       _storageService = storageService;

  final ApiService _apiService;
  final StorageService _storageService;

  Future<OtpChallenge> sendOtp(String phone) async {
    try {
      final response = await _apiService.client.post<Map<String, dynamic>>(
        '/auth/send-otp',
        data: {'phone': phone},
      );
      return OtpChallenge.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<VerifyOtpResult> verifyOtp({
    required String otpSessionId,
    required String otp,
  }) async {
    try {
      final response = await _apiService.client.post<Map<String, dynamic>>(
        '/auth/verify-otp',
        data: {'otp_session_id': otpSessionId, 'otp': otp},
      );
      final result = VerifyOtpResult.fromJson(response.data!);
      await _storageService.saveTokens(
        accessToken: result.accessToken,
        refreshToken: result.refreshToken,
      );
      return result;
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<User> me() async {
    try {
      final response = await _apiService.client.get<Map<String, dynamic>>(
        '/user/me',
      );
      return User.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<User> updateMe({String? name, String? email, String? city}) async {
    try {
      final data = <String, dynamic>{};
      if (name != null) {
        data['name'] = name;
      }
      if (email != null) {
        data['email'] = email;
      }
      if (city != null) {
        data['city'] = city;
      }

      final response = await _apiService.client.patch<Map<String, dynamic>>(
        '/user/me',
        data: data,
      );
      return User.fromJson(response.data!);
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<List<String>> saveIntent(List<String> intents) async {
    try {
      final response = await _apiService.client.post<Map<String, dynamic>>(
        '/user/intent',
        data: {'intents': intents},
      );
      final result = response.data!['intents'];
      if (result is List) {
        return result.whereType<String>().toList(growable: false);
      }
      return intents;
    } on DioException catch (error) {
      throw ApiException.fromDio(error);
    }
  }

  Future<void> logout() async {
    try {
      await _apiService.client.post<Map<String, dynamic>>('/auth/logout');
    } on DioException catch (error) {
      if (error.response?.statusCode != 401) {
        throw ApiException.fromDio(error);
      }
    } finally {
      await _storageService.clearTokens();
    }
  }

  Future<User?> restoreSession() async {
    final accessToken = await _storageService.readAccessToken();
    if (accessToken == null || accessToken.isEmpty) {
      return null;
    }

    try {
      return await me();
    } on ApiException {
      await _storageService.clearTokens();
      return null;
    }
  }
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(
    apiService: ref.watch(apiServiceProvider),
    storageService: ref.watch(storageServiceProvider),
  );
}

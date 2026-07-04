import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../config/api_config.dart';
import '../config/firebase_config.dart';
import 'api_service.dart';

/// Registers the device push token with the API.
class PushRegistrationService {
  const PushRegistrationService(this._apiService);

  final ApiService _apiService;
  static var _firebaseInitialized = false;

  Future<void> registerDeviceIfNeeded() async {
    if (kIsWeb) {
      return;
    }

    if (kReleaseMode) {
      if (!pushRegistrationEnabled) {
        return;
      }

      await _registerViaFirebase();
      return;
    }

    if (pushMockTokensEnabled) {
      await _registerToken(
        token:
            'mock_fcm_${Platform.operatingSystem}_${DateTime.now().millisecondsSinceEpoch}',
      );
    }
  }

  Future<void> _registerViaFirebase() async {
    if (!pushRegistrationEnabled) {
      return;
    }

    if (!FirebaseConfig.isConfigured) {
      debugPrint(
        '[push] PUSH_ENABLED=true but Firebase dart-defines are missing.',
      );
      return;
    }

    try {
      if (!_firebaseInitialized) {
        await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: FirebaseConfig.apiKey,
            appId: FirebaseConfig.appId,
            messagingSenderId: FirebaseConfig.messagingSenderId,
            projectId: FirebaseConfig.projectId,
          ),
        );
        _firebaseInitialized = true;
      }

      final messaging = FirebaseMessaging.instance;
      await messaging.requestPermission();
      final token = await messaging.getToken();
      if (token == null || token.isEmpty) {
        return;
      }

      await _registerToken(token: token);

      messaging.onTokenRefresh.listen((refreshedToken) {
        unawaited(_registerToken(token: refreshedToken));
      });
    } catch (error, stackTrace) {
      debugPrint('[push] Firebase registration failed: $error');
      debugPrint('$stackTrace');
    }
  }

  Future<void> _registerToken({required String token}) async {
    try {
      await _apiService.client.post<void>(
        '/user/devices',
        data: {
          'push_token': token,
          'platform': Platform.isIOS ? 'ios' : 'android',
          'app_version': const String.fromEnvironment(
            'APP_VERSION',
            defaultValue: '1.0.0',
          ),
        },
      );
    } catch (_) {
      // Best-effort registration.
    }
  }
}

final pushRegistrationServiceProvider = Provider<PushRegistrationService>((
  ref,
) {
  return PushRegistrationService(ref.watch(apiServiceProvider));
});

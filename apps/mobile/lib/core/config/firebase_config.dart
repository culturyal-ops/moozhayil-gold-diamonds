/// Firebase client configuration via compile-time dart-defines.
///
/// Required when building with `--dart-define=PUSH_ENABLED=true`:
/// - FIREBASE_PROJECT_ID
/// - FIREBASE_API_KEY
/// - FIREBASE_APP_ID
/// - FIREBASE_MESSAGING_SENDER_ID
abstract final class FirebaseConfig {
  static const projectId = String.fromEnvironment('FIREBASE_PROJECT_ID');
  static const apiKey = String.fromEnvironment('FIREBASE_API_KEY');
  static const appId = String.fromEnvironment('FIREBASE_APP_ID');
  static const messagingSenderId = String.fromEnvironment(
    'FIREBASE_MESSAGING_SENDER_ID',
  );

  static bool get isConfigured {
    return projectId.isNotEmpty &&
        apiKey.isNotEmpty &&
        appId.isNotEmpty &&
        messagingSenderId.isNotEmpty;
  }
}

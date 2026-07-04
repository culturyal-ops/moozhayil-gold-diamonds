import 'package:flutter/foundation.dart';

import '../models/user.dart';

/// Debug-only helpers to browse the app without a working OTP / API.
///
/// Enabled automatically in debug builds. Never active in release/profile.
abstract final class DevPreview {
  static bool get enabled => kDebugMode;

  static const previewUser = User(
    id: 'usr_preview',
    phone: '+919876543210',
    name: 'Nikita Liby',
    kycStatus: 'not_started',
    kycDisplay: 'Complete KYC',
    memberSince: '2024',
  );
}

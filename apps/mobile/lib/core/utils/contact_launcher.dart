import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/feedback/premium_snackbar.dart';
import '../constants/showroom_contact.dart';

/// Safely opens tel:, WhatsApp, and other external consultation links.
abstract final class ContactLauncher {
  static Future<bool> callShowroom() =>
      _launch(Uri.parse(ShowroomContact.phoneUri));

  static Future<bool> openWhatsApp({required String message}) {
    final encoded = Uri.encodeComponent(message);
    final uri = Uri.parse(
      'https://wa.me/${ShowroomContact.whatsAppNumber}?text=$encoded',
    );
    return _launch(uri);
  }

  static Future<bool> _launch(Uri uri) async {
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      return launched;
    } catch (_) {
      return false;
    }
  }

  static void showLaunchError(BuildContext context) {
    showPremiumSnackBar(
      context,
      'Could not open. Please try again.',
      haptic: false,
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/models/kyc_status.dart';
import 'package:moozhayil/features/profile/providers/profile_provider.dart';

void main() {
  group('KYC thresholds', () {
    test('checkout does not require KYC', () {
      expect(kycGateRequiredForCheckout(10_000_000, 'not_started'), isFalse);
      expect(panGateRequiredForCheckout(25_000_000, false), isFalse);
    });
  });

  group('KycStatusResponse parsing', () {
    test('parses status payload safely', () {
      final model = KycStatusResponse.fromJson({
        'kyc_status': 'in_review',
        'aadhaar_verified': true,
        'pan_verified': false,
        'selfie_verified': true,
        'submitted_at': '2026-06-26T04:30:00Z',
        'rejection_reason': null,
        'resubmission_allowed_at': null,
      });

      expect(model.kycStatus, 'in_review');
      expect(model.aadhaarVerified, isTrue);
      expect(model.selfieVerified, isTrue);
    });
  });
}

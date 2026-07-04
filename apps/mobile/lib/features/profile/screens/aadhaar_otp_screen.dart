import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/kyc_provider.dart';

class AadhaarOtpScreen extends ConsumerStatefulWidget {
  const AadhaarOtpScreen({super.key});

  @override
  ConsumerState<AadhaarOtpScreen> createState() => _AadhaarOtpScreenState();
}

class _AadhaarOtpScreenState extends ConsumerState<AadhaarOtpScreen> {
  var _otp = '';
  String? _error;
  var _loading = false;

  Future<void> _verify() async {
    if (!RegExp(r'^\d{6}$').hasMatch(_otp.trim())) {
      setState(() => _error = 'Enter the 6-digit OTP');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref
          .read(kycFlowActionsProvider.notifier)
          .verifyAadhaarOtp(_otp.trim());
      if (mounted) {
        context.push(AppRoutes.profileKycPan);
      }
    } catch (error) {
      setState(() => _error = CustomerErrorCopy.message(error));
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppTopBar.detail(title: 'Aadhaar OTP'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter the OTP', style: AppTypography.headingMD),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Sent to the mobile number linked with your Aadhaar.',
              style: AppTypography.uiBodySM.copyWith(
                color: AppColors.slateMist,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextInput(
              label: 'OTP',
              placeholder: '654321',
              value: _otp,
              keyboardType: TextInputType.number,
              maxLength: 6,
              errorText: _error,
              onChanged: (value) => setState(() {
                _otp = value;
                _error = null;
              }),
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Verify OTP',
              isFullWidth: true,
              isLoading: _loading,
              onTap: _verify,
            ),
          ],
        ),
      ),
    );
  }
}

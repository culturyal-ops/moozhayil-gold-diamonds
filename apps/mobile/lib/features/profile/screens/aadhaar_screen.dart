import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondary_button.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/kyc_provider.dart';

class AadhaarScreen extends ConsumerStatefulWidget {
  const AadhaarScreen({super.key});

  @override
  ConsumerState<AadhaarScreen> createState() => _AadhaarScreenState();
}

class _AadhaarScreenState extends ConsumerState<AadhaarScreen> {
  var _aadhaar = '';
  String? _error;
  var _loading = false;

  Future<void> _submit() async {
    final value = _aadhaar.trim();
    if (!RegExp(r'^\d{12}$').hasMatch(value)) {
      setState(() => _error = 'Enter a valid 12-digit Aadhaar number');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref.read(kycFlowActionsProvider.notifier).sendAadhaarOtp(value);
      if (mounted) {
        context.push(AppRoutes.profileKycAadhaarOtp);
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
      appBar: AppTopBar.detail(title: 'Aadhaar Verification'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter your Aadhaar number', style: AppTypography.headingMD),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'We send a one-time OTP to the mobile linked with Aadhaar.',
              style: AppTypography.uiBodySM.copyWith(color: AppColors.slateMist),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextInput(
              label: 'Aadhaar number',
              placeholder: '123456789012',
              value: _aadhaar,
              keyboardType: TextInputType.number,
              maxLength: 12,
              errorText: _error,
              onChanged: (value) => setState(() {
                _aadhaar = value;
                _error = null;
              }),
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Send OTP',
              isFullWidth: true,
              isLoading: _loading,
              onTap: _submit,
            ),
            const SizedBox(height: AppSpacing.sm),
            SecondaryButton(
              label: 'Use PAN instead',
              isFullWidth: true,
              onTap: () => context.push(AppRoutes.profileKycPan),
            ),
          ],
        ),
      ),
    );
  }
}

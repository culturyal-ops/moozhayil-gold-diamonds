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

class PanScreen extends ConsumerStatefulWidget {
  const PanScreen({super.key});

  @override
  ConsumerState<PanScreen> createState() => _PanScreenState();
}

class _PanScreenState extends ConsumerState<PanScreen> {
  var _pan = '';
  String? _error;
  var _loading = false;

  Future<void> _verify() async {
    final value = _pan.trim().toUpperCase();
    if (!RegExp(r'^[A-Z]{5}\d{4}[A-Z]$').hasMatch(value)) {
      setState(() => _error = 'Enter a valid PAN (e.g. ABCDE1234F)');
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref.read(kycFlowActionsProvider.notifier).verifyPan(value);
      if (mounted) {
        context.push(AppRoutes.profileKycSelfie);
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
    final status = ref.watch(kycStatusProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppTopBar.detail(title: 'PAN Verification'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Enter your PAN', style: AppTypography.headingMD),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Required for high-value transactions above ₹2,00,000 and enhanced verification.',
              style: AppTypography.uiBodySM.copyWith(color: AppColors.slateMist),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextInput(
              label: 'PAN number',
              placeholder: 'ABCDE1234F',
              value: _pan,
              errorText: _error,
              onChanged: (value) => setState(() {
                _pan = value.toUpperCase();
                _error = null;
              }),
            ),
            const SizedBox(height: AppSpacing.lg),
            PrimaryButton(
              label: 'Verify PAN',
              isFullWidth: true,
              isLoading: _loading,
              onTap: _verify,
            ),
            const SizedBox(height: AppSpacing.sm),
            status.when(
              data: (kyc) {
                if (kyc.aadhaarVerified) {
                  return PrimaryButton(
                    label: 'Skip to selfie',
                    isFullWidth: true,
                    onTap: () => context.push(AppRoutes.profileKycSelfie),
                  );
                }
                return const SizedBox.shrink();
              },
              loading: () => const SizedBox.shrink(),
              error: (_, _) => const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}

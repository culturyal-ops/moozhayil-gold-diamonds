import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/feedback/premium_snackbar.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/kyc_provider.dart';

class KycReviewScreen extends ConsumerWidget {
  const KycReviewScreen({super.key, this.returnRoute});

  final String? returnRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(kycStatusProvider);

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppTopBar.detail(title: 'Review and Submit'),
      body: status.when(
        data: (kyc) {
          final canSubmit =
              kyc.selfieVerified && (kyc.aadhaarVerified || kyc.panVerified);

          return Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Review your documents', style: AppTypography.headingMD),
                const SizedBox(height: AppSpacing.md),
                _CheckRow(label: 'Aadhaar', done: kyc.aadhaarVerified),
                _CheckRow(label: 'PAN', done: kyc.panVerified),
                _CheckRow(label: 'Selfie', done: kyc.selfieVerified),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: 'Submit for review',
                  isFullWidth: true,
                  isDisabled: !canSubmit,
                  onTap: canSubmit
                      ? () async {
                          try {
                            await ref
                                .read(kycFlowActionsProvider.notifier)
                                .submit();
                            if (context.mounted) {
                              context.go(AppRoutes.profileKycPending);
                            }
                          } catch (error) {
                            if (context.mounted) {
                              showPremiumSnackBar(
                                context,
                                CustomerErrorCopy.message(error),
                                haptic: false,
                              );
                            }
                          }
                        }
                      : null,
                ),
              ],
            ),
          );
        },
        loading: () => const Padding(
          padding: EdgeInsets.all(AppSpacing.screenPadding),
          child: LoadingShimmer(width: double.infinity, height: AppSpacing.x3l),
        ),
        error: (error, _) => ErrorState(
          body: CustomerErrorCopy.message(error),
          onRetry: () => ref.invalidate(kycStatusProvider),
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  const _CheckRow({required this.label, required this.done});

  final String label;
  final bool done;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          Icon(
            done ? Icons.check_circle : Icons.radio_button_unchecked,
            color: done ? AppColors.antiqueGold : AppColors.slateMist,
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(label, style: AppTypography.uiBodyMD),
        ],
      ),
    );
  }
}

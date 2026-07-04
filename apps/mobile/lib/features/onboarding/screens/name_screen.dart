import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/inputs/text_input.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/onboarding_provider.dart';

class NameScreen extends ConsumerWidget {
  const NameScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboarding = ref.watch(onboardingControllerProvider);
    final state = onboarding.value ?? const OnboardingState();

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPaddingLG),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text('What should we call you?', style: AppTypography.headingXL),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Your name keeps the experience personal without feeling noisy.',
                style: AppTypography.uiBodyLG.copyWith(
                  color: AppColors.slateMist,
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              AppTextInput(
                label: 'Name',
                placeholder: 'Nikita Liby',
                value: state.name,
                textInputAction: TextInputAction.done,
                onChanged: ref
                    .read(onboardingControllerProvider.notifier)
                    .setName,
                onSubmit: (_) => _continue(context, ref),
              ),
              if (onboarding.hasError) ...[
                const SizedBox(height: AppSpacing.md),
                ErrorState(
                  headline: 'We could not save your name',
                  body: CustomerErrorCopy.message(onboarding.error),
                  onRetry: () => _continue(context, ref),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'Continue',
                isFullWidth: true,
                isLoading: onboarding.isLoading,
                isDisabled: state.name.trim().length < 2,
                onTap: () => _continue(context, ref),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _continue(BuildContext context, WidgetRef ref) async {
    await ref.read(onboardingControllerProvider.notifier).saveName();
    if (context.mounted && !ref.read(onboardingControllerProvider).hasError) {
      context.go(AppRoutes.onboardingKycIntro);
    }
  }
}

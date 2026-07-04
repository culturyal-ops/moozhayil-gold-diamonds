import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/feedback/error_state.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/radii.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/onboarding_provider.dart';

class IntentScreen extends ConsumerWidget {
  const IntentScreen({super.key});

  static const _intentOptions = [
    ('wedding', 'Wedding'),
    ('investment', 'Investment'),
    ('festival', 'Festival'),
    ('gift', 'Gift'),
    ('family', 'Family'),
    ('other', 'Other'),
  ];

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
              Text('What brings you here?', style: AppTypography.headingXL),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Choose the intentions that best describe your gold journey.',
                style: AppTypography.uiBodyLG.copyWith(
                  color: AppColors.slateMist,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: [
                  for (final option in _intentOptions)
                    _IntentChip(
                      label: option.$2,
                      isSelected: state.intents.contains(option.$1),
                      onTap: () => ref
                          .read(onboardingControllerProvider.notifier)
                          .toggleIntent(option.$1),
                    ),
                ],
              ),
              if (onboarding.hasError) ...[
                const SizedBox(height: AppSpacing.md),
                ErrorState(
                  headline: 'We could not save this yet',
                  body: CustomerErrorCopy.message(onboarding.error),
                  onRetry: () => _continue(context, ref),
                ),
              ],
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'Continue',
                isFullWidth: true,
                isLoading: onboarding.isLoading,
                isDisabled: state.intents.isEmpty,
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
    await ref.read(onboardingControllerProvider.notifier).saveIntents();
    if (context.mounted && !ref.read(onboardingControllerProvider).hasError) {
      context.go(AppRoutes.onboardingName);
    }
  }
}

class _IntentChip extends StatelessWidget {
  const _IntentChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: isSelected,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.chip),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.champagneVeil : AppColors.pureWhite,
            borderRadius: BorderRadius.circular(AppRadius.chip),
            border: Border.all(
              color: isSelected ? AppColors.maroon : AppColors.smokeLine,
            ),
          ),
          child: Text(
            label,
            style: AppTypography.uiBodySM.copyWith(
              color: isSelected ? AppColors.obsidian : AppColors.slateMist,
            ),
          ),
        ),
      ),
    );
  }
}

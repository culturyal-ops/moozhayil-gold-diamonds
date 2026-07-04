import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/inputs/select_pill_row.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/goal_create_provider.dart';
import '../widgets/goal_enrollment_step_header.dart';

class MomentScreen extends ConsumerWidget {
  const MomentScreen({super.key});

  static const _types = [
    (value: 'wedding', label: 'Wedding'),
    (value: 'investment', label: 'Investment'),
    (value: 'festival', label: 'Festival'),
    (value: 'gift', label: 'Gift'),
    (value: 'family', label: 'Family'),
    (value: 'other', label: 'Other'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(goalCreateDraftStoreProvider);
    final scheme = draft.schemeType;

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Start ${scheme.displayName}'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GoalEnrollmentStepHeader(
              step: GoalEnrollmentStep.moment,
              title: 'What are you saving for?',
              subtitle: 'Choose a moment and name your plan.',
            ),
            const SizedBox(height: AppSpacing.lg),
            SelectPillRow(
              options: _types,
              selected: draft.goalType,
              onSelected: (value) => ref
                  .read(goalCreateDraftStoreProvider.notifier)
                  .setGoalType(value),
            ),
            const SizedBox(height: AppSpacing.lg),
            AppTextInput(
              label: 'Plan name',
              placeholder: switch (scheme) {
                GoldenWishSchemeType.aura => 'Anu\'s Wedding Bangles',
                GoldenWishSchemeType.crest => 'Wedding Advance',
                GoldenWishSchemeType.dhanam => 'Festival Booking',
                GoldenWishSchemeType.goldNidhi => 'Family Gold Fund',
              },
              value: draft.name,
              onChanged: (value) => ref
                  .read(goalCreateDraftStoreProvider.notifier)
                  .setName(value),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Continue',
              isFullWidth: true,
              onTap: draft.name.trim().isEmpty
                  ? null
                  : () => context.push(AppRoutes.goalsCreatePiece),
            ),
          ],
        ),
      ),
    );
  }
}

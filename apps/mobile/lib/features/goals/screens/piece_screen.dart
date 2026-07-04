import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/buttons/primary_button.dart';
import '../../../components/editorial/editorial_panel.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/customer_copy.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../providers/goal_create_provider.dart';
import '../widgets/goal_enrollment_step_header.dart';

class PieceScreen extends ConsumerWidget {
  const PieceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final draft = ref.watch(goalCreateDraftStoreProvider);

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Choose a Piece'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GoalEnrollmentStepHeader(
              step: GoalEnrollmentStep.piece,
              title: 'Link a dream piece',
              subtitle: CustomerCopy.linkPieceOptional,
            ),
            const SizedBox(height: AppSpacing.lg),
            if (draft.targetProductName != null) ...[
              EditorialPanel(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SELECTED',
                      style: AppTypography.uiMicro.copyWith(
                        color: AppColors.gold,
                        letterSpacing: 1.6,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      draft.targetProductName!,
                      style: AppTypography.uiBodyMD,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
            EditorialGhostCta(
              label: 'Skip for now',
              onTap: () {
                ref.read(goalCreateDraftStoreProvider.notifier).setProduct(
                      id: 'browse-later',
                      name: 'Browse catalog later',
                    );
              },
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Continue',
              isFullWidth: true,
              onTap: () => context.push(AppRoutes.goalsCreateAmount),
            ),
          ],
        ),
      ),
    );
  }
}

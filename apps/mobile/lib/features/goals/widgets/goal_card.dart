import 'package:flutter/material.dart';

import '../../../components/editorial/editorial_panel.dart';
import '../../../components/progress/linear_progress_bar.dart';
import '../../../components/progress/progress_ring.dart';
import '../../../core/constants/scheme_labels.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/customer_copy.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/goal.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({
    super.key,
    required this.goal,
    required this.onTap,
  });

  final Goal goal;
  final VoidCallback onTap;

  Color get _statusColor {
    return switch (goal.status) {
      'contribution_due' => AppColors.gold,
      'paused' => AppColors.textMuted,
      'completed' => AppColors.sageWhisper,
      _ => AppColors.textPrimary,
    };
  }

  @override
  Widget build(BuildContext context) {
    return EditorialPanel(
      onTap: onTap,
      child: Row(
        children: [
          ProgressRing(percent: goal.percentComplete, size: 64),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.name,
                  style: AppTypography.headingSM.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  SchemeLabels.customerName(goal.schemeType).toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(
                    color: AppColors.gold,
                  ),
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  goal.statusLabel.toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(color: _statusColor),
                ),
                const SizedBox(height: AppSpacing.sm),
                LinearProgressBar(percent: goal.percentComplete),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  '${goal.currentGramsDisplay} · ${goal.currentValueDisplay}',
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompletedGoalCard extends StatelessWidget {
  const CompletedGoalCard({
    super.key,
    required this.goal,
    required this.onTap,
  });

  final Goal goal;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return EditorialPanel(
      onTap: onTap,
      color: AppColors.bgWhite,
      child: Row(
        children: [
          const Icon(Icons.check, color: AppColors.gold, size: 20),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  goal.name,
                  style: AppTypography.headingSM.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  '${CustomerCopy.planCompletePrefix} · ${goal.currentGramsDisplay}',
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

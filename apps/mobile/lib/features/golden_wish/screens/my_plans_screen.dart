import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/editorial/editorial_panel.dart';
import '../../../components/editorial/section_header.dart';
import '../../../components/feedback/empty_state.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/goal.dart';
import '../../../core/constants/customer_copy.dart';
import '../../../core/routing/app_routes.dart';
import '../../goals/providers/goals_provider.dart';
import '../../goals/widgets/goal_card.dart';

/// Profile entry for active Golden Wish enrollments (backend: Goal records).
class MyPlansScreen extends ConsumerWidget {
  const MyPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plans = ref.watch(goalsListProvider());

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'My Plans'),
      body: plans.when(
        data: (response) {
          if (response.goals.isEmpty) {
            return ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                EmptyState(
                  icon: Icons.auto_awesome_outlined,
                  headline: CustomerCopy.myPlansEmptyHeadline,
                  body: CustomerCopy.myPlansEmptyBody,
                  ctaLabel: CustomerCopy.exploreSchemesCta,
                  onCtaTap: () => context.go(AppRoutes.goldenWish),
                ),
              ],
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(goalsListProvider());
              await ref.read(goalsListProvider().future);
            },
            child: ListView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              children: [
                _SummaryBanner(summary: response.summary),
                const SizedBox(height: AppSpacing.lg),
                const SectionHeader(
                  eyebrow: 'Active',
                  title: 'Your plans',
                ),
                const SizedBox(height: AppSpacing.md),
                ...response.goals.map(
                  (goal) => Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.md),
                    child: goal.status == 'completed'
                        ? CompletedGoalCard(
                            goal: goal,
                            onTap: () => context.push('/goals/${goal.id}'),
                          )
                        : GoalCard(
                            goal: goal,
                            onTap: () => context.push('/goals/${goal.id}'),
                          ),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                EditorialGhostCta(
                  label: 'Explore plans',
                  onTap: () => context.go(AppRoutes.goldenWish),
                ),
              ],
            ),
          );
        },
        loading: () => ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.lg),
          itemCount: 4,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
          itemBuilder: (_, _) => const LoadingShimmer(
            width: double.infinity,
            height: AppSpacing.x3l * 2,
          ),
        ),
        error: (error, _) => ErrorState(
          body: CustomerErrorCopy.message(error),
          onRetry: () => ref.invalidate(goalsListProvider()),
        ),
      ),
    );
  }
}

class _SummaryBanner extends StatelessWidget {
  const _SummaryBanner({required this.summary});

  final GoalsSummary summary;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      color: AppColors.ink,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TOTAL GOLD SAVED',
            style: AppTypography.uiMicro.copyWith(
              color: AppColors.gold,
              letterSpacing: 9 * 0.28,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            summary.totalGramsDisplay,
            style: AppTypography.displayLG.copyWith(
              color: AppColors.paper,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            '${summary.totalValueDisplay} · ${CustomerCopy.activePlansCount(summary.activeCount)}',
            style: AppTypography.uiBodySM.copyWith(
              color: AppColors.paper.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/radii.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/goal.dart';
import '../../goals/providers/goals_provider.dart';

/// Shows when the customer has an active Aura making-charge waiver and
/// is paying with gold balance at checkout.
class AuraMcWaiverBanner extends ConsumerWidget {
  const AuraMcWaiverBanner({super.key, required this.usingGoldBalance});

  final bool usingGoldBalance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!usingGoldBalance) {
      return const SizedBox.shrink();
    }

    final goals = ref.watch(goalsListProvider());
    return goals.maybeWhen(
      data: (response) {
        Goal? activePlan;
        Goal? eligiblePlan;
        for (final goal in response.goals) {
          if (goal.mcWaiverActive) {
            activePlan = goal;
            break;
          }
          if (goal.mcWaiverEligible) {
            eligiblePlan = goal;
          }
        }

        if (activePlan != null) {
          final plan = activePlan;
          return _InfoCard(
            tone: _BannerTone.active,
            title: 'Aura Plan making-charge benefit active',
            body:
                'Aura Plan only: 0% making charges up to ${plan.mcWaiverMaxPct ?? 20}% of gold value '
                'when paying with My Gold. Savings appear in your order total.',
          );
        }

        if (eligiblePlan != null) {
          final plan = eligiblePlan;
          return _InfoCard(
            tone: _BannerTone.pending,
            title: 'Aura Plan making-charge benefit earned',
            body:
                'Aura Plan only: your ${plan.name} plan qualifies for 0% making charges up to '
                '${plan.mcWaiverMaxPct ?? 20}% of gold value. Use My Gold within your '
                'redemption window (days 332–352) at checkout.',
          );
        }

        return const SizedBox.shrink();
      },
      orElse: () => const SizedBox.shrink(),
    );
  }
}

enum _BannerTone { active, pending }

class _InfoCard extends StatelessWidget {
  const _InfoCard({
    required this.tone,
    required this.title,
    required this.body,
  });

  final _BannerTone tone;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final isActive = tone == _BannerTone.active;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFDF8EE) : AppColors.pureWhite,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(
          color: isActive ? AppColors.antiqueGold : AppColors.smokeLine,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isActive ? Icons.verified_outlined : Icons.info_outline,
            color: isActive ? AppColors.antiqueGold : AppColors.maroon,
            size: 22,
          ),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.headingSM),
                const SizedBox(height: AppSpacing.xxs),
                Text(
                  body,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.slateMist,
                    height: 1.5,
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

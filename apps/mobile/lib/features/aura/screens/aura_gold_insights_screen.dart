import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../../my_gold/providers/gold_balance_provider.dart';
import '../../shop/widgets/shop_section.dart';
import '../providers/aura_provider.dart';
import '../widgets/aura_option_button.dart';

class AuraGoldInsightsScreen extends ConsumerWidget {
  const AuraGoldInsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insight = ref.watch(auraInsightProvider);
    final goldBalance = ref.watch(goldBalanceProvider);

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Gold insights'),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(auraInsightProvider);
          ref.invalidate(goldBalanceProvider);
          await ref.read(auraInsightProvider.future);
        },
        child: ListView(
          padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
          children: [
            ShopSectionInset(
              top: 12,
              child: goldBalance.when(
                data: (balance) => Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  color: AppColors.ink,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'YOUR GOLD',
                        style: AppTypography.uiMicro.copyWith(
                          color: AppColors.gold,
                          letterSpacing: 9 * 0.28,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        balance.totalGramsDisplay,
                        style: AppTypography.displayLG.copyWith(
                          color: AppColors.paper,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        '${balance.totalValueDisplay} · ${balance.rateUsed.rateDisplay}',
                        style: AppTypography.uiBodySM.copyWith(
                          color: AppColors.paper.withValues(alpha: 0.55),
                        ),
                      ),
                    ],
                  ),
                ),
                loading: () => const LoadingShimmer(
                  width: double.infinity,
                  height: AppSpacing.x3l * 2,
                ),
                error: (error, _) => ErrorState(body: CustomerErrorCopy.message(error)),
              ),
            ),
            ShopSectionInset(
              child: insight.when(
                data: (data) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShopSectionHeader(
                      title: 'Today\u2019s insight',
                      subtitle: 'How the live rate affects your savings',
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      data.insightText,
                      style: AppTypography.uiBodyMD.copyWith(height: 1.55),
                    ),
                    if (data.data != null &&
                        data.data!['rate_change_pct'] != null) ...[
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        'Rate change today: ${data.data!['rate_change_pct']}%',
                        style: AppTypography.uiCaption.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                    const SizedBox(height: AppSpacing.lg),
                    AuraOptionButton(
                      label: 'View My Gold',
                      isPrimary: true,
                      onPressed: () => context.push(AppRoutes.myGold),
                    ),
                  ],
                ),
                loading: () => const LoadingShimmer(
                  width: double.infinity,
                  height: AppSpacing.x3l,
                ),
                error: (error, _) => ErrorState(
                  body: CustomerErrorCopy.message(error),
                  onRetry: () => ref.invalidate(auraInsightProvider),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

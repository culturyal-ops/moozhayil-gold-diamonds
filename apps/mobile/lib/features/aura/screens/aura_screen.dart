import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/editorial/editorial_panel.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/feedback/premium_snackbar.dart';
import '../../../components/icons/app_icons.dart';
import '../../../core/animations/section_reveal.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../../auth/providers/auth_provider.dart';
import '../providers/aura_provider.dart';
import '../widgets/aura_action_card.dart';

class AuraScreen extends ConsumerWidget {
  const AuraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final insight = ref.watch(auraInsightProvider);

    return ColoredBox(
      color: AppColors.paper,
      child: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(auraInsightProvider);
          await ref.read(auraInsightProvider.future);
        },
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.homeScreenPadding,
            AppSpacing.lg,
            AppSpacing.homeScreenPadding,
            AppSpacing.x3l,
          ),
          children: [
            SectionReveal(
              index: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AI Advisor', style: AppTypography.screenTitle),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Your jewellery concierge — plans, weddings, gifting, and gold.',
                    style: AppTypography.uiBodyMD.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            SectionReveal(
              index: 1,
              child: insight.when(
                data: (data) => _InsightBanner(
                  insightText: data.insightText,
                  onExplore: () {
                    if (data.linkRoute.isNotEmpty) {
                      context.push(data.linkRoute);
                    }
                  },
                ),
                loading: () => const LoadingShimmer(
                  width: double.infinity,
                  height: AppSpacing.x3l * 2,
                ),
                error: (error, _) => ErrorState(
                  body: CustomerErrorCopy.message(error),
                  onRetry: () => ref.invalidate(auraInsightProvider),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            SectionReveal(
              index: 2,
              child: Text(
                'How can I help?',
                style: AppTypography.headingSM.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionReveal(
              index: 3,
              child: AuraActionCard(
                title: 'Help me choose a plan',
                subtitle: 'Find the Moozhayil scheme that fits your journey.',
                icon: AppIcons.choosePlan,
                accentColor: AppColors.brandBurgundy,
                onTap: () => context.go(AppRoutes.goldenWish),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionReveal(
              index: 4,
              child: AuraActionCard(
                title: 'Plan wedding jewellery',
                subtitle: 'Occasion, timeline, and pieces within your budget.',
                icon: AppIcons.weddingJewellery,
                accentColor: AppColors.burgundyDeep,
                onTap: () => context.push(AppRoutes.auraGoalPlanning),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionReveal(
              index: 5,
              child: AuraActionCard(
                title: 'Discover jewellery',
                subtitle: 'Find pieces within budget for someone special.',
                icon: AppIcons.discoverJewellery,
                accentColor: AppColors.gold,
                onTap: () => context.push(AppRoutes.auraProductDiscovery),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionReveal(
              index: 6,
              child: AuraActionCard(
                title: 'Understand gold prices',
                subtitle: 'See how today\u2019s rate aligns with your savings.',
                icon: AppIcons.goldPrices,
                accentColor: AppColors.ink,
                onTap: () => context.push(AppRoutes.auraGoldInsights),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionReveal(
              index: 7,
              child: AuraActionCard(
                title: 'Chat with Advisor',
                subtitle: 'Ask about jewellery, plans, gifting, or gold.',
                icon: AppIcons.chatAdvisor,
                accentColor: AppColors.brandBurgundy,
                onTap: () => _startChat(context, ref, auth.value?.step),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _startChat(
    BuildContext context,
    WidgetRef ref,
    AuthFlowStep? step,
  ) async {
    if (step != AuthFlowStep.signedIn) {
      context.push(
        Uri(
          path: AppRoutes.auth,
          queryParameters: {'from': AppRoutes.aura},
        ).toString(),
      );
      return;
    }

    try {
      final sessionId =
          await ref.read(auraActionsProvider.notifier).startChatSession();
      if (!context.mounted) return;
      context.push('/aura/conversation/$sessionId');
    } catch (error) {
      if (!context.mounted) return;
      showPremiumSnackBar(context, CustomerErrorCopy.message(error), haptic: false);
    }
  }
}

class _InsightBanner extends StatelessWidget {
  const _InsightBanner({
    required this.insightText,
    required this.onExplore,
  });

  final String insightText;
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.pearl,
        border: Border.all(color: AppColors.border, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TODAY\'S INSIGHT',
            style: AppTypography.uiMicro.copyWith(
              color: AppColors.gold,
              letterSpacing: 9 * 0.24,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            insightText,
            style: AppTypography.uiBodyMD.copyWith(
              color: AppColors.textPrimary,
              height: 1.55,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          EditorialGhostCta(label: 'Explore', onTap: onExplore),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../components/icons/app_icons.dart';
import '../../../core/animations/fade_slide_in.dart';
import '../../../core/animations/staggered_list_item.dart';
import '../../../core/constants/motion.dart';
import '../../../components/editorial/editorial_panel.dart';

import '../../../components/editorial/section_header.dart';

import '../../../components/feedback/empty_state.dart';

import '../../../components/feedback/error_state.dart';

import '../../../components/feedback/loading_shimmer.dart';

import '../../../core/constants/app_info.dart';

import '../../../core/constants/colors.dart';

import '../../../core/constants/customer_copy.dart';

import '../../../core/constants/kyc_thresholds.dart';

import '../../../core/constants/spacing.dart';

import '../../../core/constants/typography.dart';

import '../../../core/models/kyc_status.dart';

import '../../../core/routing/app_routes.dart';

import '../../auth/providers/auth_provider.dart';

import '../providers/kyc_provider.dart';

import '../providers/profile_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);

    final profile = ref.watch(profileUserProvider);

    final kyc = ref.watch(kycStatusProvider);

    return ColoredBox(
      color: AppColors.paper,

      child: SafeArea(
        child: auth.when(
          data: (state) {
            if (state.step != AuthFlowStep.signedIn) {
              return EmptyState(
                icon: AppIcons.person,

                headline: 'Your profile',

                body:
                    'Sign in to manage verification, addresses, and account details.',

                ctaLabel: 'Sign in',

                onCtaTap: () => context.push(
                  Uri(
                    path: AppRoutes.auth,

                    queryParameters: {'from': AppRoutes.profile},
                  ).toString(),
                ),
              );
            }

            return profile.when(
              data: (user) {
                return kyc.when(
                  data: (kycStatus) => RefreshIndicator(
                    onRefresh: () async {
                      ref.invalidate(profileUserProvider);
                      ref.invalidate(kycStatusProvider);
                      await ref.read(profileUserProvider.future);
                    },
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        FadeSlideIn(
                          duration: AppMotion.slow,
                          child: _ProfileHeader(
                            name: user.name ?? 'Member',
                            phone: user.phone,
                            kycLabel: _kycSubtitle(kycStatus),
                            isVerified: isKycVerified(kycStatus.kycStatus),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            AppSpacing.lg,
                            AppSpacing.xl,
                            AppSpacing.lg,
                            AppSpacing.x3l + 56,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _ProfileSection(
                                title: 'Gold & plans',
                                subtitle: 'Savings and enrollments',
                                startIndex: 0,
                                children: [
                                  EditorialListTile(
                                    icon: AppIcons.myGold,
                                    title: 'My Gold',
                                    subtitle: 'View your accumulated gold',
                                    onTap: () => context.push(AppRoutes.myGold),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.myPlans,
                                    title: 'My Plans',
                                    subtitle: 'Moozhayil scheme enrollments',
                                    onTap: () =>
                                        context.push(AppRoutes.myPlans),
                                  ),
                                ],
                              ),
                              _ProfileSection(
                                title: 'Shopping',
                                subtitle: 'Purchases and saved pieces',
                                startIndex: 2,
                                children: [
                                  EditorialListTile(
                                    icon: AppIcons.orders,
                                    title: 'Orders',
                                    subtitle: 'Track your purchases',
                                    onTap: () => context.push(AppRoutes.orders),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.dreamVault,
                                    title: 'Dream Vault',
                                    subtitle: 'Saved pieces you love',
                                    onTap: () =>
                                        context.push(AppRoutes.dreamVault),
                                  ),
                                ],
                              ),
                              _ProfileSection(
                                title: 'Account',
                                subtitle: 'Settings and verification',
                                startIndex: 4,
                                children: [
                                  EditorialListTile(
                                    icon: AppIcons.addresses,
                                    title: 'Addresses',
                                    subtitle: 'Delivery addresses',
                                    onTap: () => context.push(
                                      AppRoutes.profileAddresses,
                                    ),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.paymentMethods,
                                    title: 'Payment Methods',
                                    subtitle: 'UPI and saved methods',
                                    onTap: () => context.push(
                                      AppRoutes.profilePaymentMethods,
                                    ),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.notifications,
                                    title: 'Notifications',
                                    subtitle: 'Updates and milestones',
                                    onTap: () =>
                                        context.push(AppRoutes.notifications),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.referrals,
                                    title: 'Referrals',
                                    subtitle:
                                        'Invite someone into the Moozhayil family',
                                    onTap: () =>
                                        context.push(AppRoutes.referrals),
                                  ),
                                  EditorialListTile(
                                    icon: AppIcons.kyc,
                                    title: user.kycDisplay ?? 'Complete KYC',
                                    subtitle: _kycSubtitle(kycStatus),
                                    onTap: () =>
                                        context.push(AppRoutes.profileKyc),
                                  ),
                                ],
                              ),
                              _ProfileSection(
                                title: 'Support',
                                subtitle: 'Visit us or get in touch',
                                startIndex: 9,
                                children: [
                                  EditorialListTile(
                                    icon: AppIcons.help,
                                    title: 'Help & Contact',
                                    subtitle: 'Call, WhatsApp, or visit Pala',
                                    onTap: () =>
                                        context.push(AppRoutes.storeLocator),
                                  ),
                                ],
                              ),

                              if (kycStatus.kycStatus == 'rejected' &&
                                  kycStatus.rejectionReason != null) ...[
                                const SizedBox(height: AppSpacing.md),

                                EditorialPanel(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        'Verification note',

                                        style: AppTypography.uiBodyMD.copyWith(
                                          fontWeight: FontWeight.w500,

                                          color: AppColors.textPrimary,
                                        ),
                                      ),

                                      const SizedBox(height: AppSpacing.xs),

                                      Text(
                                        kycStatus.rejectionReason!,

                                        style: AppTypography.uiBodySM.copyWith(
                                          color: AppColors.textSecondary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],

                              const SizedBox(height: AppSpacing.xl),

                              Text(
                                'App ${AppInfo.version} (${AppInfo.buildNumber})',

                                style: AppTypography.uiCaption.copyWith(
                                  color: AppColors.textMuted,
                                ),

                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: AppSpacing.lg),

                              EditorialPrimaryCta(
                                label: 'Sign out',

                                onTap: () => ref
                                    .read(authControllerProvider.notifier)
                                    .logout(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  loading: () => const Center(
                    child: LoadingShimmer(
                      width: double.infinity,

                      height: AppSpacing.x3l,
                    ),
                  ),

                  error: (error, _) => ErrorState(
                    body: CustomerErrorCopy.message(error),

                    onRetry: () => ref.invalidate(kycStatusProvider),
                  ),
                );
              },

              loading: () => const Center(
                child: LoadingShimmer(
                  width: double.infinity,

                  height: AppSpacing.x3l,
                ),
              ),

              error: (error, _) => ErrorState(
                body: CustomerErrorCopy.message(error),

                onRetry: () => ref.invalidate(profileUserProvider),
              ),
            );
          },

          loading: () => const Center(
            child: LoadingShimmer(
              width: double.infinity,

              height: AppSpacing.x3l,
            ),
          ),

          error: (error, _) =>
              ErrorState(body: CustomerErrorCopy.message(error)),
        ),
      ),
    );
  }

  String _kycSubtitle(KycStatusResponse kyc) {
    if (isKycVerified(kyc.kycStatus)) {
      return 'Verified member';
    }

    if (kyc.kycStatus == 'in_review') {
      return 'Review in progress';
    }

    if (kyc.kycStatus == 'rejected') {
      return kyc.resubmissionAllowedAt == null
          ? 'Ready to resubmit'
          : '${KycThresholds.resubmissionCooldownHours}h cooldown active';
    }

    return CustomerCopy.kycUnlockSchemes;
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection({
    required this.title,

    required this.subtitle,

    required this.startIndex,

    required this.children,
  });

  final String title;

  final String subtitle;

  final int startIndex;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        SectionHeader(eyebrow: title, title: subtitle),

        const SizedBox(height: AppSpacing.md),

        for (var i = 0; i < children.length; i++) ...[
          StaggeredListItem(index: startIndex + i, child: children[i]),

          if (i < children.length - 1) const SizedBox(height: AppSpacing.sm),
        ],

        const SizedBox(height: AppSpacing.xl),
      ],
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,

    required this.phone,

    required this.kycLabel,

    required this.isVerified,
  });

  final String name;

  final String phone;

  final String kycLabel;

  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,

        AppSpacing.xl,

        AppSpacing.lg,

        AppSpacing.lg,
      ),

      decoration: const BoxDecoration(
        color: AppColors.burgundyDeep,

        border: Border(
          bottom: BorderSide(color: AppColors.borderGold, width: 0.5),
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            name,

            style: AppTypography.screenTitle.copyWith(
              fontSize: 28,

              color: AppColors.cream,
            ),
          ),

          const SizedBox(height: AppSpacing.xxs),

          Text(
            phone,

            style: AppTypography.uiBodySM.copyWith(
              color: AppColors.cream.withValues(alpha: 0.72),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,

              vertical: 6,
            ),

            decoration: BoxDecoration(
              border: Border.all(
                color: isVerified
                    ? AppColors.gold.withValues(alpha: 0.6)
                    : AppColors.cream.withValues(alpha: 0.35),
              ),
            ),

            child: Text(
              kycLabel.toUpperCase(),

              style: AppTypography.uiMicro.copyWith(
                color: isVerified ? AppColors.goldLight : AppColors.cream,

                letterSpacing: 9 * 0.12,
              ),

              maxLines: 1,

              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

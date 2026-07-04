import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';

/// Debug screen picker — jump to any route without OTP or backend.
class DevScreenGallery extends StatelessWidget {
  const DevScreenGallery({super.key});

  static const _destinations = <({String label, String route})>[
    (label: 'Splash', route: AppRoutes.onboarding),
    (label: 'Onboarding carousel', route: AppRoutes.onboardingCarousel),
    (label: 'Onboarding intent', route: AppRoutes.onboardingIntent),
    (label: 'Name', route: AppRoutes.onboardingName),
    (label: 'KYC intro', route: AppRoutes.onboardingKycIntro),
    (label: 'Log in', route: AppRoutes.auth),
    (label: 'OTP', route: AppRoutes.authOtp),
    (label: 'Home', route: AppRoutes.home),
    (label: 'Search (shop)', route: AppRoutes.shop),
    (label: 'Shop search', route: AppRoutes.shopSearch),
    (label: 'New arrivals', route: AppRoutes.newArrivals),
    (label: 'Bag', route: AppRoutes.cart),
    (label: 'Dream Vault', route: AppRoutes.dreamVault),
    (label: 'Profile', route: AppRoutes.profile),
    (label: 'Product detail', route: '/shop/product/sample-necklace-1'),
    (label: 'Collection', route: '/shop/collection/sample-collection-1'),
    (label: 'Category', route: '/shop/category/sample-category-1'),
    (label: 'Occasion', route: '/shop/occasion/sample-occasion-1'),
    (label: 'Schemes', route: AppRoutes.goldenWish),
    (label: 'My Plans', route: AppRoutes.myPlans),
    (label: 'Aura plan detail', route: '/golden-wish/plans/aura'),
    (label: 'Plan detail · goal', route: '/goals/sample-goal-1'),
    (label: 'Start Aura · moment', route: AppRoutes.goalsCreateMoment),
    (label: 'My Gold', route: AppRoutes.myGold),
    (label: 'AI Advisor', route: AppRoutes.aura),
    (label: 'Aura goal planning', route: AppRoutes.auraGoalPlanning),
    (label: 'Orders', route: AppRoutes.orders),
    (label: 'Checkout', route: AppRoutes.checkout),
    (label: 'Notifications', route: AppRoutes.notifications),
    (label: 'Referrals', route: AppRoutes.referrals),
    (label: 'Store locator', route: AppRoutes.storeLocator),
    (label: 'Addresses', route: AppRoutes.profileAddresses),
    (label: 'KYC landing', route: AppRoutes.profileKyc),
  ];

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return const Scaffold(
        body: Center(child: Text('Not available in release builds.')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: AppTopBar.detail(title: 'All screens'),
      body: ListView.separated(
        padding: const EdgeInsets.all(AppSpacing.screenPadding),
        itemCount: _destinations.length + 1,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preview mode',
                    style: AppTypography.headingSM,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Signed in as Nikita Liby — no OTP or API needed. '
                    'Tap any screen below. For phone: open the same URL as this '
                    'tab on your Wi‑Fi (Flutter web, not Expo).',
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.maroonMuted,
                      height: 1.45,
                    ),
                  ),
                ],
              ),
            );
          }

          final item = _destinations[index - 1];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(item.label, style: AppTypography.uiBodyMD),
            subtitle: Text(
              item.route,
              style: AppTypography.uiCaption.copyWith(
                color: AppColors.maroonMuted,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: AppColors.maroonMuted),
            onTap: () => context.push(item.route),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/animations/fade_slide_in.dart';
import '../../core/animations/staggered_list_item.dart';
import '../../core/config/dev_preview.dart';
import '../../core/animations/premium_pressable.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/iconography.dart';
import '../../core/constants/motion.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/routing/app_routes.dart';
import '../../core/utils/contact_launcher.dart';
import '../brand/brand_monogram.dart';
import '../icons/app_icon.dart';
import '../icons/app_icons.dart';

/// Modern premium retail side drawer — crisp white, structured navigation.
class AppNavigationDrawer extends StatelessWidget {
  const AppNavigationDrawer({
    super.key,
    required this.userName,
    required this.memberSince,
  });

  final String userName;
  final int memberSince;

  static const double _widthFraction = 0.85;

  static const List<({String label, String route})> _primary = [
    (label: 'Home', route: AppRoutes.home),
    (label: 'Shop', route: AppRoutes.shop),
    (label: 'Schemes', route: AppRoutes.goldenWish),
    (label: 'AI Advisor', route: AppRoutes.aura),
    (label: 'Profile', route: AppRoutes.profile),
  ];

  static const List<({String label, String route})> _secondary = [
    (label: 'Dream Vault', route: AppRoutes.dreamVault),
    (label: 'My Gold', route: AppRoutes.myGold),
    (label: 'My Plans', route: AppRoutes.myPlans),
    (label: 'Store Locator', route: AppRoutes.storeLocator),
    (label: 'Orders', route: AppRoutes.orders),
    (label: 'Help & Contact', route: AppRoutes.storeLocator),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final location = GoRouterState.of(context).uri.path;

    return Drawer(
      width: screenWidth * _widthFraction,
      backgroundColor: AppColors.bgWhite,
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          border: const Border(
            right: BorderSide(color: AppColors.border, width: 0.5),
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowSoft,
              blurRadius: 24,
              offset: Offset(8, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              AppSpacing.lg,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeSlideIn(
                  duration: AppMotion.fast,
                  offsetY: 6,
                  child: _DrawerHeader(
                    userName: userName,
                    memberSince: memberSince,
                    onClose: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                const FadeSlideIn(
                  delay: Duration(milliseconds: 30),
                  duration: AppMotion.fast,
                  child: Divider(height: 1, color: AppColors.border),
                ),
                const SizedBox(height: AppSpacing.md),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      StaggeredListItem(
                        index: 0,
                        baseDelay: const Duration(milliseconds: 50),
                        child: const _DrawerSectionLabel(label: 'Menu'),
                      ),
                      for (var i = 0; i < _primary.length; i++)
                        StaggeredListItem(
                          index: i + 1,
                          baseDelay: const Duration(milliseconds: 50),
                          child: _DrawerNavItem(
                            label: _primary[i].label,
                            route: _primary[i].route,
                            isActive:
                                _isRouteActive(location, _primary[i].route),
                            primary: true,
                          ),
                        ),
                      const SizedBox(height: AppSpacing.md),
                      StaggeredListItem(
                        index: _primary.length + 1,
                        baseDelay: const Duration(milliseconds: 50),
                        child: const _DrawerSectionLabel(label: 'More'),
                      ),
                      for (var i = 0; i < _secondary.length; i++)
                        StaggeredListItem(
                          index: _primary.length + 2 + i,
                          baseDelay: const Duration(milliseconds: 50),
                          child: _DrawerNavItem(
                            label: _secondary[i].label,
                            route: _secondary[i].route,
                            isActive:
                                _isRouteActive(location, _secondary[i].route),
                            primary: false,
                            showChevron: _secondary[i].label == 'Help',
                          ),
                        ),
                      if (DevPreview.enabled)
                        StaggeredListItem(
                          index: _primary.length + _secondary.length + 2,
                          baseDelay: const Duration(milliseconds: 50),
                          child: _DrawerNavItem(
                            label: 'All screens',
                            route: AppRoutes.devScreens,
                            isActive: location == AppRoutes.devScreens,
                            primary: false,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                FadeSlideIn(
                  delay: const Duration(milliseconds: 280),
                  duration: AppMotion.normal,
                  offsetY: 8,
                  child: _DrawerShowroomCard(
                    onVisitStore: () {
                      Navigator.of(context).pop();
                      context.push(AppRoutes.storeLocator);
                    },
                    onCall: () async {
                      Navigator.of(context).pop();
                      final launched = await ContactLauncher.callShowroom();
                      if (!launched && context.mounted) {
                        ContactLauncher.showLaunchError(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static bool _isRouteActive(String location, String route) {
    if (location == route) return true;
    if (route == AppRoutes.home) return location == '/';
    return location.startsWith('$route/');
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    required this.userName,
    required this.memberSince,
    required this.onClose,
  });

  final String userName;
  final int memberSince;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const BrandMonogram(height: 24),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Moozhayil',
                    style: AppTypography.uiBodyMD.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.2,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (userName != 'Guest') ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  userName,
                  style: AppTypography.uiBodySM.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Member since $memberSince',
                  style: AppTypography.uiCaption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onClose,
          child: const Padding(
            padding: EdgeInsets.all(AppSpacing.xxs),
            child: AppIcon(
              AppIcons.close,
              size: AppIconography.sizeMd,
              color: AppIconography.subtle,
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerSectionLabel extends StatelessWidget {
  const _DrawerSectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.xs,
        0,
        AppSpacing.xs,
        AppSpacing.sm,
      ),
      child: Text(
        label.toUpperCase(),
        style: AppTypography.uiMicro.copyWith(
          color: AppColors.textMuted,
          letterSpacing: 9 * 0.22,
        ),
      ),
    );
  }
}

class _DrawerNavItem extends StatelessWidget {
  const _DrawerNavItem({
    required this.label,
    required this.route,
    required this.isActive,
    required this.primary,
    this.showChevron = false,
  });

  final String label;
  final String route;
  final bool isActive;
  final bool primary;
  final bool showChevron;

  @override
  Widget build(BuildContext context) {
    final textStyle = primary
        ? AppTypography.drawerNavPrimary(
            color: isActive ? AppColors.brandBurgundy : AppColors.textPrimary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          )
        : AppTypography.drawerNavSecondary(
            color: isActive ? AppColors.brandBurgundy : AppColors.textSecondary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          );

    return PremiumPressable(
      onTap: () {
        Navigator.of(context).pop();
        context.go(route);
      },
      scaleEnd: 0.99,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.xs,
            vertical: primary ? 9 : 7,
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: AppMotion.fast,
                width: 3,
                height: primary ? 18 : 14,
                margin: const EdgeInsets.only(right: AppSpacing.sm),
                color: isActive ? AppColors.brandBurgundy : Colors.transparent,
              ),
              Expanded(child: Text(label, style: textStyle)),
              if (showChevron)
                const AppIcon(
                  AppIcons.chevronRight,
                  size: AppIconography.sizeSm,
                  color: AppIconography.subtle,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerShowroomCard extends StatelessWidget {
  const _DrawerShowroomCard({
    required this.onVisitStore,
    required this.onCall,
  });

  final VoidCallback onVisitStore;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.bgWhite,
        border: Border.all(color: AppColors.border, width: 0.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowSoft,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SHOWROOM',
            style: AppTypography.uiMicro.copyWith(
              color: AppColors.gold,
              letterSpacing: 9 * 0.22,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Moozhayil Showroom',
            style: AppTypography.uiBodyMD.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'Pala, Kerala',
            style: AppTypography.uiBodySM.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          Text(
            'Mon–Sat · 10am–7pm',
            style: AppTypography.uiBodySM.copyWith(
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: _DrawerFooterAction(
                  label: 'Visit Store',
                  onTap: onVisitStore,
                  filled: true,
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: _DrawerFooterAction(
                  label: 'Call',
                  onTap: onCall,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DrawerFooterAction extends StatelessWidget {
  const _DrawerFooterAction({
    required this.label,
    required this.onTap,
    this.filled = false,
  });

  final String label;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: filled ? AppColors.brandBurgundy : AppColors.bgWhite,
          border: filled
              ? null
              : Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Text(
          label,
          style: AppTypography.uiBodySM.copyWith(
            fontWeight: FontWeight.w600,
            color: filled ? AppColors.cream : AppColors.brandBurgundy,
          ),
        ),
      ),
    );
  }
}

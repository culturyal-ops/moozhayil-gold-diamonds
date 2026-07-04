import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/iconography.dart';
import '../../core/constants/motion.dart';
import '../../core/constants/typography.dart';
import '../icons/app_icon.dart';
import '../icons/app_icons.dart';
import '../surfaces/glass_surface.dart';

class TabItem {
  const TabItem({
    required this.label,
    required this.branchIndex,
    required this.icon,
    this.navLabel,
  });

  final String label;
  final int branchIndex;
  final IconData icon;
  final String? navLabel;
}

/// Home · Shop · Schemes · AI Advisor · Profile
class AppBottomTabBar extends StatelessWidget {
  const AppBottomTabBar({
    super.key,
    required this.currentBranchIndex,
    required this.onSelect,
  });

  final int currentBranchIndex;
  final void Function(int branchIndex) onSelect;

  static const List<TabItem> _tabs = [
    TabItem(label: 'Home', branchIndex: 0, icon: AppIcons.home),
    TabItem(label: 'Shop', branchIndex: 1, icon: AppIcons.shop),
    TabItem(label: 'Schemes', branchIndex: 2, icon: AppIcons.schemes),
    TabItem(
      label: 'AI Advisor',
      branchIndex: 3,
      icon: AppIcons.advisor,
      navLabel: 'Advisor',
    ),
    TabItem(label: 'Profile', branchIndex: 4, icon: AppIcons.profile),
  ];

  @override
  Widget build(BuildContext context) {
    return GlassSurface(
      showTopBorder: true,
      blurSigma: 20,
      elevated: true,
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 56,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final tabWidth = constraints.maxWidth / _tabs.length;
              return Stack(
                children: [
                  AnimatedPositioned(
                    duration: AppMotion.navIndicator,
                    curve: AppMotion.standard,
                    left: currentBranchIndex * tabWidth +
                        (tabWidth - 24) / 2,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 2,
                      color: AppColors.gold,
                    ),
                  ),
                  Row(
                    children: [
                      for (final tab in _tabs)
                        Expanded(
                          child: _Tab(
                            item: tab,
                            isActive: tab.branchIndex == currentBranchIndex,
                            onTap: () => onSelect(tab.branchIndex),
                          ),
                        ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    required this.item,
    required this.isActive,
    required this.onTap,
  });

  final TabItem item;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color =
        isActive ? AppIconography.active : AppIconography.inactive;
    final navText = (item.navLabel ?? item.label).toUpperCase();

    return Semantics(
      button: true,
      label: item.label,
      selected: isActive,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 2),
            const SizedBox(height: 6),
            AnimatedScale(
              scale: isActive ? AppMotion.navActiveScale : 1,
              duration: AppMotion.navIndicator,
              curve: AppMotion.standard,
              child: AppIcon(
                item.icon,
                size: AppIconography.sizeMd,
                color: color,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: AppMotion.navIndicator,
              curve: AppMotion.standard,
              style: AppTypography.uiMicro.copyWith(
                fontSize: 9,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                letterSpacing: 1.6,
                color: color,
              ),
              child: Text(navText),
            ),
          ],
        ),
      ),
    );
  }
}

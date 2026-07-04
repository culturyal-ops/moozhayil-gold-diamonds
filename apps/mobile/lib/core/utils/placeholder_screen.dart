import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';
import '../constants/typography.dart';
import '../../components/navigation/top_app_bar.dart';

/// Temporary placeholder screen used for all routes not yet implemented.
/// Every placeholder will be replaced with the real screen in a future phase.
///
/// This widget is intentionally simple: it shows the route path and a
/// "coming soon" note so routes can be navigated and tested end-to-end.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    this.hasBackButton = true,
  });

  final String title;
  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      appBar: hasBackButton ? AppTopBar.detail(title: title) : null,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: AppTypography.headingMD.copyWith(
                  color: AppColors.obsidian,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Implementation coming in a future phase.',
                style: AppTypography.uiLabel.copyWith(
                  color: AppColors.slateMist,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.lg),
              if (hasBackButton && context.canPop())
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    '← Back',
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.antiqueGold,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

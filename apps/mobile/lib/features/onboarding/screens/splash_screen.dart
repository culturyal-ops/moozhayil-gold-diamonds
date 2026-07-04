import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/brand/brand_monogram.dart';
import '../../../components/buttons/primary_button.dart';
import '../../../components/buttons/secondary_button.dart';
import '../../../components/editorial/editorial_image.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/utils/sample_imagery.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.warmIvory,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 11,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  EditorialImage(
                    url: SampleImagery.hero(width: 1600),
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.maroonSoft.withValues(alpha: 0.25),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.screenPaddingLG),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BrandMonogram.hero(height: 96),
                    const SizedBox(height: AppSpacing.lg),
                    Text(
                      'Gold for the moments\nthat matter.',
                      style: AppTypography.headingXL.copyWith(
                        color: AppColors.maroonDeep,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'Luxury jewellery with transparent gold pricing and calm, editorial discovery.',
                      style: AppTypography.uiBodyMD.copyWith(
                        color: AppColors.maroonMuted,
                        height: 1.5,
                      ),
                    ),
                    const Spacer(),
                    PrimaryButton(
                      label: 'Get started',
                      isFullWidth: true,
                      onTap: () => context.push(AppRoutes.onboardingCarousel),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    SecondaryButton(
                      label: 'Sign in',
                      isFullWidth: true,
                      onTap: () => context.go(AppRoutes.auth),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

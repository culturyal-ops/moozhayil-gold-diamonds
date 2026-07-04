import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../components/icons/app_icon.dart';

import '../../../components/icons/app_icons.dart';

import '../../../core/animations/fade_slide_in.dart';

import '../../../core/animations/premium_pressable.dart';

import '../../../core/constants/colors.dart';

import '../../../core/constants/motion.dart';

import '../../../core/constants/showroom_contact.dart';

import '../../../core/constants/spacing.dart';

import '../../../core/constants/typography.dart';

import '../../../core/models/product.dart';

import '../../../core/routing/app_routes.dart';

import '../../../core/utils/contact_launcher.dart';

/// Product-level video consultation sheet — WhatsApp / call / store in v1.

Future<void> showProductVideoCallBottomSheet(
  BuildContext context, {

  required Product product,
}) {
  return showModalBottomSheet<void>(
    context: context,

    backgroundColor: Colors.transparent,

    barrierColor: AppColors.ink.withValues(alpha: 0.42),

    isScrollControlled: true,

    builder: (context) => _ProductVideoCallBottomSheet(product: product),
  );
}

class _ProductVideoCallBottomSheet extends StatelessWidget {
  const _ProductVideoCallBottomSheet({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return FadeSlideIn(
      duration: AppMotion.normal,

      offsetY: 16,

      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColors.bgWhite,

          boxShadow: [
            BoxShadow(
              color: AppColors.shadowSoft,

              blurRadius: 24,

              offset: Offset(0, -8),
            ),
          ],
        ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(
            AppSpacing.lg,

            AppSpacing.md,

            AppSpacing.lg,

            bottomInset + AppSpacing.lg,
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(
                child: Container(
                  width: AppSpacing.bottomSheetHandleWidth,

                  height: AppSpacing.bottomSheetHandleHeight,

                  decoration: BoxDecoration(
                    color: AppColors.border,

                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              Text(
                'Book a video call',

                style: AppTypography.headingSM.copyWith(
                  fontSize: 22,

                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.xs),

              Text(
                product.name,

                style: AppTypography.uiBodyMD.copyWith(
                  fontWeight: FontWeight.w600,

                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              Text(
                'Our team can show this piece live and answer your questions.',

                style: AppTypography.uiBodySM.copyWith(
                  color: AppColors.textSecondary,

                  height: 1.55,
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              FadeSlideIn(
                delay: const Duration(milliseconds: 60),

                duration: AppMotion.normal,

                offsetY: 8,

                child: _ConsultationAction(
                  icon: AppIcons.videoCall,

                  label: 'WhatsApp showroom',

                  subtitle: 'Request a live video consultation',

                  onTap: () async {
                    final message =
                        'Hi, I would like to book a video call to view ${product.name}.';

                    final ok = await ContactLauncher.openWhatsApp(
                      message: message,
                    );

                    if (!context.mounted) return;

                    if (ok) {
                      Navigator.of(context).pop();
                    } else {
                      ContactLauncher.showLaunchError(context);
                    }
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              FadeSlideIn(
                delay: const Duration(milliseconds: 100),

                duration: AppMotion.normal,

                offsetY: 8,

                child: _ConsultationAction(
                  icon: AppIcons.phone,

                  label: 'Call showroom',

                  subtitle: ShowroomContact.phoneDisplay,

                  onTap: () async {
                    final ok = await ContactLauncher.callShowroom();

                    if (!context.mounted) return;

                    if (ok) {
                      Navigator.of(context).pop();
                    } else {
                      ContactLauncher.showLaunchError(context);
                    }
                  },
                ),
              ),

              const SizedBox(height: AppSpacing.sm),

              FadeSlideIn(
                delay: const Duration(milliseconds: 140),

                duration: AppMotion.normal,

                offsetY: 8,

                child: _ConsultationAction(
                  icon: AppIcons.store,

                  label: 'Visit store',

                  subtitle:
                      '${ShowroomContact.name} · ${ShowroomContact.cityLine}',

                  onTap: () {
                    Navigator.of(context).pop();

                    context.push(AppRoutes.storeLocator);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ConsultationAction extends StatelessWidget {
  const _ConsultationAction({
    required this.icon,

    required this.label,

    required this.subtitle,

    required this.onTap,
  });

  final IconData icon;

  final String label;

  final String subtitle;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return PremiumPressable(
      onTap: onTap,

      scaleEnd: 0.99,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,

          vertical: AppSpacing.sm,
        ),

        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 0.5),
        ),

        child: Row(
          children: [
            AppIcon(icon, size: 20, color: AppColors.brandBurgundy),

            const SizedBox(width: AppSpacing.sm),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    label,

                    style: AppTypography.uiBodyMD.copyWith(
                      fontWeight: FontWeight.w600,

                      color: AppColors.textPrimary,
                    ),
                  ),

                  Text(
                    subtitle,

                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            const AppIcon(
              AppIcons.chevronRight,

              size: 18,

              color: AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}

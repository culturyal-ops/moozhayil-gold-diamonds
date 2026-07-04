import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../components/icons/plan_monogram_seal.dart';
import '../../../core/animations/fade_slide_in.dart';

import '../../../core/animations/premium_pressable.dart';

import '../../../core/constants/colors.dart';

import '../../../core/constants/motion.dart';

import '../../../core/constants/spacing.dart';

import '../../../core/constants/typography.dart';

import '../../../core/routing/app_routes.dart';

import '../../golden_wish/models/golden_wish_plan.dart';

import '../../golden_wish/widgets/plan_accent.dart';

import 'carousel_dots.dart';

import 'home_section_inset.dart';

/// Premium Schemes campaign carousel — strong burgundy anchor on Home.

class SchemesBannerCarousel extends StatefulWidget {
  const SchemesBannerCarousel({super.key});

  @override
  State<SchemesBannerCarousel> createState() => _SchemesBannerCarouselState();
}

class _SchemesBannerCarouselState extends State<SchemesBannerCarousel> {
  late final PageController _controller;

  int _index = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(viewportFraction: 0.9);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomeSectionInset(
      top: 8,

      bottom: 48,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          HomeSectionHeader(
            eyebrow: 'Moozhayil',

            title: 'Schemes',

            actionLabel: 'View all',

            onAction: () => context.go(AppRoutes.goldenWish),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: AppSpacing.x3l * 3,

            child: PageView.builder(
              controller: _controller,

              itemCount: goldenWishPlans.length,

              onPageChanged: (i) => setState(() => _index = i),

              itemBuilder: (context, index) {
                final plan = goldenWishPlans[index];

                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),

                  child: _SchemeBannerCard(
                    key: ValueKey(plan.id),

                    plan: plan,

                    animate: index == _index,

                    onExplore: () => context.go(AppRoutes.goldenWish),

                    onPlanTap: () => context.push(
                      AppRoutes.goldenWishPlanDetail(plan.routeSlug),
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: AppSpacing.sm),

          CarouselDots(
            count: goldenWishPlans.length,

            index: _index,

            activeColor: AppColors.gold,
          ),
        ],
      ),
    );
  }
}

class _SchemeBannerCard extends StatefulWidget {
  const _SchemeBannerCard({
    super.key,

    required this.plan,

    required this.animate,

    required this.onExplore,

    required this.onPlanTap,
  });

  final GoldenWishPlan plan;

  final bool animate;

  final VoidCallback onExplore;

  final VoidCallback onPlanTap;

  @override
  State<_SchemeBannerCard> createState() => _SchemeBannerCardState();
}

class _SchemeBannerCardState extends State<_SchemeBannerCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _lineController;

  late final Animation<double> _lineReveal;

  @override
  void initState() {
    super.initState();

    _lineController = AnimationController(
      vsync: this,

      duration: AppMotion.slow,
    );

    _lineReveal = CurvedAnimation(
      parent: _lineController,

      curve: AppMotion.emphasized,
    );

    if (widget.animate) {
      _lineController.forward();
    }
  }

  @override
  void didUpdateWidget(_SchemeBannerCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!oldWidget.animate && widget.animate) {
      _lineController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _lineController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accent = PlanAccent.forPlan(widget.plan.id);

    final isPrimary =
        widget.plan.id == GoldenWishPlanId.aura ||
        widget.plan.id == GoldenWishPlanId.dhanam;

    final background = isPrimary ? AppColors.burgundyDeep : accent.background;

    final titleColor = isPrimary ? AppColors.cream : accent.titleColor;

    final bodyColor = isPrimary
        ? AppColors.cream.withValues(alpha: 0.78)
        : accent.bodyColor;

    final accentColor = isPrimary ? AppColors.goldLight : accent.accent;

    return PremiumPressable(
      onTap: widget.onPlanTap,

      scaleEnd: AppMotion.pressScale,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.all(AppSpacing.md),

        decoration: BoxDecoration(
          color: background,

          border: Border(
            top: BorderSide(
              color: isPrimary
                  ? AppColors.gold.withValues(alpha: 0.25)
                  : accent.borderColor,

              width: 0.5,
            ),

            right: BorderSide(
              color: isPrimary
                  ? AppColors.gold.withValues(alpha: 0.25)
                  : accent.borderColor,

              width: 0.5,
            ),

            bottom: BorderSide(
              color: isPrimary
                  ? AppColors.gold.withValues(alpha: 0.25)
                  : accent.borderColor,

              width: 0.5,
            ),
          ),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            AnimatedBuilder(
              animation: _lineReveal,

              builder: (_, _) {
                return Align(
                  alignment: Alignment.topCenter,

                  child: Container(
                    width: 4,

                    height: (AppSpacing.x3l * 2.2) * _lineReveal.value,

                    color: AppColors.gold,
                  ),
                );
              },
            ),

            const SizedBox(width: AppSpacing.sm),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      if (widget.animate)
                        FadeSlideIn(
                          duration: AppMotion.normal,

                          offsetY: 8,

                          child: Row(
                            children: [
                              PlanMonogramSeal(
                                letter: accent.monogram,
                                accentColor: accentColor,
                                size: 24,
                                backgroundColor: isPrimary
                                    ? AppColors.burgundyDeep
                                    : accent.background,
                                borderColor: accentColor.withValues(alpha: 0.5),
                              ),

                              const SizedBox(width: 6),

                              Text(
                                widget.plan.title.toUpperCase(),

                                style: AppTypography.uiMicro.copyWith(
                                  color: accentColor,

                                  fontSize: 10,

                                  fontWeight: FontWeight.w500,

                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        Row(
                          children: [
                            PlanMonogramSeal(
                              letter: accent.monogram,
                              accentColor: accentColor,
                              size: 24,
                              backgroundColor: isPrimary
                                  ? AppColors.burgundyDeep
                                  : accent.background,
                              borderColor: accentColor.withValues(alpha: 0.5),
                            ),

                            const SizedBox(width: 6),

                            Text(
                              widget.plan.title.toUpperCase(),

                              style: AppTypography.uiMicro.copyWith(
                                color: accentColor,

                                fontSize: 10,

                                fontWeight: FontWeight.w500,

                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 6),

                      if (widget.animate)
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 60),

                          duration: AppMotion.normal,

                          offsetY: 10,

                          child: Text(
                            widget.plan.tagline,

                            style: AppTypography.headingSM.copyWith(
                              color: titleColor,

                              fontSize: 18,
                            ),

                            maxLines: 1,

                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      else
                        Text(
                          widget.plan.tagline,

                          style: AppTypography.headingSM.copyWith(
                            color: titleColor,

                            fontSize: 18,
                          ),

                          maxLines: 1,

                          overflow: TextOverflow.ellipsis,
                        ),

                      const SizedBox(height: 4),

                      if (widget.animate)
                        FadeSlideIn(
                          delay: const Duration(milliseconds: 120),

                          duration: AppMotion.normal,

                          offsetY: 10,

                          child: Text(
                            widget.plan.summary,

                            style: AppTypography.uiBodySM.copyWith(
                              color: bodyColor,

                              height: 1.3,

                              fontSize: 11,
                            ),

                            maxLines: 2,

                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      else
                        Text(
                          widget.plan.summary,

                          style: AppTypography.uiBodySM.copyWith(
                            color: bodyColor,

                            height: 1.3,

                            fontSize: 11,
                          ),

                          maxLines: 2,

                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),

                  if (widget.animate)
                    FadeSlideIn(
                      delay: const Duration(milliseconds: 180),

                      duration: AppMotion.fast,

                      offsetY: 6,

                      child: GestureDetector(
                        onTap: widget.onExplore,

                        child: Text(
                          'EXPLORE SCHEMES →',

                          style: AppTypography.buttonLabelSM.copyWith(
                            color: accentColor,

                            fontSize: 10,

                            fontWeight: FontWeight.w500,

                            letterSpacing: 1.6,
                          ),
                        ),
                      ),
                    )
                  else
                    GestureDetector(
                      onTap: widget.onExplore,

                      child: Text(
                        'EXPLORE SCHEMES →',

                        style: AppTypography.buttonLabelSM.copyWith(
                          color: accentColor,

                          fontSize: 10,

                          fontWeight: FontWeight.w500,

                          letterSpacing: 1.6,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

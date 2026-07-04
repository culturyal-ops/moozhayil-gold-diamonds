import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/animations/premium_pressable.dart';
import '../../../components/editorial/editorial_image.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/motion.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/utils/catalog_imagery.dart';
import 'home_section_inset.dart';

/// Presentation-only Moozhayil house brands for the home screen.
class HomeBrand {
  const HomeBrand({
    required this.name,
    required this.imageKey,
    required this.tagline,
    this.imageAlignment = Alignment.center,
    this.useProductImagery = true,
  });

  final String name;
  final String imageKey;
  final String tagline;
  final Alignment imageAlignment;
  final bool useProductImagery;
}

const homeBrands = <HomeBrand>[
  HomeBrand(
    name: 'TAYA',
    imageKey: 'luna',
    tagline: 'Lightweight collections',
    imageAlignment: Alignment(0, -0.15),
  ),
  HomeBrand(
    name: 'ROSETTE',
    imageKey: 'celeste',
    tagline: '18KT everyday fine jewellery',
    imageAlignment: Alignment(0, -0.1),
  ),
  HomeBrand(
    name: 'PENTAI',
    imageKey: 'temple',
    tagline: 'High-fashion jewellery craft',
    imageAlignment: Alignment(0, -0.08),
  ),
  HomeBrand(
    name: 'RARE',
    imageKey: '1605100804763-247f67b3557e',
    tagline: 'Certified diamonds',
    imageAlignment: Alignment(0, -0.12),
  ),
];

/// Horizontal image-led brand carousel.
class BrandCarousel extends StatelessWidget {
  const BrandCarousel({super.key});

  static const _cardWidth = 172.0;
  static const _cardHeight = 224.0;

  @override
  Widget build(BuildContext context) {
    return HomeSectionInset(
      top: 4,
      bottom: 48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HomeSectionHeader(
            eyebrow: 'House of Moozhayil',
            title: 'Our Brands',
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: _cardHeight + 4,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              padding: const EdgeInsets.only(bottom: 4),
              itemCount: homeBrands.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
              itemBuilder: (context, index) {
                final brand = homeBrands[index];
                return RepaintBoundary(
                  child: _BrandCard(
                    brand: brand,
                    width: _cardWidth,
                    height: _cardHeight,
                    onTap: () => context.push(AppRoutes.shopSearch),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard({
    required this.brand,
    required this.width,
    required this.height,
    required this.onTap,
  });

  final HomeBrand brand;
  final double width;
  final double height;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = brand.useProductImagery
        ? CatalogImagery.resolveProduct(null, brand.imageKey)
        : CatalogImagery.resolveEditorial(null, brand.imageKey);

    return PremiumPressable(
      onTap: onTap,
      scaleEnd: AppMotion.cardPressScale,
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            EditorialImage(url: imageUrl, alignment: brand.imageAlignment),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.ink.withValues(alpha: 0.35),
                    AppColors.ink.withValues(alpha: 0.9),
                  ],
                  stops: const [0.42, 0.72, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(width: 2, color: AppColors.gold),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    brand.name,
                    style: AppTypography.headingSM.copyWith(
                      color: AppColors.cream,
                      fontSize: 22,
                      letterSpacing: 3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand.tagline,
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.cream.withValues(alpha: 0.82),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.35,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'EXPLORE',
                    style: AppTypography.uiMicro.copyWith(
                      color: AppColors.goldLight,
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0,
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

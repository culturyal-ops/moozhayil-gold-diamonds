import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/models/product.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/utils/cms_navigation.dart';
import '../../core/utils/sample_imagery.dart';
import '../cards/product_card.dart';
import 'editorial_image.dart';
import 'editorial_inset.dart';
import 'section_header.dart';

/// Horizontal editorial banner rail — CMS-driven "The Edit" sections.
class EditorialBannerRail extends StatelessWidget {
  const EditorialBannerRail({
    super.key,
    required this.banners,
    this.eyebrow = 'The edit',
    this.title = 'Curated for you',
  });

  final List<CmsBanner> banners;
  final String eyebrow;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (banners.isEmpty) return const SizedBox.shrink();

    return EditorialInset(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(eyebrow: eyebrow, title: title),
          const SizedBox(height: AppSpacing.lg),
          SizedBox(
            height: 280,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: banners.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                return EditorialBannerTile(banner: banners[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Single editorial banner card in a horizontal rail.
class EditorialBannerTile extends StatelessWidget {
  const EditorialBannerTile({super.key, required this.banner});

  final CmsBanner banner;

  @override
  Widget build(BuildContext context) {
    final imageUrl = SampleImagery.editorialOr(
      banner.imageUrl,
      banner.id,
      width: 800,
    );

    return GestureDetector(
      onTap: () => navigateCmsRoute(context, banner.ctaRoute),
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 200,
        height: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  EditorialImage(url: imageUrl),
                  const ColoredBox(color: Color(0x1A1C1612)),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              banner.title,
              style: AppTypography.headingSM.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 16,
                height: 1.15,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (banner.ctaLabel != null) ...[
              const SizedBox(height: 2),
              Text(
                banner.ctaLabel!.toUpperCase(),
                style: AppTypography.uiMicro.copyWith(
                  fontSize: 8,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 8 * 0.18,
                  color: AppColors.gold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Full-bleed CMS feature band — ink overlay, ghost CTA, square corners.
class EditorialCmsFeatureBand extends StatelessWidget {
  const EditorialCmsFeatureBand({
    super.key,
    required this.banner,
    this.subtitle,
    this.height,
  });

  final CmsBanner banner;
  final String? subtitle;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bandHeight = height ?? MediaQuery.sizeOf(context).height * 0.52;
    final imageUrl = SampleImagery.editorialOr(
      banner.imageUrl,
      banner.id,
      width: 1400,
    );
    final titleParts = banner.title.split('\n');
    final lineOne = titleParts.first;
    final lineTwo = titleParts.length > 1 ? titleParts.sublist(1).join(' ') : null;

    return GestureDetector(
      onTap: () => navigateCmsRoute(context, banner.ctaRoute),
      child: SizedBox(
        height: bandHeight,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            EditorialImage(url: imageUrl, alignment: const Alignment(0, -0.3)),
            const ColoredBox(color: Color(0x731C1612)),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.lg,
                AppSpacing.lg,
                AppSpacing.lg,
                36,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lineOne,
                    style: AppTypography.displayLG.copyWith(
                      color: AppColors.paper,
                      height: 1.05,
                    ),
                  ),
                  if (lineTwo != null)
                    Text(
                      lineTwo,
                      style: AppTypography.displayItalic(
                        36,
                        color: AppColors.paper,
                      ),
                    ),
                  if (subtitle != null) ...[
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      subtitle!,
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.paper.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                  if (banner.ctaLabel != null) ...[
                    const SizedBox(height: AppSpacing.lg),
                    _GhostCta(label: banner.ctaLabel!),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Compact split banner — image left, copy right (stacked on narrow screens).
class EditorialSplitBanner extends StatelessWidget {
  const EditorialSplitBanner({super.key, required this.banner});

  final CmsBanner banner;

  @override
  Widget build(BuildContext context) {
    final imageUrl = SampleImagery.editorialOr(
      banner.imageUrl,
      banner.id,
      width: 900,
    );

    return GestureDetector(
      onTap: () => navigateCmsRoute(context, banner.ctaRoute),
      behavior: HitTestBehavior.opaque,
      child: ColoredBox(
        color: AppColors.ink,
        child: Row(
          children: [
            Expanded(
              flex: 11,
              child: AspectRatio(
                aspectRatio: 4 / 5,
                child: EditorialImage(url: imageUrl),
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      banner.title.toUpperCase(),
                      style: AppTypography.uiMicro.copyWith(
                        color: AppColors.gold,
                        letterSpacing: 9 * 0.28,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      banner.title,
                      style: AppTypography.headingMD.copyWith(
                        color: AppColors.paper,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    if (banner.ctaLabel != null) ...[
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        '${banner.ctaLabel} →',
                        style: AppTypography.uiMicro.copyWith(
                          fontSize: 9,
                          fontWeight: FontWeight.w300,
                          color: AppColors.goldLight,
                          letterSpacing: 9 * 0.22,
                        ),
                      ),
                    ],
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

/// Horizontal product rail for editor's picks / trending.
class EditorialProductRail extends StatelessWidget {
  const EditorialProductRail({
    super.key,
    required this.products,
    required this.onProductTap,
    this.eyebrow = 'Just in',
    this.title = 'Editor\u2019s picks',
    this.actionLabel = 'View all',
    this.onAction,
  });

  final List<Product> products;
  final void Function(Product product) onProductTap;
  final String eyebrow;
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    return EditorialInset(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionHeader(
            eyebrow: eyebrow,
            title: title,
            actionLabel: actionLabel,
            onAction: onAction,
          ),
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            height: AppSpacing.x3l * 4 + AppSpacing.md,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: products.length > 8 ? 8 : products.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final product = products[index];
                return SizedBox(
                  width: AppSpacing.x3l * 3 + AppSpacing.lg,
                  child: ProductCard(
                    product: product,
                    variant: ProductCardVariant.horizontal,
                    onTap: () => onProductTap(product),
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

class _GhostCta extends StatelessWidget {
  const _GhostCta({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.gold.withValues(alpha: 0.7),
          width: 0.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: 10,
        ),
        child: Text(
          label.toUpperCase(),
          style: GoogleFonts.inter(
            fontSize: 9,
            fontWeight: FontWeight.w300,
            letterSpacing: 9 * 0.22,
            color: AppColors.goldLight,
          ),
        ),
      ),
    );
  }
}

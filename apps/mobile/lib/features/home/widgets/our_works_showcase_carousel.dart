import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/editorial/editorial_image.dart';
import '../../../core/animations/premium_pressable.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/motion.dart';
import '../../../core/constants/radii.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/product.dart';
import '../../../core/routing/app_routes.dart';
import '../../../core/utils/catalog_imagery.dart';
import 'carousel_dots.dart';

/// Signature piece for the editorial "Our Works" portfolio carousel.
class OurWorkItem {
  const OurWorkItem({
    required this.title,
    required this.category,
    required this.productId,
    required this.imageUrl,
  });

  final String title;
  final String category;
  final String productId;
  final String imageUrl;

  factory OurWorkItem.fromProduct(Product product) {
    return OurWorkItem(
      title: product.name.toUpperCase(),
      category: product.category?.name ?? 'Jewellery',
      productId: product.id,
      imageUrl: CatalogImagery.resolveProduct(product.primaryImage, product.id),
    );
  }
}

List<OurWorkItem> ourWorksFromProducts(List<Product> products) {
  if (products.isEmpty) return _fallbackWorks;
  return products.take(6).map(OurWorkItem.fromProduct).toList();
}

const _fallbackWorks = <OurWorkItem>[
  OurWorkItem(
    title: 'LUNA STUD EARRINGS',
    category: 'Earrings',
    productId: 'sample-luna-earrings',
    imageUrl: '',
  ),
  OurWorkItem(
    title: 'CELESTE NECKLACE',
    category: 'Necklaces',
    productId: 'sample-celeste-necklace',
    imageUrl: '',
  ),
  OurWorkItem(
    title: 'TEMPLE NECKLACE SET',
    category: 'Bridal',
    productId: 'sample-temple-set',
    imageUrl: '',
  ),
  OurWorkItem(
    title: 'HALF ROUND BAND',
    category: 'Rings',
    productId: 'sample-half-round-band',
    imageUrl: '',
  ),
  OurWorkItem(
    title: 'GINKGO PENDANT',
    category: 'Pendant',
    productId: 'sample-ginkgo-pendant',
    imageUrl: '',
  ),
];

/// Premium portfolio carousel — center-focused editorial showcase.
class OurWorksShowcaseCarousel extends StatefulWidget {
  const OurWorksShowcaseCarousel({super.key, required this.items});

  final List<OurWorkItem> items;

  @override
  State<OurWorksShowcaseCarousel> createState() =>
      _OurWorksShowcaseCarouselState();
}

class _OurWorksShowcaseCarouselState extends State<OurWorksShowcaseCarousel> {
  static const _viewportFraction = 0.68;

  late final PageController _controller;
  int _index = 0;

  List<OurWorkItem> get _items =>
      widget.items.isEmpty ? _fallbackWorks : widget.items;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: _viewportFraction);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _goTo(int index) {
    final target = index.clamp(0, _items.length - 1);
    _controller.animateToPage(
      target,
      duration: const Duration(milliseconds: 340),
      curve: AppMotion.standard,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.ink,
        border: Border(
          top: BorderSide(
            color: AppColors.gold.withValues(alpha: 0.22),
            width: 0.5,
          ),
          bottom: BorderSide(
            color: AppColors.gold.withValues(alpha: 0.15),
            width: 0.5,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 44, 0, 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.homeScreenPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 2,
                        color: AppColors.gold.withValues(alpha: 0.85),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        'SIGNATURE PIECES',
                        style: AppTypography.uiMicro.copyWith(
                          color: AppColors.goldLight,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    'Our Works',
                    style: AppTypography.headingLG.copyWith(
                      fontSize: 32,
                      height: 1.05,
                      color: AppColors.cream,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Signature pieces, crafted moments, and Moozhayil favourites.',
                    style: AppTypography.uiBodySM.copyWith(
                      color: AppColors.cream.withValues(alpha: 0.72),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 300,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  return PageView.builder(
                    controller: _controller,
                    itemCount: items.length,
                    onPageChanged: (i) => setState(() => _index = i),
                    itemBuilder: (context, index) {
                      final page = _controller.hasClients
                          ? (_controller.page ??
                                _controller.initialPage.toDouble())
                          : _controller.initialPage.toDouble();
                      final delta = (page - index).abs();
                      final focus = (1 - delta.clamp(0.0, 1.0));
                      final scale = 0.86 + (focus * 0.14);
                      final opacity = 0.68 + (focus * 0.32);
                      final lift = (1 - focus) * 8;

                      return Transform.translate(
                        offset: Offset(0, lift),
                        child: Transform.scale(
                          scale: scale,
                          child: Opacity(
                            opacity: opacity,
                            child: _ShowcaseCard(
                              item: items[index],
                              isFocused: focus > 0.85,
                              onTap: () => context.push(
                                AppRoutes.shopProduct.replaceFirst(
                                  ':productId',
                                  items[index].productId,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _NavArrow(
                  direction: AxisDirection.left,
                  enabled: _index > 0,
                  onTap: () => _goTo(_index - 1),
                ),
                const SizedBox(width: AppSpacing.lg),
                CarouselDots(
                  count: items.length,
                  index: _index,
                  activeColor: AppColors.gold,
                  inactiveColor: AppColors.cream.withValues(alpha: 0.28),
                ),
                const SizedBox(width: AppSpacing.lg),
                _NavArrow(
                  direction: AxisDirection.right,
                  enabled: _index < items.length - 1,
                  onTap: () => _goTo(_index + 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowcaseCard extends StatelessWidget {
  const _ShowcaseCard({
    required this.item,
    required this.isFocused,
    required this.onTap,
  });

  final OurWorkItem item;
  final bool isFocused;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final imageUrl = item.imageUrl.isNotEmpty
        ? item.imageUrl
        : CatalogImagery.resolveProduct(item.productId, item.productId);

    return PremiumPressable(
      onTap: onTap,
      scaleEnd: AppMotion.cardPressScale,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.showcaseCard),
            boxShadow: isFocused
                ? [
                    BoxShadow(
                      color: AppColors.ink.withValues(alpha: 0.45),
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                    ),
                  ]
                : null,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppRadius.showcaseCard),
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  EditorialImage(
                    url: imageUrl,
                    alignment: const Alignment(0, -0.1),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          AppColors.ink.withValues(alpha: 0.88),
                        ],
                        stops: const [0.52, 1.0],
                      ),
                    ),
                  ),
                  if (isFocused)
                    Positioned(
                      left: AppSpacing.md,
                      top: AppSpacing.md,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cream.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(
                            AppRadius.showcaseCard,
                          ),
                          border: Border.all(
                            color: AppColors.cream.withValues(alpha: 0.35),
                            width: 0.5,
                          ),
                        ),
                        child: Text(
                          item.category.toUpperCase(),
                          style: AppTypography.uiMicro.copyWith(
                            color: AppColors.cream,
                            fontSize: 8,
                            letterSpacing: 1.6,
                          ),
                        ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.md),
                      child: Text(
                        item.title,
                        style: AppTypography.uiBodySM.copyWith(
                          color: AppColors.cream,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavArrow extends StatelessWidget {
  const _NavArrow({
    required this.direction,
    required this.enabled,
    required this.onTap,
  });

  final AxisDirection direction;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled
                ? AppColors.cream.withValues(alpha: 0.55)
                : AppColors.cream.withValues(alpha: 0.18),
            width: 0.5,
          ),
        ),
        alignment: Alignment.center,
        child: Icon(
          direction == AxisDirection.left
              ? Icons.arrow_back
              : Icons.arrow_forward,
          size: 16,
          color: enabled
              ? AppColors.cream
              : AppColors.cream.withValues(alpha: 0.35),
        ),
      ),
    );
  }
}

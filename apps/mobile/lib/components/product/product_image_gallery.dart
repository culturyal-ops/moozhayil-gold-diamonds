import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/motion.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/models/product.dart';
import '../../core/utils/catalog_imagery.dart';
import '../editorial/editorial_image.dart';

/// Full-bleed product gallery with a row of square thumbnail previews.
class ProductImageGallery extends StatefulWidget {
  const ProductImageGallery({super.key, required this.product});

  final Product product;

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<String> get _urls {
    final real = widget.product.images
        .map((image) => image.url)
        .where((url) => url.isNotEmpty)
        .toList();
    if (real.isNotEmpty) return real;

    final primary = widget.product.primaryImage;
    if (primary != null && primary.isNotEmpty) return [primary];

    return [
      CatalogImagery.resolveProduct(primary, widget.product.id),
      CatalogImagery.resolveProduct(null, '${widget.product.id}-2'),
      CatalogImagery.resolveProduct(null, '${widget.product.id}-3'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final urls = _urls;
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width,
          height: width,
          child: RepaintBoundary(
            child: PageView.builder(
              controller: _controller,
              itemCount: urls.length,
              onPageChanged: (value) => setState(() => _index = value),
              itemBuilder: (context, index) => EditorialImage(url: urls[index]),
            ),
          ),
        ),
        if (urls.length > 1) ...[
          const SizedBox(height: AppSpacing.md),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            child: Row(
              children: [
                for (var i = 0; i < urls.length; i++) ...[
                  if (i > 0) const SizedBox(width: AppSpacing.xs),
                  GestureDetector(
                    onTap: () {
                      _controller.animateToPage(
                        i,
                        duration: AppMotion.normal,
                        curve: AppMotion.standard,
                      );
                    },
                    child: Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: i == _index
                              ? AppColors.textPrimary
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          AppRadius.thumbnail,
                        ),
                        child: EditorialImage(url: urls[i]),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ],
    );
  }
}

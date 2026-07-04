import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/motion.dart';
import '../../core/utils/catalog_imagery.dart';
import '../feedback/loading_shimmer.dart';
import '../product/product_image_placeholder.dart';

/// Network or bundled asset photography with shimmer and fade-in reveal.
class EditorialImage extends StatefulWidget {
  const EditorialImage({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
  });

  final String? url;
  final BoxFit fit;
  final Alignment alignment;

  @override
  State<EditorialImage> createState() => _EditorialImageState();
}

class _EditorialImageState extends State<EditorialImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _opacity;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: AppMotion.normal,
    );
    _opacity = CurvedAnimation(
      parent: _fadeController,
      curve: AppMotion.entrance,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  void _onImageReady() {
    if (_loaded) return;
    _loaded = true;
    _fadeController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final src = widget.url;
    if (src == null || src.isEmpty) {
      return const ProductImagePlaceholder();
    }

    if (CatalogImagery.isAssetPath(src)) {
      return FadeTransition(
        opacity: _opacity,
        child: Image.asset(
          src,
          fit: widget.fit,
          alignment: widget.alignment,
          errorBuilder: (_, _, _) => const ProductImagePlaceholder(),
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              _onImageReady();
            }
            return child;
          },
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: src,
      fit: widget.fit,
      alignment: widget.alignment,
      placeholder: (_, _) => const LoadingShimmer(
        width: double.infinity,
        height: double.infinity,
      ),
      imageBuilder: (context, imageProvider) {
        _onImageReady();
        return FadeTransition(
          opacity: _opacity,
          child: Image(
            image: imageProvider,
            fit: widget.fit,
            alignment: widget.alignment,
          ),
        );
      },
      errorWidget: (_, _, _) => const ProductImagePlaceholder(),
    );
  }
}

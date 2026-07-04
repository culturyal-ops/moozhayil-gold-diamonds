import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../components/feedback/loading_shimmer.dart';
import '../../components/product/product_image_placeholder.dart';
import '../constants/radii.dart';

/// A [CachedNetworkImage] wrapper that reveals the image with a blur-to-sharp
/// progressive transition — the Apple Photos style.
///
/// Loading states:
///   1. [LoadingShimmer] placeholder while the image downloads.
///   2. Once loaded, the image appears blurred (sigma 14 → 0, 600 ms easeOut).
///
/// Never shows a white flash or a hard pixel cut-in.
/// Drop-in wherever product or hero photography is rendered.
class LuxuryImage extends StatefulWidget {
  const LuxuryImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.revealDuration = const Duration(milliseconds: 600),
    this.revealBlur = 14.0,
  });

  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Duration revealDuration;
  final double revealBlur;

  @override
  State<LuxuryImage> createState() => _LuxuryImageState();
}

class _LuxuryImageState extends State<LuxuryImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _sigma;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: widget.revealDuration);
    _sigma = Tween<double>(begin: widget.revealBlur, end: 0.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeOut),
    );
    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _ctrl,
        curve: const Interval(0.0, 0.45, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      placeholder: (_, _) => LoadingShimmer(
        width: widget.width ?? double.infinity,
        height: widget.height ?? double.infinity,
      ),
      imageBuilder: (_, imageProvider) {
        // Trigger reveal on first load.
        if (!_ctrl.isAnimating && _ctrl.value == 0) {
          _ctrl.forward();
        }
        return AnimatedBuilder(
          animation: _ctrl,
          builder: (_, _) {
            final image = Image(
              image: imageProvider,
              fit: widget.fit,
              width: widget.width,
              height: widget.height,
            );
            final sigma = _sigma.value;
            if (sigma <= 0.1) return image;
            return Opacity(
              opacity: _opacity.value.clamp(0.0, 1.0),
              child: ImageFiltered(
                imageFilter: ui.ImageFilter.blur(
                  sigmaX: sigma,
                  sigmaY: sigma,
                  tileMode: TileMode.decal,
                ),
                child: image,
              ),
            );
          },
        );
      },
      errorWidget: (_, _, _) => const ProductImagePlaceholder(),
    );
  }
}

/// Convenience widget: [LuxuryImage] pre-clipped to [borderRadius].
/// Use wherever product cards need blur-to-sharp hero photography.
class LuxuryProductImage extends StatelessWidget {
  const LuxuryProductImage({
    super.key,
    required this.imageUrl,
    required this.height,
    this.width = double.infinity,
    this.borderRadius = AppRadius.card,
    this.fit = BoxFit.cover,
  });

  final String imageUrl;
  final double height;
  final double width;
  final double borderRadius;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: LuxuryImage(
        imageUrl: imageUrl,
        height: height,
        width: width,
        fit: fit,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../constants/colors.dart';

/// Renders [text] with a continuously sweeping gold shimmer gradient.
///
/// The bright highlight moves left-to-right on a repeating cycle, creating
/// the impression of light catching a gold surface — the core visual metaphor
/// of luxury jewellery photography.
///
/// Usage: wrap any prominent numeric display (gold balance, price) in this
/// widget. Keep text length short; long strings may look distracting.
class GoldShimmerText extends StatefulWidget {
  const GoldShimmerText({
    super.key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 2400),
  });

  final String text;
  final TextStyle? style;
  final Duration duration;

  @override
  State<GoldShimmerText> createState() => _GoldShimmerTextState();
}

class _GoldShimmerTextState extends State<GoldShimmerText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, _) {
        // Highlight center moves from -1 (left) through 2 (right) so the
        // sweep fully enters and exits the text bounds.
        final center = -1.0 + _controller.value * 3.0;
        return ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) => LinearGradient(
            begin: Alignment(center - 1.2, 0),
            end: Alignment(center + 1.2, 0),
            colors: const [
              AppColors.antiqueGold,
              Color(0xFFEDD68A), // champagne highlight
              AppColors.starlightGold,
              AppColors.antiqueGold,
            ],
            stops: const [0.0, 0.45, 0.55, 1.0],
          ).createShader(bounds),
          child: Text(widget.text, style: widget.style),
        );
      },
    );
  }
}

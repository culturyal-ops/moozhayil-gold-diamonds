import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';
import '../../core/constants/typography.dart';

/// Styled slider input.
/// Source: 02-design-system.md § Input System — Slider Input
/// Source: 03-component-library.md § SliderInput
///
/// Track:  4px height, inactive [AppColors.smokeLine], active [AppColors.antiqueGold].
/// Thumb:  24px circle, pureWhite with shadow.
/// The optional [livePreview] string is rendered below the slider and updated
/// on every [onChanged] callback (caller is responsible for debouncing).
class AppSliderInput extends StatelessWidget {
  const AppSliderInput({
    super.key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
    this.step = 1,
    this.formatLabel,
    this.livePreview,
  });

  final double min;
  final double max;
  final double value;
  final ValueChanged<double> onChanged;
  final double step;

  /// Optional formatter for the value label shown above the slider.
  final String Function(double value)? formatLabel;

  /// Optional live preview text shown below the slider.
  final String? livePreview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            activeTrackColor: AppColors.antiqueGold,
            inactiveTrackColor: AppColors.smokeLine,
            thumbColor: AppColors.pureWhite,
            thumbShape: const _GoldThumb(thumbRadius: 12),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
            overlayColor: AppColors.champagneVeil,
          ),
          child: Slider(
            min: min,
            max: max,
            value: value,
            divisions: step > 0 ? ((max - min) / step).round() : null,
            onChanged: onChanged,
          ),
        ),
        if (livePreview != null) ...[
          const SizedBox(height: 4),
          Text(
            livePreview!,
            style: AppTypography.uiBodySM.copyWith(color: AppColors.slateMist),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }
}

/// Custom thumb that renders as a white circle with a subtle shadow,
/// matching the design spec's "24px circle, pureWhite, shadowMD".
class _GoldThumb extends SliderComponentShape {
  const _GoldThumb({required this.thumbRadius});

  final double thumbRadius;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Shadow
    final shadowPaint = Paint()
      ..color = const Color(0x141A1612)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
    canvas.drawCircle(center.translate(0, 2), thumbRadius, shadowPaint);

    // White fill
    final fillPaint = Paint()..color = AppColors.pureWhite;
    canvas.drawCircle(center, thumbRadius, fillPaint);

    // Thin gold border
    final borderPaint = Paint()
      ..color = AppColors.antiqueGold
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}

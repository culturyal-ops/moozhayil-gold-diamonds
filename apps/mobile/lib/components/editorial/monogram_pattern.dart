import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

/// Subtle repeating monogram-lozenge texture for burgundy editorial grounds.
///
/// Draws a low-contrast diamond/arc lattice (à la luxury house repeat patterns)
/// in a tone slightly lighter than the burgundy ground. Purely decorative.
class MonogramPattern extends StatelessWidget {
  const MonogramPattern({
    super.key,
    this.color,
    this.opacity = 0.06,
    this.cell = 56,
  });

  final Color? color;
  final double opacity;
  final double cell;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: CustomPaint(
          painter: _MonogramPatternPainter(
            color: (color ?? AppColors.cream).withValues(alpha: opacity),
            cell: cell,
          ),
        ),
      ),
    );
  }
}

class _MonogramPatternPainter extends CustomPainter {
  _MonogramPatternPainter({required this.color, required this.cell});

  final Color color;
  final double cell;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..strokeCap = StrokeCap.round;

    final half = cell / 2;

    for (double y = -cell; y < size.height + cell; y += cell) {
      for (double x = -cell; x < size.width + cell; x += cell) {
        // Diamond lozenge.
        final path = Path()
          ..moveTo(x + half, y)
          ..lineTo(x + cell, y + half)
          ..lineTo(x + half, y + cell)
          ..lineTo(x, y + half)
          ..close();
        canvas.drawPath(path, paint);

        // Inner arc pair for the interlocking-monogram feel.
        final r = half * 0.5;
        canvas.drawCircle(Offset(x + half, y + half), r, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_MonogramPatternPainter oldDelegate) =>
      oldDelegate.color != color || oldDelegate.cell != cell;
}

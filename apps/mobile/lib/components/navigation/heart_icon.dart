import 'package:flutter/material.dart';

/// Outline heart for Dream Vault affordances in the top bar.
class HeartIcon extends StatelessWidget {
  const HeartIcon({
    super.key,
    required this.color,
    this.size = 20,
    this.strokeWidth = 1.5,
  });

  final Color color;
  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CustomPaint(
        painter: _HeartPainter(color: color, strokeWidth: strokeWidth),
      ),
    );
  }
}

class _HeartPainter extends CustomPainter {
  const _HeartPainter({required this.color, required this.strokeWidth});

  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 24.0;
    canvas.scale(scale);

    final path = Path()
      ..moveTo(12, 21)
      ..cubicTo(12, 21, 3, 14.5, 3, 8.5)
      ..cubicTo(3, 5.42, 5.42, 3, 8.5, 3)
      ..cubicTo(10.24, 3, 11.91, 3.81, 13, 5.08)
      ..cubicTo(14.09, 3.81, 15.76, 3, 17.5, 3)
      ..cubicTo(20.58, 3, 23, 5.42, 23, 8.5)
      ..cubicTo(23, 14.5, 14, 21, 12, 21)
      ..close();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeartPainter old) =>
      old.color != color || old.strokeWidth != strokeWidth;
}

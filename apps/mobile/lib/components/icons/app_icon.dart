import 'package:flutter/material.dart';

import '../../core/constants/iconography.dart';

/// Thin line icon with consistent sizing and colour across the app.
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    super.key,
    this.size = AppIconography.sizeMd,
    this.color = AppIconography.subtle,
  });

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: size, color: color);
  }
}

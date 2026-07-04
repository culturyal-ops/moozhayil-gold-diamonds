import 'package:flutter/material.dart';

import '../../core/constants/spacing.dart';

/// Horizontal inset used by editorial sections sandwiched between full-bleed
/// bands. Full-bleed children sit outside this wrapper.
class EditorialInset extends StatelessWidget {
  const EditorialInset({super.key, required this.child, this.bottomGap});

  final Widget child;
  final double? bottomGap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.xxl,
        AppSpacing.screenPadding,
        bottomGap ?? AppSpacing.xxl,
      ),
      child: child,
    );
  }
}

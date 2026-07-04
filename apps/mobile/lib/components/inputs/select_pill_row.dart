import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';

/// Single-select pill row — Shop/Schemes editorial pattern.
class SelectPillRow extends StatelessWidget {
  const SelectPillRow({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final List<({String value, String label})> options;
  final String selected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: options.map((option) {
        final isActive = option.value == selected;
        return GestureDetector(
          onTap: () => onSelected(option.value),
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: isActive ? AppColors.brandBurgundy : AppColors.bgWhite,
              border: Border.all(
                color: isActive ? AppColors.brandBurgundy : AppColors.border,
                width: 0.5,
              ),
            ),
            child: Text(
              option.label.toUpperCase(),
              style: AppTypography.uiMicro.copyWith(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: isActive ? AppColors.cream : AppColors.textMuted,
                letterSpacing: 1.2,
              ),
            ),
          ),
        );
      }).toList(growable: false),
    );
  }
}

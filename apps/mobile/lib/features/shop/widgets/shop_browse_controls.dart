import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../utils/shop_browse_filters.dart';

/// Sort and filter controls for shop browse surfaces.
class ShopBrowseControls extends StatelessWidget {
  const ShopBrowseControls({
    super.key,
    required this.sort,
    required this.purity,
    required this.stock,
    required this.onSortChanged,
    required this.onPurityChanged,
    required this.onStockChanged,
    this.resultCount,
  });

  final ShopSortOption sort;
  final ShopPurityFilter purity;
  final ShopStockFilter stock;
  final ValueChanged<ShopSortOption> onSortChanged;
  final ValueChanged<ShopPurityFilter> onPurityChanged;
  final ValueChanged<ShopStockFilter> onStockChanged;
  final int? resultCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (resultCount != null) ...[
          Text(
            '$resultCount pieces',
            style: AppTypography.uiCaption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            _FilterChip(label: sort.label, onTap: () => _pickSort(context)),
            _FilterChip(label: purity.label, onTap: () => _pickPurity(context)),
            _FilterChip(label: stock.label, onTap: () => _pickStock(context)),
          ],
        ),
      ],
    );
  }

  Future<void> _pickSort(BuildContext context) async {
    final picked = await showModalBottomSheet<ShopSortOption>(
      context: context,
      backgroundColor: AppColors.bgWhite,
      builder: (context) => _OptionSheet<ShopSortOption>(
        title: 'Sort by',
        options: ShopSortOption.values,
        selected: sort,
        label: (option) => option.label,
      ),
    );
    if (picked != null) onSortChanged(picked);
  }

  Future<void> _pickPurity(BuildContext context) async {
    final picked = await showModalBottomSheet<ShopPurityFilter>(
      context: context,
      backgroundColor: AppColors.bgWhite,
      builder: (context) => _OptionSheet<ShopPurityFilter>(
        title: 'Purity',
        options: ShopPurityFilter.values,
        selected: purity,
        label: (option) => option.label,
      ),
    );
    if (picked != null) onPurityChanged(picked);
  }

  Future<void> _pickStock(BuildContext context) async {
    final picked = await showModalBottomSheet<ShopStockFilter>(
      context: context,
      backgroundColor: AppColors.bgWhite,
      builder: (context) => _OptionSheet<ShopStockFilter>(
        title: 'Availability',
        options: ShopStockFilter.values,
        selected: stock,
        label: (option) => option.label,
      ),
    );
    if (picked != null) onStockChanged(picked);
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 0.5),
          color: AppColors.bgWhite,
        ),
        child: Text(
          label,
          style: AppTypography.uiCaption.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

class _OptionSheet<T> extends StatelessWidget {
  const _OptionSheet({
    required this.title,
    required this.options,
    required this.selected,
    required this.label,
  });

  final String title;
  final List<T> options;
  final T selected;
  final String Function(T) label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTypography.headingSM),
            const SizedBox(height: AppSpacing.md),
            for (final option in options)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(label(option)),
                trailing: option == selected
                    ? const Icon(Icons.check, color: AppColors.gold, size: 18)
                    : null,
                onTap: () => Navigator.of(context).pop(option),
              ),
          ],
        ),
      ),
    );
  }
}

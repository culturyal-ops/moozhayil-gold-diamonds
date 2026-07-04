import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';

class ProductSpecsRow extends StatelessWidget {
  const ProductSpecsRow({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final specs = [
      ('Purity', product.purityDisplay),
      ('Weight', product.weightDisplay),
      ('Rate', product.price.rateDisplay),
    ];

    return Row(
      children: [
        for (final spec in specs)
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: AppSpacing.xs),
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.pureWhite,
                borderRadius: BorderRadius.circular(AppRadius.card),
                border: Border.all(color: AppColors.smokeLine),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(spec.$1, style: AppTypography.uiCaption),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(spec.$2, style: AppTypography.uiBodySM),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

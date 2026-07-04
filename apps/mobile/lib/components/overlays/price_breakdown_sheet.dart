import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/radii.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/typography.dart';
import '../../core/models/product.dart';

Future<void> showPriceBreakdownSheet({
  required BuildContext context,
  required Product product,
}) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.pureWhite,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppRadius.bottomSheet),
      ),
    ),
    builder: (context) => PriceBreakdownSheet(product: product),
  );
}

class PriceBreakdownSheet extends StatelessWidget {
  const PriceBreakdownSheet({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final rows = [
      ('Gold value', product.price.goldValueDisplay),
      ('Making charge', product.price.makingChargeDisplay),
      ('GST', product.price.gstDisplay),
      ('Rate used', product.price.rateDisplay),
    ];

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.screenPaddingLG),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price breakdown', style: AppTypography.headingMD),
          const SizedBox(height: AppSpacing.lg),
          for (final row in rows) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(row.$1, style: AppTypography.uiBodySM),
                Text(row.$2, style: AppTypography.priceSM),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
          ],
          const Divider(color: AppColors.smokeLine),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: AppTypography.uiBodyLG),
              Text(product.price.totalDisplay, style: AppTypography.priceLG),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

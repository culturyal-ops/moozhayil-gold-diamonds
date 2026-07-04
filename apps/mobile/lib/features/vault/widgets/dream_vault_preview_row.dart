import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/vault_item.dart';
import '../../../core/routing/app_routes.dart';
import '../../../components/feedback/loading_shimmer.dart';
import 'dream_vault_card.dart';

class DreamVaultPreviewRow extends ConsumerWidget {
  const DreamVaultPreviewRow({
    super.key,
    required this.vaultItems,
    this.isLoading = false,
  });

  final AsyncValue<VaultListResponse> vaultItems;
  final bool isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isLoading) {
      return _LoadingRow();
    }

    return vaultItems.when(
      data: (response) {
        if (response.items.isEmpty) {
          return const SizedBox.shrink();
        }

        final previewItems = response.items.take(5).toList(growable: false);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Your Dream Vault',
                    style: AppTypography.headingMD.copyWith(
                      color: AppColors.obsidian,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => context.push(AppRoutes.dreamVault),
                  child: Text(
                    'See all →',
                    style: AppTypography.uiCaption.copyWith(
                      color: AppColors.antiqueGold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              height: AppSpacing.x3l + AppSpacing.xl,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: previewItems.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(width: AppSpacing.sm),
                itemBuilder: (context, index) {
                  final item = previewItems[index];
                  return GestureDetector(
                    onTap: () => context.push(
                      AppRoutes.shopProduct.replaceFirst(
                        ':productId',
                        item.product.id,
                      ),
                    ),
                    child: DreamVaultCard(
                      item: item,
                      compact: true,
                      onStartGoalTap: () {},
                      onRemoveTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
      loading: () => _LoadingRow(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}

class _LoadingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Dream Vault', style: AppTypography.headingMD),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          height: AppSpacing.x3l + AppSpacing.xl,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (_, _) => const LoadingShimmer(
              width: AppSpacing.x3l + AppSpacing.xl,
              height: AppSpacing.x3l + AppSpacing.lg,
            ),
          ),
        ),
      ],
    );
  }
}

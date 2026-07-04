import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/feedback/empty_state.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/radii.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/store_location.dart';
import '../providers/stores_provider.dart';

class StoreLocatorScreen extends ConsumerStatefulWidget {
  const StoreLocatorScreen({super.key});

  @override
  ConsumerState<StoreLocatorScreen> createState() => _StoreLocatorScreenState();
}

class _StoreLocatorScreenState extends ConsumerState<StoreLocatorScreen> {
  final _searchController = TextEditingController();
  String? _query;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search() {
    setState(() => _query = _searchController.text.trim());
    ref.invalidate(storesListProvider);
  }

  @override
  Widget build(BuildContext context) {
    final stores = ref.watch(
      storesListProvider(q: _query?.isEmpty == true ? null : _query),
    );

    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Store locator'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.screenPadding),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search city or store name',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onSubmitted: (_) => _search(),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                IconButton(onPressed: _search, icon: const Icon(Icons.search)),
              ],
            ),
          ),
          Expanded(
            child: stores.when(
              data: (response) {
                if (response.stores.isEmpty) {
                  return const EmptyState(
                    icon: Icons.store_outlined,
                    headline: 'No stores found',
                    body: 'Try a different city or search term.',
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(storesListProvider);
                    await ref.read(
                      storesListProvider(
                        q: _query?.isEmpty == true ? null : _query,
                      ).future,
                    );
                  },
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.screenPadding,
                    ),
                    itemCount: response.stores.length,
                    separatorBuilder: (_, _) =>
                        const SizedBox(height: AppSpacing.md),
                    itemBuilder: (context, index) =>
                        _StoreCard(store: response.stores[index]),
                  ),
                );
              },
              loading: () => const Padding(
                padding: EdgeInsets.all(AppSpacing.screenPadding),
                child: LoadingShimmer(
                  width: double.infinity,
                  height: AppSpacing.x3l * 2,
                ),
              ),
              error: (error, _) => ErrorState(
                body: CustomerErrorCopy.message(error),
                onRetry: () => ref.invalidate(storesListProvider),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoreCard extends StatelessWidget {
  const _StoreCard({required this.store});

  final StoreLocation store;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.pureWhite,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.smokeLine),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(store.name, style: AppTypography.headingSM)),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xxs,
                ),
                decoration: BoxDecoration(
                  color: store.isOpenNow
                      ? AppColors.sageWhisper.withValues(alpha: 0.3)
                      : AppColors.smokeLine,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  store.isOpenNow ? 'Open now' : 'Closed',
                  style: AppTypography.uiCaption,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            '${store.address}, ${store.city}',
            style: AppTypography.uiBodySM,
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(store.phone, style: AppTypography.uiCaption),
          if (store.distanceKm != null) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              '${store.distanceKm} km away',
              style: AppTypography.uiCaption.copyWith(
                color: AppColors.antiqueGold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

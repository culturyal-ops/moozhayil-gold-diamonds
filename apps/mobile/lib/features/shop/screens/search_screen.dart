import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/feedback/empty_state.dart';
import '../../../components/feedback/error_state.dart';
import '../../../components/feedback/loading_shimmer.dart';
import '../../../core/animations/section_reveal.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../providers/search_provider.dart';
import '../utils/shop_browse_filters.dart';
import '../widgets/shop_browse_controls.dart';
import '../widgets/shop_product_grid.dart';
import '../widgets/shop_search_field.dart';
import '../widgets/shop_section.dart';

/// Curated starter queries for luxury catalogue discovery.
const _suggestedQueries = [
  'Temple necklace',
  'Bridal bangles',
  'Daily wear earrings',
  'Antique haram',
];

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late final TextEditingController _controller;
  ShopSortOption _sort = ShopSortOption.featured;
  ShopPurityFilter _purity = ShopPurityFilter.all;
  ShopStockFilter _stock = ShopStockFilter.all;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: ref.read(searchQueryProvider));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _applyQuery(String value) {
    ref.read(searchQueryProvider.notifier).update(value);
    _controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
  }

  void _submitQuery(String value) {
    final trimmed = value.trim();
    if (trimmed.length >= 2) {
      ref.read(recentSearchesProvider.notifier).add(trimmed);
    }
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final results = ref.watch(productSearchProvider(query));
    final recent = ref.watch(recentSearchesProvider);

    return ColoredBox(
      color: AppColors.paper,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionReveal(
            index: 0,
            child: ShopSectionInset(
              top: 12,
              bottom: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShopSectionHeader(
                    title: 'Search',
                    subtitle: 'Discover hallmarked pieces across our catalogue',
                  ),
                  const SizedBox(height: AppSpacing.md),
                  ShopSearchField(
                    controller: _controller,
                    autofocus: true,
                    onChanged: ref.read(searchQueryProvider.notifier).update,
                    onSubmitted: _submitQuery,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: query.trim().length < 2
                ? _DiscoveryPanel(recent: recent, onQuerySelected: _applyQuery)
                : results.when(
                    data: (result) {
                      final filtered = applyShopBrowseFilters(
                        result.products,
                        sort: _sort,
                        purity: _purity,
                        stock: _stock,
                      );

                      if (filtered.isEmpty) {
                        return ListView(
                          padding: const EdgeInsets.all(
                            AppSpacing.homeScreenPadding,
                          ),
                          children: const [
                            EmptyState(
                              icon: Icons.search_off_outlined,
                              headline: 'No pieces matched',
                              body:
                                  'Try a different filter or a shorter search phrase.',
                            ),
                          ],
                        );
                      }

                      return ListView(
                        padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
                        children: [
                          ShopSectionInset(
                            top: 0,
                            bottom: 12,
                            child: ShopBrowseControls(
                              sort: _sort,
                              purity: _purity,
                              stock: _stock,
                              resultCount: filtered.length,
                              onSortChanged: (value) =>
                                  setState(() => _sort = value),
                              onPurityChanged: (value) =>
                                  setState(() => _purity = value),
                              onStockChanged: (value) =>
                                  setState(() => _stock = value),
                            ),
                          ),
                          ShopSectionInset(
                            top: 0,
                            bottom: 24,
                            child: ShopProductGrid(
                              products: filtered,
                              pieceLabel:
                                  '${filtered.length} results for “${query.trim()}”',
                            ),
                          ),
                        ],
                      );
                    },
                    loading: () => const Padding(
                      padding: EdgeInsets.all(AppSpacing.homeScreenPadding),
                      child: LoadingShimmer(
                        width: double.infinity,
                        height: AppSpacing.x3l * 3,
                      ),
                    ),
                    error: (error, _) =>
                        ErrorState(body: CustomerErrorCopy.message(error)),
                  ),
          ),
        ],
      ),
    );
  }
}

class _DiscoveryPanel extends ConsumerWidget {
  const _DiscoveryPanel({required this.recent, required this.onQuerySelected});

  final AsyncValue<List<String>> recent;
  final ValueChanged<String> onQuerySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
      children: [
        SectionReveal(
          index: 1,
          child: ShopSectionInset(
            top: 0,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Suggested',
                  style: AppTypography.uiMicro.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.8,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                _FilterPills(
                  labels: _suggestedQueries,
                  onSelected: (index) =>
                      onQuerySelected(_suggestedQueries[index]),
                ),
              ],
            ),
          ),
        ),
        recent.when(
          data: (items) {
            if (items.isEmpty) {
              return const ShopSectionInset(
                child: EmptyState(
                  icon: Icons.search,
                  headline: 'Search our catalogue',
                  body:
                      'Find necklaces, bangles, bridal sets, and everyday gold — priced from today\u2019s rate.',
                ),
              );
            }

            return SectionReveal(
              index: 2,
              child: ShopSectionInset(
                top: 0,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recent',
                      style: AppTypography.uiMicro.copyWith(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.8,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    _FilterPills(
                      labels: items,
                      onSelected: (index) => onQuerySelected(items[index]),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Padding(
            padding: EdgeInsets.all(AppSpacing.homeScreenPadding),
            child: LoadingShimmer(
              width: double.infinity,
              height: AppSpacing.xxl,
            ),
          ),
          error: (error, _) =>
              ErrorState(body: CustomerErrorCopy.message(error)),
        ),
      ],
    );
  }
}

class _FilterPills extends StatelessWidget {
  const _FilterPills({required this.labels, required this.onSelected});

  final List<String> labels;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0) const SizedBox(width: 6),
            GestureDetector(
              onTap: () => onSelected(i),
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bgWhite,
                  border: Border.all(color: AppColors.border, width: 0.5),
                ),
                child: Text(
                  labels[i].toUpperCase(),
                  style: AppTypography.uiMicro.copyWith(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMuted,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

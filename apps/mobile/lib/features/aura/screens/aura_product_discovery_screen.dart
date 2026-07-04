import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/feedback/error_state.dart';
import '../../../components/inputs/select_pill_row.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/aura_session.dart';
import '../../shop/widgets/shop_section.dart';
import '../../vault/widgets/vault_aware_product_card.dart';
import '../providers/aura_provider.dart';
import '../widgets/aura_option_button.dart';

class AuraProductDiscoveryScreen extends ConsumerStatefulWidget {
  const AuraProductDiscoveryScreen({super.key});

  @override
  ConsumerState<AuraProductDiscoveryScreen> createState() =>
      _AuraProductDiscoveryScreenState();
}

class _AuraProductDiscoveryScreenState
    extends ConsumerState<AuraProductDiscoveryScreen> {
  final _budgetController = TextEditingController();
  var _forPerson = 'partner';
  AuraDiscoverResponse? _result;
  bool _isLoading = false;
  String? _error;

  static const _personOptions = [
    (value: 'self', label: 'Myself'),
    (value: 'partner', label: 'Partner'),
    (value: 'parent', label: 'Parent'),
    (value: 'child', label: 'Child'),
    (value: 'friend', label: 'Friend'),
  ];

  static const _occasionOptions = [
    (value: 'anniversary', label: 'Anniversary'),
    (value: 'birthday', label: 'Birthday'),
    (value: 'wedding', label: 'Wedding'),
    (value: 'festival', label: 'Festival'),
    (value: 'gifting', label: 'Gifting'),
  ];

  var _occasion = 'anniversary';

  @override
  void dispose() {
    _budgetController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final budgetRupees = int.tryParse(_budgetController.text.trim());
    if (budgetRupees == null || budgetRupees <= 0) {
      setState(() => _error = 'Enter a valid budget in rupees.');
      return;
    }

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final response = await ref
          .read(auraActionsProvider.notifier)
          .discover(
            forPerson: _forPerson,
            occasion: _occasion,
            budgetPaise: budgetRupees * 100,
          );
      setState(() => _result = response);
    } catch (error) {
      setState(() => _error = CustomerErrorCopy.message(error));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.paper,
      appBar: AppTopBar.detail(title: 'Discover jewellery'),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
        children: [
          ShopSectionInset(
            top: 12,
            child: ShopSectionHeader(
              title: 'Find a piece',
              subtitle: 'Within budget, for someone special.',
            ),
          ),
          ShopSectionInset(
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'For',
                  style: AppTypography.uiCaption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                SelectPillRow(
                  options: _personOptions,
                  selected: _forPerson,
                  onSelected: (value) => setState(() => _forPerson = value),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Occasion',
                  style: AppTypography.uiCaption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                SelectPillRow(
                  options: _occasionOptions,
                  selected: _occasion,
                  onSelected: (value) => setState(() => _occasion = value),
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextInput(
                  label: 'Budget (₹)',
                  placeholder: 'e.g. 50000',
                  value: _budgetController.text,
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: AppSpacing.lg),
                AuraOptionButton(
                  label: 'Find pieces',
                  isPrimary: true,
                  isLoading: _isLoading,
                  onPressed: _submit,
                ),
                if (_error != null) ...[
                  const SizedBox(height: AppSpacing.md),
                  ErrorState(body: _error!),
                ],
              ],
            ),
          ),
          if (_result != null)
            ShopSectionInset(
              top: AppSpacing.lg,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _result!.intro,
                    style: AppTypography.uiBodyMD.copyWith(height: 1.55),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  if (_result!.products.isEmpty)
                    Text(
                      'No in-stock pieces match this budget right now.',
                      style: AppTypography.uiBodySM.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  else
                    ..._result!.products.map(
                      (product) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.md),
                        child: VaultAwareProductCard(product: product),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/utils/customer_error_copy.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../components/feedback/error_state.dart';
import '../../../components/inputs/select_pill_row.dart';
import '../../../components/inputs/text_input.dart';
import '../../../components/navigation/top_app_bar.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/spacing.dart';
import '../../../core/constants/typography.dart';
import '../../../core/models/aura_session.dart';
import '../../../core/routing/app_routes.dart';
import '../../shop/widgets/shop_section.dart';
import '../../vault/widgets/vault_aware_product_card.dart';
import '../providers/aura_provider.dart';
import '../widgets/aura_option_button.dart';

class AuraGoalPlanningScreen extends ConsumerStatefulWidget {
  const AuraGoalPlanningScreen({super.key});

  @override
  ConsumerState<AuraGoalPlanningScreen> createState() =>
      _AuraGoalPlanningScreenState();
}

class _AuraGoalPlanningScreenState
    extends ConsumerState<AuraGoalPlanningScreen> {
  var _occasion = 'wedding';
  final _budgetController = TextEditingController();
  DateTime _targetDate = DateTime.now().add(const Duration(days: 365));
  AuraPlanResponse? _result;
  bool _isLoading = false;
  String? _error;

  static const _occasions = [
    (value: 'wedding', label: 'Wedding'),
    (value: 'anniversary', label: 'Anniversary'),
    (value: 'festival', label: 'Festival'),
    (value: 'gifting', label: 'Gifting'),
  ];

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
          .plan(
            occasion: _occasion,
            targetDate: _targetDate.toIso8601String().split('T').first,
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
      appBar: AppTopBar.detail(title: 'Wedding planning'),
      body: ListView(
        padding: const EdgeInsets.only(bottom: AppSpacing.x3l),
        children: [
          ShopSectionInset(
            top: 12,
            child: ShopSectionHeader(
              title: 'Plan your jewellery',
              subtitle: 'Occasion, timeline, and budget for your milestone.',
            ),
          ),
          ShopSectionInset(
            top: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Occasion',
                  style: AppTypography.uiCaption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                SelectPillRow(
                  options: _occasions,
                  selected: _occasion,
                  onSelected: (value) => setState(() => _occasion = value),
                ),
                const SizedBox(height: AppSpacing.lg),
                _DatePickerRow(
                  date: _targetDate,
                  onPick: (date) => setState(() => _targetDate = date),
                ),
                const SizedBox(height: AppSpacing.lg),
                AppTextInput(
                  label: 'Budget (₹)',
                  placeholder: 'e.g. 250000',
                  value: _budgetController.text,
                  controller: _budgetController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() {}),
                ),
                const SizedBox(height: AppSpacing.lg),
                AuraOptionButton(
                  label: 'Get plan',
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
              child: _PlanResult(plan: _result!),
            ),
        ],
      ),
    );
  }
}

class _DatePickerRow extends StatelessWidget {
  const _DatePickerRow({required this.date, required this.onPick});

  final DateTime date;
  final ValueChanged<DateTime> onPick;

  @override
  Widget build(BuildContext context) {
    final label = date.toIso8601String().split('T').first;

    return GestureDetector(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 3650)),
        );
        if (picked != null) onPick(picked);
      },
      behavior: HitTestBehavior.opaque,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: 14,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target date',
                      style: AppTypography.uiCaption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(label, style: AppTypography.uiBodyMD),
                  ],
                ),
              ),
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: AppColors.brandBurgundy.withValues(alpha: 0.75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PlanResult extends StatelessWidget {
  const _PlanResult({required this.plan});

  final AuraPlanResponse plan;

  @override
  Widget build(BuildContext context) {
    final details = plan.plan;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Suggested plan', style: AppTypography.headingSM),
        const SizedBox(height: AppSpacing.sm),
        Text(
          details.rationale,
          style: AppTypography.uiBodyMD.copyWith(height: 1.55),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          '${details.suggestedMonthlyDisplay}/mo · ${details.durationMonths} months',
          style: AppTypography.priceMD,
        ),
        const SizedBox(height: AppSpacing.lg),
        if (plan.recommendedProducts.isNotEmpty) ...[
          Text('Recommended pieces', style: AppTypography.headingSM),
          const SizedBox(height: AppSpacing.md),
          ...plan.recommendedProducts.map(
            (product) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: VaultAwareProductCard(product: product),
            ),
          ),
        ],
        AuraOptionButton(
          label: 'Explore Schemes',
          onPressed: () => context.go(AppRoutes.goldenWish),
        ),
      ],
    );
  }
}

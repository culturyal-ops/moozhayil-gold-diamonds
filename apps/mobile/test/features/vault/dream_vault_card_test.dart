import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/models/product.dart';
import 'package:moozhayil/core/models/vault_item.dart';
import 'package:moozhayil/features/vault/widgets/dream_vault_card.dart';

void main() {
  VaultItem sampleItem() {
    return VaultItem(
      id: 'vault_1',
      product: Product(
        id: 'prod_1',
        sku: 'MGD-001',
        name: 'Temple Bangle',
        purity: 'k22',
        purityDisplay: '22K',
        weightGrams: '13.6000',
        weightDisplay: '13.6g',
        price: ProductPrice(
          totalPaise: 8500000,
          totalDisplay: '₹85,000',
          goldValuePaise: 7000000,
          goldValueDisplay: '₹70,000',
          makingChargePaise: 1000000,
          makingChargeDisplay: '₹10,000',
          gstPaise: 500000,
          gstDisplay: '₹5,000',
          rateUsedPaise: 624000,
          rateDisplay: '₹6,240/g',
          rateUpdatedAt: '2026-06-26',
          priceValidUntil: '2026-06-27',
        ),
        primaryImage: null,
      ),
      goal: null,
      affordability: const VaultAffordability(
        canAffordNow: false,
        percentComplete: 0,
        gramsNeededDisplay: '13.6g',
        suggestedMonthlyPaise: 236000,
        suggestedMonthlyDisplay: '₹2,360/mo',
        monthsToAfford: 36,
      ),
      addedAt: '2026-06-26T04:30:00Z',
    );
  }

  group('DreamVaultCard', () {
    testWidgets('shows start accumulating for items without goals', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DreamVaultCard(
              item: sampleItem(),
              onStartGoalTap: () {},
              onRemoveTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Temple Bangle'), findsOneWidget);
      expect(find.text('Start Aura Plan →'), findsOneWidget);
      expect(find.text('₹2,360/mo for 36 months'), findsOneWidget);
    });

    testWidgets('compact preview variant shows progress copy', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DreamVaultCard(
              item: sampleItem(),
              compact: true,
              onStartGoalTap: () {},
              onRemoveTap: () {},
            ),
          ),
        ),
      );

      expect(find.text('Temple Bangle'), findsOneWidget);
      expect(find.textContaining('of 13.6g'), findsOneWidget);
    });
  });
}

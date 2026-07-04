import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/constants/customer_copy.dart';
import 'package:moozhayil/core/models/goal.dart';
import 'package:moozhayil/core/models/gold_balance.dart';
import 'package:moozhayil/features/golden_wish/screens/golden_wish_screen.dart';
import 'package:moozhayil/features/goals/providers/goals_provider.dart';
import 'package:moozhayil/features/my_gold/providers/gold_balance_provider.dart';

void main() {
  testWidgets('Golden Wish hub shows four plans', (tester) async {
    tester.view.physicalSize = const Size(1080, 3200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          goalsListProvider.overrideWith(
            (ref, status) async => GoalsListResponse(
              goals: const [],
              summary: GoalsSummary(
                totalGrams: '0.0000',
                totalGramsDisplay: '0.0g',
                totalValuePaise: 0,
                totalValueDisplay: '₹0',
                activeCount: 0,
                monthlyTotalPaise: 0,
                monthlyTotalDisplay: '₹0/mo',
              ),
            ),
          ),
          goldBalanceProvider.overrideWith(
            (ref) async => const GoldBalance(
              totalGrams: '0.0000',
              totalGramsDisplay: '0.0g',
              totalValuePaise: 0,
              totalValueDisplay: '₹0',
              rateUsed: GoldRateUsed(
                purity: '22k',
                ratePaise: 624000,
                rateDisplay: '₹6,240/g',
                updatedAt: '2026-06-26T04:30:00Z',
              ),
            ),
          ),
        ],
        child: const MaterialApp(home: GoldenWishScreen()),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('MOOZHAYIL SCHEMES'), findsOneWidget);
    expect(find.text(CustomerCopy.schemesPurchasePlansTitle), findsOneWidget);
    expect(find.text('Aura Plan'), findsOneWidget);
    expect(find.text('Crest'), findsOneWidget);
    expect(find.text('Dhanam'), findsOneWidget);
    expect(find.text('Swarna Nidhi'), findsOneWidget);
    expect(find.text('Learn more'), findsNWidgets(4));
    expect(find.text('START AURA PLAN'), findsOneWidget);
    expect(find.text('JOIN NOW'), findsNWidgets(3));
    await tester.pump(const Duration(seconds: 2));
  });
}

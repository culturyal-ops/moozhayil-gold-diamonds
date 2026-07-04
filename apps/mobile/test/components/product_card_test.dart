import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/components/cards/product_card.dart';
import 'package:moozhayil/components/feedback/loading_shimmer.dart';
import 'package:moozhayil/core/models/product.dart';

void main() {
  testWidgets('ProductCard renders empty placeholder while loading', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ProductCard(isLoading: true))),
    );

    expect(find.byType(LoadingShimmer), findsNothing);
    expect(find.byType(SizedBox), findsWidgets);
  });

  testWidgets('ProductCard renders product price and new badge', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 180,
            child: ProductCard(product: _product()),
          ),
        ),
      ),
    );

    expect(find.text('Lakshmi Kada'), findsOneWidget);
    expect(find.text('₹84,966'), findsOneWidget);
    expect(find.text('NEW'), findsOneWidget);
  });

  testWidgets('ProductCard renders out of stock state', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 180,
            child: ProductCard(product: _product(stockAvailable: false)),
          ),
        ),
      ),
    );

    expect(find.text('Out of stock'), findsOneWidget);
  });
}

Product _product({bool stockAvailable = true}) {
  return Product(
    id: 'prod_1',
    sku: 'MGD-1',
    name: 'Lakshmi Kada',
    purity: '22k',
    purityDisplay: '22K',
    weightGrams: '13.6000',
    weightDisplay: '13.6g',
    price: const ProductPrice(
      totalPaise: 8496600,
      totalDisplay: '₹84,966',
      goldValuePaise: 8000000,
      goldValueDisplay: '₹80,000',
      makingChargePaise: 400000,
      makingChargeDisplay: '₹4,000',
      gstPaise: 96600,
      gstDisplay: '₹966',
      rateUsedPaise: 624000,
      rateDisplay: '₹6,240/g',
      rateUpdatedAt: '2026-06-26T04:30:00Z',
      priceValidUntil: '2026-06-26T04:45:00Z',
    ),
    stockAvailable: stockAvailable,
    badges: const ['new'],
  );
}

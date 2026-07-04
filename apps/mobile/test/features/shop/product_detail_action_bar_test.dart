import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/core/models/product.dart';
import 'package:moozhayil/features/shop/widgets/product_detail_action_bar.dart';

void main() {
  const product = Product(
    id: 'sample-luna-earrings',
    sku: 'MZ-LUNA-01',
    name: 'Luna Stud Earrings',
    purity: '22k',
    purityDisplay: '22K',
    weightGrams: '3.2',
    weightDisplay: '3.2 g',
    stockAvailable: true,
    price: ProductPrice(
      totalPaise: 2870000,
      totalDisplay: '₹28,700',
      goldValuePaise: 2400000,
      goldValueDisplay: '₹24,000',
      makingChargePaise: 350000,
      makingChargeDisplay: '₹3,500',
      gstPaise: 120000,
      gstDisplay: '₹1,200',
      rateUsedPaise: 685000,
      rateDisplay: '₹6,850/g',
      rateUpdatedAt: '2026-06-27',
      priceValidUntil: '2026-06-28',
    ),
  );

  Widget wrap(Widget child) {
    return MaterialApp(
      home: MediaQuery(
        data: const MediaQueryData(size: Size(390, 844), padding: EdgeInsets.zero),
        child: Scaffold(body: child),
      ),
    );
  }

  testWidgets('shows Add to Bag and Book Video Call in anchored rail', (
    tester,
  ) async {
    var booked = false;
    var added = false;

    await tester.pumpWidget(
      wrap(
        ProductDetailActionBar(
          product: product,
          isInVault: false,
          isOutOfStock: false,
          isAddingToBag: false,
          onAddToBag: () => added = true,
          onBookVideoCall: () => booked = true,
          onToggleVault: () {},
          includeShellNavClearance: false,
        ),
      ),
    );

    expect(find.text('ADD TO BAG'), findsOneWidget);
    expect(find.text('Book Video Call'), findsOneWidget);
    expect(find.text('₹28,700'), findsOneWidget);

    await tester.tap(find.text('Book Video Call'));
    expect(booked, isTrue);

    await tester.tap(find.text('ADD TO BAG'));
    expect(added, isTrue);
  });

  testWidgets('disables Add to Bag when out of stock', (tester) async {
    await tester.pumpWidget(
      wrap(
        ProductDetailActionBar(
          product: product.copyWith(stockAvailable: false),
          isInVault: false,
          isOutOfStock: true,
          isAddingToBag: false,
          onAddToBag: null,
          onBookVideoCall: () {},
          onToggleVault: null,
        ),
      ),
    );

    expect(find.text('NOTIFY ME'), findsOneWidget);
    expect(find.text('ADD TO BAG'), findsNothing);
  });
}

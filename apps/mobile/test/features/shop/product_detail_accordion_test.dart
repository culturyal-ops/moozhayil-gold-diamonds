import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/features/shop/widgets/product_detail_accordion.dart';

void main() {
  testWidgets('ProductDetailAccordion expands on tap', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ProductDetailAccordion(
            title: 'About',
            body: 'Hand-finished in Pala.',
          ),
        ),
      ),
    );

    expect(find.text('Hand-finished in Pala.'), findsNothing);
    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();
    expect(find.text('Hand-finished in Pala.'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/features/home/widgets/our_works_showcase_carousel.dart';

void main() {
  testWidgets('Our Works showcase renders title and carousel', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OurWorksShowcaseCarousel(items: ourWorksFromProducts(const [])),
        ),
      ),
    );

    expect(find.text('Our Works'), findsOneWidget);
    expect(
      find.text('Signature pieces, crafted moments, and Moozhayil favourites.'),
      findsOneWidget,
    );
  });
}

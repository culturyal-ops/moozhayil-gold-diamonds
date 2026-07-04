import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/components/progress/progress_ring.dart';

void main() {
  testWidgets('ProgressRing shows clamped percent label', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ProgressRing(percent: 72))),
    );

    expect(find.text('72%'), findsOneWidget);
  });

  testWidgets('ProgressRing clamps values above 100', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: ProgressRing(percent: 150))),
    );

    expect(find.text('100%'), findsOneWidget);
  });
}

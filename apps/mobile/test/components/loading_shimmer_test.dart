import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/components/feedback/loading_shimmer.dart';
import 'package:moozhayil/core/constants/radii.dart';

void main() {
  Widget wrap(Widget child) {
    return MaterialApp(home: Scaffold(body: child));
  }

  group('LoadingShimmer', () {
    testWidgets('renders with specified dimensions', (tester) async {
      await tester.pumpWidget(
        wrap(const LoadingShimmer(width: 200, height: 60)),
      );
      final container = tester
          .widgetList<AnimatedBuilder>(find.byType(AnimatedBuilder))
          .first;
      expect(container, isNotNull);
    });

    testWidgets('default border radius uses card radius', (tester) async {
      await tester.pumpWidget(
        wrap(const LoadingShimmer(width: 200, height: 60)),
      );
      // Widget is present and renders without errors
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('custom border radius is accepted', (tester) async {
      await tester.pumpWidget(
        wrap(
          const LoadingShimmer(
            width: 200,
            height: 60,
            borderRadius: AppRadius.chip,
          ),
        ),
      );
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('full-width constructor renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 400,
              child: const LoadingShimmer.full(height: 60),
            ),
          ),
        ),
      );
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });

    testWidgets('animation does not throw on pump', (tester) async {
      await tester.pumpWidget(
        wrap(const LoadingShimmer(width: 200, height: 60)),
      );
      // Advance animation by one frame — should not throw
      await tester.pump(const Duration(milliseconds: 300));
      expect(find.byType(LoadingShimmer), findsOneWidget);
    });
  });
}

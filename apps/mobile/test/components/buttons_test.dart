import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moozhayil/components/buttons/destructive_button.dart';
import 'package:moozhayil/components/buttons/ghost_button.dart';
import 'package:moozhayil/components/buttons/primary_button.dart';
import 'package:moozhayil/components/buttons/secondary_button.dart';
import 'package:moozhayil/core/constants/colors.dart';

/// Widget tests for all four button components.
/// Validates: label renders, disabled state, loading state, onTap callback.
void main() {
  Widget wrap(Widget child) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(body: Center(child: child)),
      ),
    );
  }

  // ── PrimaryButton ─────────────────────────────────────────────────────────

  group('PrimaryButton', () {
    testWidgets('renders label text', (tester) async {
      await tester.pumpWidget(
        wrap(PrimaryButton(label: 'Tap Me', onTap: () {})),
      );
      expect(find.text('Tap Me'), findsOneWidget);
    });

    testWidgets('fires onTap when enabled', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(PrimaryButton(label: 'Go', onTap: () => tapped = true)),
      );
      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });

    testWidgets('disabled: does not fire onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          PrimaryButton(
            label: 'Go',
            onTap: () => tapped = true,
            isDisabled: true,
          ),
        ),
      );
      await tester.tap(find.text('Go'), warnIfMissed: false);
      expect(tapped, isFalse);
    });

    testWidgets('loading: shows CircularProgressIndicator', (tester) async {
      await tester.pumpWidget(
        wrap(PrimaryButton(label: 'Go', onTap: () {}, isLoading: true)),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      // Label not visible while loading
      expect(find.text('Go'), findsNothing);
    });

    testWidgets('disabled: uses disabled background color', (tester) async {
      await tester.pumpWidget(
        wrap(PrimaryButton(label: 'Go', onTap: () {}, isDisabled: true)),
      );
      // Find the AnimatedContainer that wraps the button body
      final container = tester
          .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
          .first;
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.disabledBg);
    });
  });

  // ── SecondaryButton ───────────────────────────────────────────────────────

  group('SecondaryButton', () {
    testWidgets('renders label', (tester) async {
      await tester.pumpWidget(
        wrap(SecondaryButton(label: 'Cancel', onTap: () {})),
      );
      expect(find.text('Cancel'), findsOneWidget);
    });

    testWidgets('disabled: does not fire onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(
          SecondaryButton(
            label: 'Cancel',
            onTap: () => tapped = true,
            isDisabled: true,
          ),
        ),
      );
      await tester.tap(find.text('Cancel'), warnIfMissed: false);
      expect(tapped, isFalse);
    });
  });

  // ── GhostButton ───────────────────────────────────────────────────────────

  group('GhostButton', () {
    testWidgets('renders label', (tester) async {
      await tester.pumpWidget(
        wrap(GhostButton(label: 'Learn More', onTap: () {})),
      );
      expect(find.text('Learn More'), findsOneWidget);
    });

    testWidgets('showArrow: appends arrow suffix', (tester) async {
      await tester.pumpWidget(
        wrap(GhostButton(label: 'View All', onTap: () {}, showArrow: true)),
      );
      expect(find.text('View All →'), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(GhostButton(label: 'Go', onTap: () => tapped = true)),
      );
      await tester.tap(find.text('Go'));
      expect(tapped, isTrue);
    });
  });

  // ── DestructiveButton ─────────────────────────────────────────────────────

  group('DestructiveButton', () {
    testWidgets('renders label', (tester) async {
      await tester.pumpWidget(
        wrap(DestructiveButton(label: 'Sign Out', onTap: () {})),
      );
      expect(find.text('Sign Out'), findsOneWidget);
    });

    testWidgets('fires onTap', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        wrap(DestructiveButton(label: 'Sign Out', onTap: () => tapped = true)),
      );
      await tester.tap(find.text('Sign Out'));
      expect(tapped, isTrue);
    });
  });
}

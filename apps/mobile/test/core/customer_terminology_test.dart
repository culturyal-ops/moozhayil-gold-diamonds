import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

/// Guards customer-facing lib copy against deprecated terminology.
void main() {
  test('lib customer strings avoid banned terminology', () {
    final libDir = Directory('lib');
    expect(libDir.existsSync(), isTrue);

    const banned = [
      'Golden Wish',
      'Aura AI',
      'Gold Nidhi',
      'My Goals',
      'Gold Goals',
    ];

    final violations = <String>[];
    for (final entity in libDir.listSync(recursive: true)) {
      if (entity is! File || !entity.path.endsWith('.dart')) continue;
      // Internal module paths may contain golden_wish folder names — scan string literals only.
      final content = entity.readAsStringSync();
      for (final term in banned) {
        if (content.contains("'$term'") || content.contains('"$term"')) {
          violations.add('${entity.path}: $term');
        }
      }
    }

    expect(violations, isEmpty, reason: violations.join('\n'));
  });
}

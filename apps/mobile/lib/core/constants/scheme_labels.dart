/// Customer-facing scheme names. Internal API values unchanged.
abstract final class SchemeLabels {
  static String customerName(String schemeType) {
    return switch (schemeType) {
      'aura' => 'Aura Plan',
      'crest' => 'Crest',
      'dhanam' => 'Dhanam',
      'gold_nidhi' => 'Swarna Nidhi',
      _ => schemeType,
    };
  }
}

import 'package:flutter/material.dart';



/// Luxury jewellery retail palette — crisp white base, burgundy + gold accents.

abstract final class AppColors {

  // Core surfaces

  /// Crisp pure white. Primary app background.

  static const Color paper = Color(0xFFFFFFFF);



  /// Secondary app background — barely warm grey-white.

  static const Color pearl = Color(0xFFFAFAF8);



  /// Warm ivory — small cards/panels only, never full pages.

  static const Color ivory = Color(0xFFFDFBF7);



  /// Navigation drawer — crisp white.

  static const Color drawerSurface = Color(0xFFFFFFFF);



  /// Pure white. Product images and elevated cards.

  static const Color bgWhite = Color(0xFFFFFFFF);



  /// Rich dark brown black. Hero overlays, drawer, footer.

  static const Color ink = Color(0xFF17120F);



  /// Brand burgundy — primary brand colour.

  static const Color brandBurgundy = Color(0xFF741323);



  /// Alias for scheme cards and CTAs.

  static const Color brandPrimary = brandBurgundy;



  /// Deep wine — full-bleed editorial statement panels.

  static const Color burgundyDeep = Color(0xFF7A1022);



  /// Darkest oxblood — footer ground and pattern base.

  static const Color burgundyDark = Color(0xFF410D1A);



  /// Cream — type and surfaces over burgundy grounds only.

  static const Color cream = Color(0xFFF4EDE3);



  // Text

  static const Color textPrimary = Color(0xFF17120F);

  static const Color textSecondary = Color(0xFF6F6862);

  static const Color textMuted = Color(0xFF8A837A);



  // Gold accent

  static const Color gold = Color(0xFFB88A3B);

  static const Color goldLight = Color(0xFFD4B483);



  // Borders

  static const Color border = Color(0xFFE8E2D8);

  static const Color borderGold = Color(0xFFD4C4A8);

  static const Color borderStrong = Color(0xFFD8D0C6);



  // Glass

  static const Color glassSurface = Color(0xF2FFFFFF);

  static const Color glassBorder = Color(0xFFE5E0D8);

  static const Color shadowSoft = Color(0x0F17120F);



  // Legacy aliases — map old beige defaults to white retail surfaces

  static const Color maroon = brandBurgundy;

  static const Color maroonDeep = ink;

  static const Color maroonSoft = pearl;

  static const Color maroonMuted = textSecondary;

  static const Color obsidian = textPrimary;

  static const Color deepMahogany = ink;

  static const Color slateMist = textMuted;

  static const Color warmIvory = paper;

  static const Color offWhite = paper;

  static const Color champagneVeil = pearl;

  static const Color pureWhite = bgWhite;

  static const Color smokeLine = border;

  static const Color antiqueGold = gold;

  static const Color antiqueGoldPressed = Color(0xFFA07F48);

  static const Color blushClay = Color(0xFFB0866A);

  static const Color sageWhisper = Color(0xFF8C8472);

  static const Color vaultDusk = pearl;

  static const Color starlightGold = gold;

  static const Color moonveil = pearl;

  static const Color nebulaEdge = border;

  static const Color successFill = Color(0x1F8C8472);

  static const Color warningFill = Color(0x1FB8965A);

  static const Color errorFill = Color(0x1FB0866A);

  static const Color disabledBg = Color(0xFFF5F4F2);

  static const Color disabledText = textMuted;

  static const Color shimmerBase = bgWhite;

  static const Color shimmerHighlight = border;

}



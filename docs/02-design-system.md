# 02 — Design System
## Moozhayil Gold & Diamonds — Complete Design Tokens

---

## COLOR TOKENS

```dart
// Primary Brand
const Color obsidian        = Color(0xFF1A1612);
const Color warmIvory       = Color(0xFFFAF7F2);
const Color antiqueGold     = Color(0xFFB8962E);
const Color champagneVeil   = Color(0xFFEFE3C8);
const Color deepMahogany    = Color(0xFF2C1810);

// Supporting
const Color blushClay       = Color(0xFFDEB8A8);
const Color sageWhisper     = Color(0xFFBDC4B0);
const Color slateMist       = Color(0xFF8C8C8C);
const Color pureWhite       = Color(0xFFFFFFFF);
const Color smokeLine       = Color(0xFFEBEBEB);

// Dream Vault Micro-palette
const Color vaultDusk       = Color(0xFF1E1A2E);
const Color starlightGold   = Color(0xFFD4A843);
const Color moonveil        = Color(0xFFF5F0FF);
const Color nebulaEdge      = Color(0xFFC4B8D4);

// Semantic
const Color successFill     = Color(0xFFBDC4B020);  // 12% opacity
const Color warningFill     = Color(0xFFEFE3C820);  // 12% opacity
const Color errorFill       = Color(0xFFDEB8A820);  // 12% opacity
const Color disabledBg      = Color(0xFFEBEBEB);
const Color disabledText    = Color(0xFF8C8C8C);
```

---

## TYPOGRAPHY TOKENS

Fonts required: `Cormorant_Garamond`, `DM_Sans`

```dart
// Cormorant Garamond — Display / Emotional
const TextStyle displayXL = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 52,
  fontWeight: FontWeight.w300,
  height: 1.1,
  letterSpacing: -0.5,
  color: obsidian,
);

const TextStyle displayLG = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 36,
  fontWeight: FontWeight.w300,
  height: 1.15,
  color: obsidian,
);

const TextStyle headingXL = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 32,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: obsidian,
);

const TextStyle headingLG = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 28,
  fontWeight: FontWeight.w400,
  height: 1.25,
  color: obsidian,
);

const TextStyle headingMD = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 22,
  fontWeight: FontWeight.w500,
  height: 1.3,
  color: obsidian,
);

const TextStyle headingSM = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 18,
  fontWeight: FontWeight.w400,
  height: 1.35,
  color: obsidian,
);

const TextStyle productName = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 1.4,
  color: obsidian,
);

const TextStyle auraVoice = TextStyle(
  fontFamily: 'Cormorant_Garamond',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontStyle: FontStyle.italic,
  height: 1.5,
  color: obsidian,
);

// DM Sans — UI / Functional
const TextStyle uiBodyLG = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  height: 1.5,
  color: obsidian,
);

const TextStyle uiBodyMD = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 15,
  fontWeight: FontWeight.w400,
  height: 1.5,
  color: obsidian,
);

const TextStyle uiBodySM = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 1.5,
  color: obsidian,
);

const TextStyle uiLabel = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 13,
  fontWeight: FontWeight.w400,
  height: 1.4,
  color: slateMist,
);

const TextStyle uiCaption = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 12,
  fontWeight: FontWeight.w400,
  height: 1.4,
  color: slateMist,
);

const TextStyle uiMicro = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 10,
  fontWeight: FontWeight.w600,
  letterSpacing: 0.5,
  height: 1.3,
);

const TextStyle buttonLabel = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 15,
  fontWeight: FontWeight.w600,
  height: 1.0,
  letterSpacing: 0.2,
);

const TextStyle buttonLabelSM = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 13,
  fontWeight: FontWeight.w600,
  height: 1.0,
);

// Price display
const TextStyle priceLG = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 22,
  fontWeight: FontWeight.w600,
  height: 1.2,
  color: obsidian,
);

const TextStyle priceMD = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 16,
  fontWeight: FontWeight.w500,
  height: 1.2,
  color: obsidian,
);

const TextStyle priceSM = TextStyle(
  fontFamily: 'DM_Sans',
  fontSize: 13,
  fontWeight: FontWeight.w400,
  height: 1.2,
  color: slateMist,
);
```

---

## SPACING TOKENS

```dart
const double spaceXXS  = 4.0;
const double spaceXS   = 8.0;
const double spaceSM   = 12.0;
const double spaceMD   = 16.0;
const double spaceLG   = 24.0;
const double spaceXL   = 32.0;
const double spaceXXL  = 48.0;
const double space3XL  = 64.0;

// Horizontal screen padding
const double screenPadding    = 16.0;
const double screenPaddingLG  = 24.0;

// Component internal padding
const double cardPaddingSM    = 12.0;
const double cardPaddingMD    = 16.0;
const double cardPaddingLG    = 20.0;

// Tab bar
const double tabBarHeight     = 64.0;
const double topBarHeight     = 56.0;

// Bottom sheet handle
const double bottomSheetHandleWidth  = 36.0;
const double bottomSheetHandleHeight = 4.0;
```

---

## BORDER RADIUS TOKENS

```dart
const double radiusXS   = 4.0;
const double radiusSM   = 8.0;
const double radiusMD   = 12.0;
const double radiusLG   = 16.0;
const double radiusXL   = 20.0;
const double radiusFull = 999.0;  // pill shapes

// Specific uses
const double cardRadius         = 12.0;
const double buttonRadius       = 8.0;
const double chipRadius         = 20.0;    // pill chips
const double inputRadius        = 8.0;
const double bottomSheetRadius  = 20.0;   // top corners only
const double avatarRadius       = 999.0;
const double productImageRadius = 12.0;
```

---

## SHADOW TOKENS

```dart
// Card shadow (default)
const BoxShadow shadowSM = BoxShadow(
  color: Color(0x0F1A1612),   // 6% opacity
  offset: Offset(0, 2),
  blurRadius: 12,
  spreadRadius: 0,
);

// Elevated card
const BoxShadow shadowMD = BoxShadow(
  color: Color(0x141A1612),   // 8% opacity
  offset: Offset(0, 4),
  blurRadius: 20,
  spreadRadius: 0,
);

// Bottom bar / sticky elements
const BoxShadow shadowTop = BoxShadow(
  color: Color(0x0F1A1612),
  offset: Offset(0, -2),
  blurRadius: 12,
  spreadRadius: 0,
);

// Dream Vault elevated card
const BoxShadow shadowVault = BoxShadow(
  color: Color(0x1A1E1A2E),   // 10% vault dusk
  offset: Offset(0, 4),
  blurRadius: 24,
  spreadRadius: 0,
);
```

---

## ANIMATION TOKENS

```dart
// Durations
const Duration animXS     = Duration(milliseconds: 120);
const Duration animSM     = Duration(milliseconds: 200);
const Duration animMD     = Duration(milliseconds: 280);
const Duration animLG     = Duration(milliseconds: 350);
const Duration animXL     = Duration(milliseconds: 500);
const Duration animXXL    = Duration(milliseconds: 600);
const Duration animSplash = Duration(milliseconds: 2400);  // onboarding slide hold

// Curves
const Curve curveDefault    = Curves.easeOut;
const Curve curveDecelerate = Curves.decelerate;
const Curve curveSpring     = Curves.elasticOut;   // used only for wishlist heart
const Curve curveFade       = Curves.easeInOut;

// Progress ring fill
// Duration: 600ms, curve: Curves.easeOut
// Triggered on: mount, value change

// Gold balance count-up
// Duration: 800ms, curve: Curves.easeOut
// Triggered on: screen enter, new contribution added

// Milestone pulse (ring glow)
// Duration: 800ms, one-shot
// Scale: 1.0 → 1.12 → 1.0
// Opacity: ring glow 0 → 0.4 → 0

// Page transitions
// Default: slide from right, 280ms easeOut
// Modal/bottom sheet: slide from bottom, 350ms easeOut
// Vault screen: fade + slight scale (1.02 → 1.0), 350ms

// Shimmer
// Duration: 1200ms loop
// Gradient: warmIvory → smokeLine → warmIvory
```

---

## ICON SYSTEM

Icon size scale:
```dart
const double iconXS  = 16.0;
const double iconSM  = 20.0;
const double iconMD  = 24.0;
const double iconLG  = 32.0;
const double iconXL  = 48.0;
```

All icons: custom SVG line-art, 1.5px stroke weight, no fill by default.
Active/filled variants for: Heart (wishlist), Star (collections), Check states.

Required icons (custom set):
```
HamburgerIcon
DreamVaultIcon     // vault/safe outline
CartIcon
BackArrow
SearchIcon
MicIcon
FilterIcon
SortIcon
WishlistHeart
ShareIcon
ARIcon
ChevronRight
ChevronDown
CloseIcon (×)
AddIcon (+)
ShopIcon
GoalIcon
TrackIcon
StoreIcon
AuraMonogram
CalendarIcon
BadgeIcon
MapPinIcon
ShieldIcon
NotificationIcon
ProfileIcon
```

---

## BUTTON SYSTEM

### Primary Button
```dart
Height: 48px
Background: antiqueGold (#B8962E)
Text: buttonLabel style, obsidian (#1A1612)
Border radius: buttonRadius (8px)
Padding: horizontal 24px
Full-width variant: width = double.infinity

States:
  default:   bg #B8962E
  pressed:   bg #A0831F (darken 10%)
  disabled:  bg #EBEBEB, text #8C8C8C
  loading:   CircularProgressIndicator 16px, obsidian, centered
```

### Secondary Button (Outlined)
```dart
Height: 48px
Background: transparent
Border: 1.5px solid antiqueGold
Text: buttonLabel style, antiqueGold
Border radius: 8px

States:
  default:  transparent bg, #B8962E border
  pressed:  bg #EFE3C8
  disabled: border #EBEBEB, text #8C8C8C
```

### Ghost Button (Text only)
```dart
Height: 44px
Background: transparent
Text: buttonLabelSM, antiqueGold, underline decoration
No border

Use: tertiary actions ("View All", "See History", "Learn More")
```

### Destructive Button
```dart
Same as Secondary but:
Border: 1.5px solid blushClay (#DEB8A8)
Text: blushClay
Use: "Sign Out", "Remove from Vault"
```

### Icon Button
```dart
Size: 40px × 40px (minimum tap target)
Background: transparent (or rgba white for image overlays)
Icon: iconMD (24px)
Border radius: full (circular)
```

---

## CARD SYSTEM

### Base Card
```dart
Background: pureWhite
Border radius: cardRadius (12px)
Shadow: shadowSM
Padding: cardPaddingMD (16px)
```

### Highlight Card (Goal/Scheme)
```dart
Base card +
Border-left: 3px solid antiqueGold
```

### Vault Card
```dart
Background: pureWhite
Border radius: cardRadius (12px)
Shadow: shadowVault
No left border
```

### Dark Card (Hero sections)
```dart
Background: deepMahogany (#2C1810)
Border radius: cardRadius
Text colors: warmIvory, champagneVeil
```

### Interstitial Card (inline in lists)
```dart
Background: champagneVeil (#EFE3C8)
Border radius: cardRadius
No shadow
Width: full-width (spans full grid)
```

---

## INPUT SYSTEM

### Text Input (Default)
```dart
Height: 48px
Background: Color(0xFFF5F5F5)
Border radius: inputRadius (8px)
Padding: horizontal 16px
Font: uiBodyMD
Placeholder color: slateMist

Focus state:
  Border: 1.5px solid antiqueGold
  Background: pureWhite

Error state:
  Border: 1.5px solid blushClay
  Error text: DM Sans 12px blushClay, below input

Underline variant (name screen, single-field screens):
  Background: transparent
  Bottom border only: 1.5px solid smokeLine
  Focus: bottom border antiqueGold
```

### Slider Input
```dart
Track height: 4px
Track color (inactive): smokeLine
Track color (active): antiqueGold
Thumb: 24px circle, pureWhite, shadow shadowMD
```

---

## PROGRESS RING SYSTEM

All rings use SVG/Canvas arc, no third-party progress libraries.

```dart
// Sizes
const double ringLG  = 180.0;  // My Gold hero
const double ringMD  = 80.0;   // Goal cards, home screen
const double ringSM  = 48.0;   // Vault cards
const double ringXS  = 28.0;   // Product page inline, preview rows

// Stroke widths (proportional)
ringLG: strokeWidth 10px
ringMD: strokeWidth 8px
ringSM: strokeWidth 6px
ringXS: strokeWidth 4px

// Colors
trackColor: champagneVeil (#EFE3C8)
fillColor:  antiqueGold (#B8962E)

// Vault context (Dream Vault screen)
fillColor:  starlightGold (#D4A843)

// Completed (100%)
fillColor:  antiqueGold, + outer glow pulse animation

// Animation
duration: 600ms
curve: Curves.easeOut
triggerOn: mount, value change
```

---

## BOTTOM SHEET SYSTEM

```dart
Background: pureWhite
Top border radius: bottomSheetRadius (20px)
Handle: 36px × 4px, smokeLine, centered, mt-8

Standard padding: spaceLG (24px) horizontal, spaceMD (16px) top content
Max height: 85% screen height
Scrollable if content exceeds

DismissType: swipe down OR tap scrim
Scrim: rgba(0,0,0,0.4)
```

---

## BADGE / CHIP SYSTEM

### Status Badge
```dart
Height: 24px
Padding: horizontal 8px
Border radius: chipRadius (20px)
Font: uiMicro (DM Sans 10px SemiBold)

Variants:
  onTrack:    bg #BDC4B020, text #BDC4B0
  due:        bg #EFE3C820, text #B8962E
  completed:  bg #BDC4B040, text #1A1612
  paused:     bg #EBEBEB,   text #8C8C8C
  verified:   bg #BDC4B020, text #BDC4B0
  pending:    bg #EFE3C8,   text #B8962E
```

### Filter Chip
```dart
Height: 36px
Padding: horizontal 14px
Border radius: chipRadius (20px)
Font: uiBodySM DM Sans

default:  bg pureWhite, border 1px smokeLine, text obsidian
active:   bg antiqueGold, no border, text obsidian
```

---

## NAVIGATION SYSTEM

### Bottom Tab Bar
```dart
Height: 64px + safe area
Background: pureWhite
Top border: 1px smokeLine

Tab item:
  Icon: 24px
  Label: DM Sans 11px

States:
  active:   icon + label antiqueGold
  inactive: icon + label slateMist

Badge (Cart, notification):
  Diameter: 18px
  Background: antiqueGold
  Text: DM Sans 10px SemiBold, pureWhite
  Position: top-right of icon, offset (-4px, -4px)
```

### Top App Bar
```dart
Height: 56px
Background: pureWhite
Bottom border: 1px smokeLine

Left:  HamburgerIcon (iconMD, slateMist)
Center: "Moozhayil" — Cormorant Garamond 20px obsidian
Right: [DreamVaultIcon, CartIcon] — iconMD, obsidian, gap 16px
```

### Navigation Drawer (Hamburger)
```dart
Width: 80% screen width, max 320px
Background: warmIvory
Slide-in from left: animLG (350ms) easeOut

Content:
  Top: brand monogram 32px + "Est. 1969" — DM Sans 11px slateMist
  Divider: 1px smokeLine
  Links: Cormorant Garamond 18px obsidian, height 52px each
  Bottom: "Thrissur, Kerala" — DM Sans 12px slateMist + store hours

Scrim: rgba(0,0,0,0.3) on right side, tap to dismiss
```

---

## SCREEN LAYOUT TEMPLATES

### Standard Scroll Screen
```
StatusBar (system)
TopAppBar (56px)
ScrollView (flex 1)
  Content sections (variable)
  Bottom padding (tabBarHeight + spaceLG = 88px)
TabBar (64px + safe area)
```

### Full-Screen Modal
```
StatusBar: light content (white icons)
Background: deepMahogany OR vaultDusk
No TopAppBar (back arrow floated)
Content centered vertically
```

### Bottom Sheet
```
Scrim overlay
BottomSheet (slides up from bottom)
  Handle
  Content
  CTA button (fixed within sheet)
```

### Multi-Step Flow
```
TopAppBar: BackArrow + step title + progress dots
Content area (scrollable)
Fixed bottom CTA area (80px)
```

---

## SHIMMER / SKELETON SYSTEM

All loading states use shimmer:
```dart
ShimmerWidget:
  baseColor: Color(0xFFF5F5F5)
  highlightColor: Color(0xFFEBEBEB)
  direction: left to right
  duration: 1200ms loop

Usage: wrap any placeholder Box/Container with ShimmerWidget
Shapes must match the content they replace (same size, same border radius)
```

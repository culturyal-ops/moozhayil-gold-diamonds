# 03 — Component Library
## Moozhayil Gold & Diamonds — Every Component Defined

---

## COMPONENT NAMING CONVENTION

All components: PascalCase
All props: camelCase
All states documented as enum values
File structure: `/lib/components/{category}/{ComponentName}.dart`

---

## CATEGORY: NAVIGATION

---

### TopAppBar
Path: `/lib/components/navigation/TopAppBar.dart`

```
Purpose: Global top bar, present on all main screens

Props:
  showBack: bool (default false)
  title: String | null  // shown when showBack=true
  actions: List<Widget>  // right side icons

Variants:
  main:     hamburger + logo + [vaultIcon, cartIcon]
  detail:   backArrow + title + [shareIcon]
  minimal:  backArrow only, no title

States:
  cartCount 0:   no badge on cart icon
  cartCount >0:  gold badge with count
  vaultCount 0:  no badge
  vaultCount >0: no numeric badge, just dot indicator
```

---

### BottomTabBar
Path: `/lib/components/navigation/BottomTabBar.dart`

```
Purpose: Persistent bottom navigation

Props:
  currentIndex: int
  onTap: (int) => void

Tab definitions (fixed):
  index 0: HomeIcon,   "Home"
  index 1: ShopIcon,   "Shop"
  index 2: GoalIcon,   "Goals"
  index 3: AuraIcon,   "Aura"
  index 4: ProfileIcon,"Profile"

States:
  active:   icon + label antiqueGold
  inactive: icon + label slateMist
  badged:   dot badge on Goals tab if contribution_due
```

---

### NavigationDrawer
Path: `/lib/components/navigation/NavigationDrawer.dart`

```
Purpose: Hamburger menu full screen drawer

Props:
  isOpen: bool
  onClose: () => void
  userName: String
  memberSince: int

DrawerLink props:
  label: String
  route: String
  icon: IconData

States:
  open:   visible, scrim active
  closed: off-screen left
```

---

## CATEGORY: PROGRESS

---

### ProgressRing
Path: `/lib/components/progress/ProgressRing.dart`

```
Purpose: Circular gold progress indicator — core visual component

Props:
  percent: double (0.0–1.0)
  size: ProgressRingSize (lg | md | sm | xs)
  centerLabel: String | null      // e.g. "37.4g"
  sublabel: String | null         // e.g. "72%"
  context: ProgressRingContext (default | vault | completed)
  animated: bool (default true)

Sizes:
  lg: 180px diameter, stroke 10px
  md: 80px diameter,  stroke 8px
  sm: 48px diameter,  stroke 6px
  xs: 28px diameter,  stroke 4px

Contexts:
  default:   fill antiqueGold, track champagneVeil
  vault:     fill starlightGold, track nebulaEdge
  completed: fill antiqueGold + pulse animation on mount

States:
  loading: shimmer ring (track only, no fill)
  zero:    track only, no fill
  partial: fill to percent
  complete: full fill + pulse

Animation:
  Fill: 600ms easeOut, triggered on mount + value change
  Complete pulse: 800ms, one-shot, scale 1.0→1.12→1.0

Edge cases:
  percent > 1.0: clamp to 1.0, no overflow
  percent < 0.0: clamp to 0.0
  null centerLabel: no center text
```

---

### MilestoneTimeline
Path: `/lib/components/progress/MilestoneTimeline.dart`

```
Purpose: Horizontal dot timeline showing contribution history

Props:
  contributions: List<Contribution>
  milestoneGrams: List<double>  // [10, 25, 50, 100]
  totalMonths: int
  currentMonth: int

DotStates per month:
  paid:     filled antiqueGold dot (8px)
  upcoming: empty circle, smokeLine border (8px)
  missed:   filled blushClay dot (8px) — no alarming red
  milestone: larger dot (14px) antiqueGold + gram label above

Layout:
  Horizontal ScrollView
  Equal spacing between dots
  Line connecting all dots: 1px smokeLine

Accessibility:
  Each dot has tooltip on long-press: "{month}: {status}"
```

---

### LinearProgressBar
Path: `/lib/components/progress/LinearProgressBar.dart`

```
Purpose: Horizontal progress bar (secondary use, goal detail)

Props:
  percent: double (0.0–1.0)
  height: double (default 6.0)
  label: String | null

Visual:
  Track: smokeLine, radius full
  Fill: antiqueGold, radius full
  Animation: 400ms easeOut on value change
```

---

## CATEGORY: CARDS

---

### ProductCard
Path: `/lib/components/cards/ProductCard.dart`

```
Purpose: Product tile for grids and horizontal scrolls

Props:
  productId: String
  name: String
  images: List<String>
  purity: String
  weightGrams: double
  priceRupees: int
  isWishlisted: bool
  schemeMonthlyAmount: int | null
  onTap: () => void
  onWishlistTap: () => void
  variant: ProductCardVariant (grid | list | horizontal)

Variants:
  grid:
    Width: (screenWidth - 48) / 2
    Image: 3:4 aspect ratio
    Name: 2 lines max, Cormorant 14px
    Meta: purity + weight, DM Sans 11px
    Price: DM Sans 16px
    SchemeNudge: "Or ₹{n}/mo" — shown only if priceRupees > 25000

  list:
    Full-width row
    Image: 80px square left
    Content: name, meta, price stacked right

  horizontal:
    Width: 140px fixed
    Image: 140×100px
    Name: 1 line truncate

States:
  default:    standard
  wishlisted: heart icon filled antiqueGold
  loading:    shimmer (matches variant dimensions)
  outOfStock: image desaturated, "Out of Stock" overlay label
  newBadge:   "New" chip top-left of image

WishlistHeart animation:
  Tap → scale 0.8 → 1.3 → 1.0, 200ms, spring curve
  Color transition: slateMist → antiqueGold
```

---

### GoalCard
Path: `/lib/components/cards/GoalCard.dart`

```
Purpose: Active goal display with progress ring

Props:
  goalId: String
  goalName: String
  goalType: GoalType
  productImage: String | null
  productName: String | null
  targetGrams: double
  currentGrams: double
  percentComplete: double
  targetDate: DateTime
  monthlyAmountRupees: int
  status: GoalStatus (onTrack | contributionDue | completed | paused)
  onTap: () => void
  onManageTap: () => void

Layout:
  If productImage != null:
    Top strip: full-width product image, height 100px, cover
  Content area: padding 16px
    Left: ProgressRing (md, 80px)
    Right column:
      goalName (Cormorant 18px)
      "{currentGrams}g of {targetGrams}g" (DM Sans 13px)
      "{percent}% · {timeRemaining}" (DM Sans 12px slateMist)
      StatusBadge
    Bottom: "Manage Goal →" text button

States:
  onTrack:        standard
  contributionDue: subtle pulse on StatusBadge, once per session
  completed:      ring full, bg champagneVeil tint
  paused:         ring greyed, italic "Paused" label
  loading:        shimmer, height 180px

Status badge backgrounds (see design system)
```

---

### DreamVaultCard
Path: `/lib/components/cards/DreamVaultCard.dart`

```
Purpose: Product saved to Dream Vault with progress

Props:
  productId: String
  productName: String
  productImage: String
  productCategory: String
  priceRupees: int
  requiredGrams: double
  currentGrams: double
  percentComplete: double
  canAffordNow: bool
  goalAttached: bool
  goalId: String | null
  onBuyTap: () => void
  onStartGoalTap: () => void
  onViewGoalTap: () => void
  onRemoveTap: () => void

Layout:
  Image: full-width, height 180px, cover, radius 12 top
  Content: padding 16px
    Left: name, category, price
    Right: ProgressRing (sm, 48px) + gram display
  Action row: see state-based CTAs below

States:
  canAffordNow: primary button "Buy With My Gold"
                bg antiqueGold + sage-tinted border
  goalAttached: ghost button "View Goal →"
  noGoal:       secondary button "Start Accumulating →"
                + "₹{monthly}/month for {months} months" hint

Remove: × icon top-right of card, 40px tap target
On remove tap: ConfirmationBottomSheet appears before deletion
```

---

### CollectionCard
Path: `/lib/components/cards/CollectionCard.dart`

```
Purpose: Editorial collection tile

Props:
  collectionId: String
  name: String
  coverImage: String
  pieceCount: int
  startingPriceRupees: int
  onTap: () => void

Dimensions:
  Width: 160px
  Height: 200px

Layout:
  Top 70%: image, cover, radius 12 top
  Bottom 30%: bg pureWhite, radius 12 bottom, padding 12
    name: Cormorant 15px
    meta: "{pieceCount} pieces · From ₹{price}" DM Sans 11px slateMist

States:
  loading: shimmer 160×200
```

---

### OccasionChip
Path: `/lib/components/cards/OccasionChip.dart`

```
Purpose: Occasion-based category selector

Props:
  occasionId: String
  label: String
  bgImage: String | null
  isSelected: bool
  onTap: () => void

Dimensions: height 40px, min-width 80px, padding horizontal 16px
Border radius: chipRadius (20px)

States:
  default:  bg pureWhite, border 1px smokeLine, text obsidian
  selected: bg champagneVeil, border 1px antiqueGold, text antiqueGold
  hover:    bg Color(0xFFF5F5F5)
```

---

### GreetingCard
Path: `/lib/components/cards/GreetingCard.dart`

```
Purpose: Personalised home screen greeting

Props:
  name: String
  goldBalanceGrams: double
  monthlyGrowthRupees: int
  state: GreetingState (newUser | activeGoal | noGrowth | multipleGoals)

Layout:
  Border-left 3px antiqueGold
  Padding 16px
  Line 1: "Good {timeOfDay}, {name}." DM Sans 15px
  Line 2: contextual text (see states)

States (line 2 content):
  newUser:       "Your gold journey starts when you do." — italic slateMist
  activeGoal:    "Your reserve grew ₹{n} this month." — italic antiqueGold
  noGrowth:      "Your gold is waiting for your next contribution." — italic slateMist
  multipleGoals: "Across {n} goals, your gold is growing." — italic antiqueGold
```

---

### AuraInsightBanner
Path: `/lib/components/cards/AuraInsightBanner.dart`

```
Purpose: Ambient Aura insight on home screen

Props:
  insightText: String
  insightType: InsightType (rate | goal | milestone | generic)
  linkRoute: String
  isLoading: bool

Layout:
  bg pureWhite, radius 12, padding 16, shadow-sm
  Left: AuraMonogram SVG 16px antiqueGold
  Body: insightText — auraVoice style
  Bottom-right: "Via Aura →" — DM Sans 10px slateMist

States:
  loading:     shimmer 2 text lines
  noData:      render null (do not show)
  firstTime:   static text: "Aura will offer insights once your journey begins."
```

---

### SchemeInterstitialCard
Path: `/lib/components/cards/SchemeInterstitialCard.dart`

```
Purpose: Inline scheme promotion within product grid (every 6 products)

Props:
  onTap: () => void

Layout:
  Full-width, spans both columns
  bg champagneVeil, radius 12, padding 16
  Text: "Saving for something like this? A Gold Goal gets you there." DM Sans 14px
  CTA: "See How Goals Work →" — ghost antiqueGold

States: static, no variants
```

---

### TrustAnchorsRow
Path: `/lib/components/cards/TrustAnchorsRow.dart`

```
Purpose: Trust signals row, home screen bottom

Props: none (static content)

Items: Since 1969 | BIS Hallmarked | Physical Showroom | Kerala's Own
Each: icon 20px slateMist + DM Sans 10px slateMist label
Layout: horizontal row, 4 equal tiles, mx-16
```

---

## CATEGORY: BUTTONS

---

### PrimaryButton
```
Props:
  label: String
  onTap: () => void
  isLoading: bool (default false)
  isDisabled: bool (default false)
  isFullWidth: bool (default false)
  iconLeft: IconData | null
  iconRight: IconData | null

See design system for visual spec
```

### SecondaryButton
```
Props:
  label: String
  onTap: () => void
  isLoading: bool
  isDisabled: bool
  isFullWidth: bool
```

### GhostButton
```
Props:
  label: String
  onTap: () => void
  isDisabled: bool
  showArrow: bool (default false)  // adds → suffix
```

### DestructiveButton
```
Props:
  label: String
  onTap: () => void
```

### WishlistHeart
```
Props:
  isWishlisted: bool
  isLoading: bool
  onTap: () => void
  size: double (default 20px)

Animation: see design system wishlist heart spec
```

---

## CATEGORY: INPUTS

---

### SearchBar
```
Props:
  placeholder: String
  onTap: () => void  // navigates to search screen (not inline)

Note: This component is display-only, tap to navigate.
Actual search input is on SearchScreen.
```

### TextInput
```
Props:
  label: String | null
  placeholder: String
  value: String
  onChanged: (String) => void
  onSubmit: (String) => void
  errorText: String | null
  isPassword: bool (default false)
  keyboardType: TextInputType
  maxLength: int | null
  variant: InputVariant (boxed | underline)
```

### SliderInput
```
Props:
  min: double
  max: double
  step: double
  value: double
  onChanged: (double) => void
  formatLabel: (double) => String  // e.g. "₹{value}"
  livePreview: String | null       // updates below slider
```

### FilterBar
```
Props:
  filters: List<FilterOption>
  activeIds: List<String>
  sortOption: SortOption
  onFilterToggle: (String) => void
  onSortChange: (SortOption) => void

FilterOption: { id, label }
SortOption: enum (newest | priceLow | priceHigh | mostLoved | byWeight)
```

---

## CATEGORY: FEEDBACK

---

### StatusBadge
```
Props:
  status: BadgeStatus (onTrack | due | completed | paused | verified | pending)
  label: String | null  // overrides default label if provided

See design system badge spec for colors
```

### LoadingShimmer
```
Props:
  width: double
  height: double
  borderRadius: double (default cardRadius)

Wraps arbitrary placeholder shapes
```

### EmptyState
```
Props:
  icon: IconData | null
  headline: String
  body: String | null
  ctaLabel: String | null
  onCtaTap: () => void | null

Layout: centered vertical stack, mx-32, top padding 48px
```

### ErrorState
```
Props:
  headline: String (default "Something went wrong")
  body: String | null
  onRetry: () => void | null

Layout: centered, retry button below text
```

### OfflineBanner
```
Props: none (reads connectivity state internally)

Displays: "You're offline. Some features may not load."
Position: below TopAppBar
Auto-hides when reconnected
```

---

## CATEGORY: OVERLAYS

---

### ConfirmationBottomSheet
```
Props:
  title: String
  body: String
  confirmLabel: String
  cancelLabel: String
  onConfirm: () => void
  onCancel: () => void
  isDestructive: bool (default false)

Dismiss: swipe down, tap scrim, or cancel button
```

### SortBottomSheet
```
Props:
  currentSort: SortOption
  onSelect: (SortOption) => void

Items: 5 sort options as radio list
```

### PriceBreakdownSheet
```
Props:
  goldValueRupees: int
  makingChargeRupees: int
  makingChargePct: double
  gstRupees: int
  totalRupees: int

Layout: labeled rows, Divider, total row
```

### GoalStartBottomSheet
```
Purpose: Appears when user taps "Start Accumulating" from DreamVaultCard

Props:
  productName: String
  productPriceRupees: int
  requiredGrams: double
  currentGrams: double
  suggestedMonthly: int
  estimatedMonths: int
  onStartGoal: () => void
  onDismiss: () => void

Layout:
  Product thumbnail + name
  Insight: "At ₹{monthly}/month, you'll reach this in {months} months"
  CTA: "Create This Goal" primary
  Secondary: "Customise amount →"
```

---

## CATEGORY: AURA-SPECIFIC

---

### AuraConversationCard
```
Purpose: A single turn in an Aura structured conversation

Props:
  message: String             // Aura's text
  options: List<AuraOption> | null
  widget: AuraWidgetType | null  // slider, date-picker, etc.
  isLoading: bool

Layout:
  bg pureWhite, radius 16, mx-16, padding 20, shadow-sm
  Message: auraVoice text style
  Options: vertical stack of OptionButtons (if options != null)
  Widget: embedded (if widget != null)

AuraOption: { id, label }
OptionButton:
  Height 48px, bg #FAF7F2, radius 8
  Selected: bg champagneVeil, border-left 2px antiqueGold
```

### AuraActionCard
```
Purpose: Landing screen suggested action

Props:
  label: String
  onTap: () => void

Layout: bg pureWhite, radius 12, padding 16, shadow-sm
  Cormorant 17px text + ChevronRight
  Full-width, mx-16
```

---

## CATEGORY: PRODUCT PAGE

---

### ProductImageGallery
```
Props:
  images: List<ProductImage>   // { url, type: whiteBackground|onModel|detail|lifestyle }
  hasAR: bool

Layout:
  Full-width PageView
  Aspect ratio 1:1
  Dot indicators
  Overlay: back arrow, wishlist heart, share icon
  AR button (if hasAR)

States:
  loading: shimmer 1:1
  singleImage: no swipe, no dots
  multipleImages: swipe + dots
```

### ProductSpecsRow
```
Props:
  purity: String
  weightGrams: double
  makingChargePct: double
  hasCertificate: bool

Layout: 4-tile equal-width row
See product spec screen for exact visual
```

### AffordabilityBridge
```
Props:
  productPriceRupees: int
  productPriceGrams: double
  userGoldBalanceGrams: double
  userGoldBalanceRupees: int
  hasActiveScheme: bool
  schemeName: String | null
  onStartGoalTap: () => void
  onViewGoalTap: () => void

States:
  hasBalance, canAffordNow, noBalance+hasScheme, noBalance+noScheme
  See product spec screen for full state logic
```

### ProductActionsBar
```
Purpose: Fixed bottom bar on product page

Props:
  isInVault: bool
  isAddingToVault: bool
  isOutOfStock: bool
  onVaultTap: () => void
  onBuyNowTap: () => void
  onNotifyMeTap: () => void

Layout: fixed bottom, above tab bar, shadow-top
```

---

## COMPONENT DEPENDENCY MAP

```
ProgressRing
  ← used by: GoalCard, DreamVaultCard, GoalProgressRingCard, AffordabilityBridge,
             MilestoneTimeline (dot variant), MyGoldHero

GoalCard
  ← used by: GoalsScreen, HomeGoalSection

DreamVaultCard
  ← used by: DreamVaultScreen, DreamVaultPreviewRow (compact variant)

ProductCard
  ← used by: ProductGrid, FeaturedProductsRow, CanRedeemTodayRow, 
             AuraRecommendations, SimilarProducts

AuraConversationCard
  ← used by: AuraGoalPlanningFlow, AuraProductDiscoveryFlow, AuraChatView

AffordabilityBridge
  ← used by: ProductDetailScreen

GreetingCard
  ← used by: HomeScreen

AuraInsightBanner
  ← used by: HomeScreen, AuraLandingScreen
```

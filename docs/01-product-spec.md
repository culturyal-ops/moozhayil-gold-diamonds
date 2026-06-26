# 01 — Product Specification
## Moozhayil Gold & Diamonds — Implementation-Ready Screen Spec

---

## APP SHELL

### Navigation
- Type: Bottom tab bar, persistent
- Tabs: Home | Shop | Goals | Aura | Profile
- Tab bar height: 64px
- Safe area: respected on all devices
- Badge support: Cart (number), Goals (dot if contribution due)

### Top Bar (Global)
- Height: 56px
- Left: HamburgerIcon (24px)
- Center: Logo wordmark (Cormorant Garamond, 20px)
- Right: [DreamVaultIcon, CartIcon (with badge)]
- Background: #FFFFFF
- Border-bottom: 1px #EBEBEB

---

## SCREEN: Onboarding

### Route: `/onboarding`
### Parent: none
### Children: `/onboarding/intent`, `/onboarding/name`, `/onboarding/kyc-intro`

---

### ONBOARDING/SPLASH (3 slides)
Component: `OnboardingSplash`
Layout: Full screen, no nav bar, no status bar overlap
Background: #2C1810 (Deep Mahogany)

Slide content array:
```
slides: [
  { headline: "Preserve Traditions." },
  { headline: "Build Your Gold Reserve." },
  { headline: "Celebrate Life's Important Moments." }
]
```

Per slide:
- Headline: Cormorant Garamond 32px Light, #FAF7F2, centered, vertical center
- Subtext (slide 3 only): DM Sans 13px #8C8C8C, "Est. 1969 · Thrissur, Kerala"
- Auto-advance: 2400ms per slide
- Manual swipe: enabled
- Progress dots: bottom, 8px diameter, active #B8962E inactive #8C8C8C40
- Skip link: top-right, DM Sans 13px #8C8C8C, appears after 800ms

States:
- `default`: auto-play
- `userInteracted`: pause auto-play, show manual dot controls

Actions:
- swipe left/right: advance/back
- tap skip: jump to IntentScreen
- auto-complete all 3: navigate to IntentScreen

---

### ONBOARDING/INTENT
Component: `OnboardingIntent`
Route: `/onboarding/intent`

Layout:
- Background: #FAF7F2
- Top padding: 48px
- Header: "What brings you to Moozhayil?" — Cormorant 24px #1A1612
- Subtext: "We'll personalise your experience." — DM Sans 14px #8C8C8C, mt-8
- Goal cards: vertical stack, gap-12, mt-32
- CTA button: full-width, fixed bottom, 16px margin, above safe area

GoalOptionCard component (×6):
```
Props:
  id: string
  label: string
  sublabel: string
  icon: SVGIcon
  selected: boolean
  onTap: () => void

Variants:
  default: bg #FFFFFF, border 1px #EBEBEB
  selected: bg #EFE3C8, border-left 3px #B8962E

Size: full-width, height 72px, padding 16px
```

Goal options:
```
[
  { id: "wedding",    label: "Wedding Jewellery",    sublabel: "Planning a bridal collection" },
  { id: "investment", label: "Gold Investment",       sublabel: "Accumulating gold over time" },
  { id: "festival",   label: "Festival Purchase",     sublabel: "Onam, Vishu, Diwali" },
  { id: "gift",       label: "Gifting",               sublabel: "Anniversary, birthday, occasion" },
  { id: "family",     label: "Family Gold Reserve",   sublabel: "Building for the family's future" },
  { id: "other",      label: "Something Special",     sublabel: "I'll explore and decide" },
]
```

Selection: multi-select, minimum 1 required
CTA: "Begin My Journey →", disabled until ≥1 selected

States:
- `noneSelected`: CTA disabled, grey
- `oneOrMoreSelected`: CTA enabled, #B8962E

Actions:
- tap GoalOptionCard: toggle selected
- tap CTA: navigate to `/onboarding/name`, pass selectedGoals[]

---

### ONBOARDING/NAME
Component: `OnboardingName`
Route: `/onboarding/name`

Layout:
- Background: #FAF7F2
- Single text field, vertically centered
- Label: "What should we call you?" — Cormorant 24px
- Input: DM Sans 18px, underline style (no box), autofocus
- Placeholder: "Your name"
- CTA: "Continue", fixed bottom

Validation:
- min 2 chars, letters only (regex: /^[a-zA-Z\s]{2,}$/)
- Error: "Please enter a valid name" — DM Sans 12px #DEB8A8, below input

States:
- `empty`: CTA disabled
- `valid`: CTA enabled
- `error`: error message visible

Actions:
- type: validate on change
- tap CTA: store name, navigate to `/onboarding/kyc-intro`

---

### ONBOARDING/KYC-INTRO
Component: `OnboardingKYCIntro`
Route: `/onboarding/kyc-intro`

Layout:
- Icon: shield/verification SVG, 48px, #B8962E, centered
- Headline: "To enable Gold Goals, we need a quick KYC." — Cormorant 22px, center
- Body: "2 minutes. Keeps your gold safe and legally yours." — DM Sans 14px #8C8C8C
- Primary CTA: "Complete KYC Now" — full-width primary button
- Secondary link: "I'll do this later" — ghost, DM Sans 14px, centered, mt-16

States: none (static screen)

Actions:
- tap primary: navigate to `/kyc/aadhaar`
- tap secondary: navigate to `/home`, set `kycStatus: "pending"`

---

## SCREEN: Home

### Route: `/home`
### Parent: TabBar
### Auth: required

---

### SECTION 1 — GreetingCard
Component: `GreetingCard`

Props:
```
name: string
goldBalanceGrams: number
monthlyGrowthRupees: number
hasActiveGoal: boolean
kycStatus: "verified" | "pending" | "none"
```

Layout:
- Full-width card, mx-16, border-radius 12, bg #EFE3C8
- Left edge: 3px solid #B8962E
- Padding: 16px
- Line 1: "Good [morning/afternoon/evening], {name}." — DM Sans 15px #1A1612
- Line 2: contextual line (see states)

States:
```
newUser (no scheme, no goals):
  line2: "Your gold journey starts when you do." — Cormorant italic 15px #8C8C8C

activeGoal (has goals, positive growth):
  line2: "Your reserve grew ₹{monthlyGrowthRupees} this month." — Cormorant italic 15px #B8962E

noGrowth (has goals, flat/no contribution this month):
  line2: "Your gold is waiting for your next contribution." — Cormorant italic 15px #8C8C8C

multipleGoals (>1 active goal):
  line2: "Across {n} goals, your gold is growing." — Cormorant italic 15px #B8962E
```

Actions:
- tap card: navigate to `/my-gold`

---

### SECTION 2 — GoalProgressRing (Primary Goal)
Component: `GoalProgressRingCard`

Props:
```
goals: Goal[]  // array of active goals
```

Layout: Full-width card, mx-16, bg #FFFFFF, radius 12, padding 16, shadow-sm
Left: ProgressRing component (80px diameter)
Right: goal detail stack

ProgressRing component:
```
Props:
  percent: number (0–100)
  grams: number
  goalName: string

Visual:
  Ring stroke-width: 8px
  Track color: #EFE3C8
  Fill color: #B8962E
  Center top: "{grams}g" — Cormorant 20px #1A1612
  Center bottom: "{percent}%" — DM Sans 11px #B8962E
  Animation: 600ms ease-out on mount, count-up on value change
```

Right column:
```
goalName: Cormorant 18px #1A1612
"{percent}% complete" — DM Sans 12px #B8962E
"{monthsRemaining} months to go" — DM Sans 12px #8C8C8C
CTA: "Add to goal →" — DM Sans 12px #B8962E, underline
```

States:
```
noGoals:
  Replace ring with dashed circle placeholder
  Text: "Set your first gold goal →" — Cormorant italic 16px #8C8C8C
  Tap: navigate to /goals/create

singleGoal: standard layout above

multipleGoals:
  Horizontal PageView, one goal per page
  Dot indicator below card: {n} dots, active #B8962E
  Swipe to switch goal

goalComplete (100%):
  Ring filled solid #B8962E
  CTA: "Redeem Your Gold →"
```

Actions:
- tap CTA "Add to goal": navigate to `/goals/{goalId}/contribute`
- tap CTA "Set first goal": navigate to `/goals/create`
- tap CTA "Redeem": navigate to `/my-gold/redeem`
- tap card body: navigate to `/goals/{goalId}`
- swipe: switch between goals (multipleGoals state)

---

### SECTION 3 — AuraInsightBanner
Component: `AuraInsightBanner`

Props:
```
insightText: string      // from Aura API
insightType: "rate" | "goal" | "milestone" | "generic"
linkTo: string           // deep link
```

Layout:
- mx-16, bg #FFFFFF, radius 12, padding 16
- Left: Aura monogram SVG 16px, #B8962E
- Body: insightText — Cormorant italic 15px #1A1612
- Bottom-right: "Via Aura →" — DM Sans 10px #8C8C8C

States:
```
loading:
  Shimmer placeholder, same dimensions

error / noData:
  Hide entirely (do not render)

firstTimeUser:
  Static text: "Aura will offer insights once your journey begins." — Cormorant italic 14px #8C8C8C
```

Actions:
- tap card: navigate to `{linkTo}` (default: `/aura`)

---

### SECTION 4 — HeroBanner
Component: `HeroBanner`

Props:
```
banners: Banner[]  // max 3, from CMS
```

Layout:
- Full-width, height 200px
- Image: cover fill
- Overlay gradient: bottom 50%, rgba(0,0,0,0.4)
- Headline: Cormorant 24px #FFFFFF, bottom-left, p-16
- CTA button: secondary ghost white style, bottom-right, p-16
- Dot indicators: centered bottom, 8px dots

States:
```
loading: Shimmer full-width 200px height
noBanners: Hide entirely
singleBanner: No dots, no auto-scroll
```

Auto-scroll: 4000ms interval, pause on user touch

---

### SECTION 5 — QuickActionsRow
Component: `QuickActionsRow`

Layout: Horizontal row, 4 equal tiles, mx-16, gap-12
Each tile: bg #FFFFFF, radius 12, padding 12, center-aligned icon + label

Items:
```
[
  { icon: ShopIcon,     label: "Browse",     route: "/shop" },
  { icon: GoalIcon,     label: "My Goals",   route: "/goals" },
  { icon: TrackIcon,    label: "Track Order", route: "/orders" },
  { icon: StoreIcon,    label: "Book Visit", route: "/store-locator" },
]
```

Icon: 24px, color #B8962E
Label: DM Sans 11px #1A1612

States: no empty state, always rendered

---

### SECTION 6 — OccasionDiscovery
Component: `OccasionDiscoveryRow`

Props:
```
occasions: Occasion[]   // from CMS/config
activeOccasion: string | null
```

Layout:
- Section header: "Shop by Occasion" — Cormorant 20px #1A1612, mx-16
- Horizontal ScrollView, no snap
- Chips: height 40px, horizontal padding 16px, gap-8

OccasionChip:
```
Props:
  id: string
  label: string
  bgImage: string (URL)
  selected: boolean

default: bg #FFFFFF, border 1px #EBEBEB, DM Sans 14px #1A1612
selected: bg #EFE3C8, border 1px #B8962E, DM Sans 14px #B8962E
```

Occasions list:
```
["Wedding", "Engagement", "Anniversary", "Onam", "Vishu", "Birthday", "Baby Shower", "Just Because"]
```

States:
```
loading: 4 shimmer chips
```

Actions:
- tap chip: navigate to `/shop/occasion/{occasionId}`

---

### SECTION 7 — DreamVaultPreview
Component: `DreamVaultPreviewRow`

Props:
```
vaultItems: DreamVaultItem[]   // max 5
goldBalanceGrams: number
```

Layout:
- Section header: "Your Dream Vault" — Cormorant 20px #1A1612, mx-16
- "See all →" link: right-aligned, DM Sans 12px #B8962E
- Horizontal ScrollView, items: 120px wide, gap-12

DreamVaultPreviewCard:
```
Props:
  productImage: string
  productName: string
  goalPercent: number (0–100)
  currentGrams: number
  requiredGrams: number

Layout:
  top: product image, 120×80, radius 8, cover
  bottom: productName, Cormorant 12px, 1 line truncate
  bottom: mini ProgressRing 28px, inline left
  bottom: "{currentGrams}g of {requiredGrams}g" — DM Sans 10px #8C8C8C
```

States:
```
empty (no vault items):
  Section hidden entirely (do not render)

loading:
  3 shimmer cards
```

Actions:
- tap card: navigate to `/shop/product/{productId}` with vaultContext=true
- tap "See all": navigate to `/dream-vault`

---

### SECTION 8 — CanRedeemToday
Component: `CanRedeemTodayRow`

Props:
```
redeemableProducts: Product[]   // filtered server-side: price ≤ goldBalanceValue
goldBalanceRupees: number
```

Layout:
- Card container: mx-16, bg #EFE3C8, radius 12, padding 16
- Header inside card: "Ready to Redeem" — Cormorant 20px #1A1612
- Subtext: "Pieces within your current balance." — DM Sans 13px #8C8C8C
- Horizontal product scroll inside card

States:
```
noBalance (goldBalanceRupees === 0):
  Hide entirely

balanceTooLow (no products match):
  Show: "Keep saving — your first redeemable piece is {X}g away." — DM Sans 13px
  Show mini progress toward cheapest product

hasRedeemable (≥1 product):
  Standard layout

loading:
  Shimmer inside card
```

Actions:
- tap product: navigate to `/shop/product/{productId}` with redeemContext=true

---

### SECTION 9 — FeaturedCollections
Component: `FeaturedCollectionsRow`

Props:
```
collections: Collection[]
```

Layout:
- Section header: "Collections" — Cormorant 20px
- Horizontal scroll
- Each card: 160px wide, height 200px

CollectionCard:
```
top 70%: image, cover, radius 12 top
bottom 30%: bg #FFFFFF, radius 12 bottom
  name: Cormorant 15px #1A1612
  meta: "{n} pieces · From ₹{price}" — DM Sans 11px #8C8C8C
```

States:
```
loading: 3 shimmer cards
empty: hide section
```

Actions:
- tap: navigate to `/shop/collection/{collectionId}`

---

### SECTION 10 — TrustAnchors
Component: `TrustAnchorsRow`

Layout:
- Horizontal row, 4 equal tiles, mx-16, no scroll
- Each: icon 20px #8C8C8C, label DM Sans 10px #8C8C8C, center-aligned

Items (static):
```
[
  { icon: CalendarIcon, label: "Since 1969" },
  { icon: BadgeIcon,    label: "BIS Hallmarked" },
  { icon: StoreIcon,    label: "Physical Showroom" },
  { icon: MapPinIcon,   label: "Kerala's Own" },
]
```

States: always render, no loading state

---

### HOME SCREEN SCROLL ORDER
```
1. GreetingCard
2. GoalProgressRingCard
3. AuraInsightBanner
4. HeroBanner
5. QuickActionsRow
6. OccasionDiscovery
7. DreamVaultPreview       // hidden if empty
8. CanRedeemToday          // hidden if no balance
9. FeaturedCollections
10. TrustAnchors
11. Bottom padding (80px for tab bar)
```

---

## SCREEN: Shop / Product Listing

### Route: `/shop`
### Route: `/shop/category/{categoryId}`
### Route: `/shop/occasion/{occasionId}`
### Route: `/shop/collection/{collectionId}`

---

### TOP AREA — SearchBar
Component: `SearchBar`

Props:
```
placeholder: string  // "Search bangles, chains, bridal sets…"
onTap: () => void    // navigates to /shop/search, does not search inline
```

Layout: Full-width, height 48px, mx-16, radius 24, bg #F5F5F5
Left icon: SearchIcon 18px #8C8C8C
Right icon: MicIcon 18px #8C8C8C

Behavior: Tapping anywhere on bar navigates to SearchScreen (not inline search)

---

### FILTER BAR
Component: `FilterBar`

Props:
```
filters: Filter[]
activeFilters: string[]
sortOption: SortOption
onFilterChange: (id) => void
onSortChange: (option) => void
```

Layout:
- Horizontal ScrollView, height 44px, px-16, gap-8
- Ends with SortButton (icon only, right side of scroll)

FilterChip:
```
default: bg #FFFFFF, border 1px #EBEBEB, DM Sans 13px #1A1612, radius 20, px-14 py-8
active:  bg #B8962E, border 0, DM Sans 13px #FFFFFF
```

Filter options (dynamic from API + static):
```
Static: ["All", "New Arrivals", "Under ₹25K", "Under ₹50K", "Bridal"]
Dynamic: from category/occasion context
```

SortButton: icon 20px, opens SortBottomSheet on tap

SortBottomSheet options:
```
["Newest", "Price: Low to High", "Price: High to Low", "Most Loved", "By Weight"]
```

Sticky behavior: FilterBar becomes sticky when scrolled past, with white background + shadow-sm

---

### PRODUCT GRID
Component: `ProductGrid`

Layout:
- 2-column grid, mx-16, gap-12
- Infinite scroll (no pagination)
- Scheme interstitial every 3rd row (6 products)

ProductCard:
```
Props:
  productId: string
  name: string
  images: string[]
  purity: string
  weightGrams: number
  priceRupees: number
  isWishlisted: boolean
  schemeMonthlyAmount: number   // computed: price / 36

Dimensions: width = (screenWidth - 48) / 2, image aspect 3:4

Layout:
  Image area (60% height): cover, radius 12 top
    WishlistHeart: top-right 8px, 20px
  Content area (40%):
    productName: Cormorant 14px #1A1612, 2 lines max, ellipsis
    meta: "{purity} · {weight}g" — DM Sans 11px #8C8C8C
    price: DM Sans 16px #1A1612
    schemeNudge: "Or ₹{schemeMonthlyAmount}/mo" — DM Sans 11px #8C8C8C (only if price > 25000)
```

WishlistHeart:
```
States:
  default: outline heart, #8C8C8C
  wishlisted: filled heart, #B8962E, scale 1.2 animation 150ms then settle
  loading: disabled during API call
```

SchemeInterstitialCard (inline, spans full width):
```
bg #EFE3C8, radius 12, padding 16, mx-0
text: "Saving for something like this? A Gold Goal gets you there." — DM Sans 14px
CTA: "See How Goals Work →" — DM Sans 13px #B8962E
onTap: navigate to /goals
```

States:
```
loading (initial):
  6 shimmer ProductCards

loadingMore (pagination):
  2 shimmer cards at bottom

empty (no results):
  Icon + "No pieces match your filters."
  CTA: "Clear Filters" or "Ask Aura"

error:
  "Couldn't load products. Tap to retry."
  Retry button

firstTimeVisit:
  Standard — no special state
```

---

## SCREEN: Search

### Route: `/shop/search`

Layout: Full-screen overlay, bg #FFFFFF

SearchInput:
```
Active, autofocused on mount
Height 56px, full-width
Left: BackArrow 20px
Right: MicIcon 20px
Underline style (no box)
Placeholder: "Search jewellery, occasions, collections…"
```

Below input:

State: `emptyQuery`
```
Section: "Recent" — DM Sans 13px #8C8C8C header
  Horizontal chips, closeable (×)

Section: "Trending"
  Static chips: ["Bridal Necklace", "Kerala Kasavu", "Gold Chain", "Onam Collection"]
```

State: `activeQuery` (query.length >= 2)
```
Live results list:
  Group 1: "Categories" — matching categories, icon + name
  Group 2: "Collections" — matching collections, thumbnail + name + count
  Group 3: "Products" — matching products, thumbnail + name + price

Loading: per-group shimmer rows
```

State: `noResults`
```
Text: "No results for '{query}'"
Subtext: "Try searching for an occasion or let Aura help."
CTA: "Ask Aura →" — navigates to /aura with prefilled query
```

---

## SCREEN: Product Detail Page

### Route: `/shop/product/{productId}`
### Query params: `?vaultContext=true`, `?redeemContext=true`

---

### IMAGE GALLERY
Component: `ProductImageGallery`

Props:
```
images: ProductImage[]  // type: "white-bg" | "on-model" | "detail" | "lifestyle"
productName: string
hasAR: boolean
```

Layout:
- Full-width, aspect ratio 1:1
- PageView (swipe between images)
- Dot indicators: centered below, 6px

Overlay elements:
- Back arrow: top-left, 40px tap target, bg rgba(255,255,255,0.8) circle
- WishlistHeart: top-right, same bg
- Share icon: top-right adjacent to heart

AR Try-On button:
```
Position: bottom-right of image area, 12px margin
Label: "Try On" — DM Sans 12px
Icon: ARIcon 16px
Bg: rgba(255,255,255,0.9), radius 20, px-12 py-6
Visible only if hasAR === true
```

States:
```
loading: Shimmer 1:1 square
singleImage: no dots, no swipe
```

---

### PRODUCT HEADER
Component: `ProductHeader`

```
breadcrumb: "{Category} → {Subcategory}" — DM Sans 11px #8C8C8C
name: Cormorant 24px #1A1612
```

---

### PRICE BLOCK
Component: `ProductPriceBlock`

Props:
```
priceRupees: number
goldRatePerGram: number
rateUpdatedAt: Date
priceBreakdown: { making: number, wastage: number }
```

Layout:
```
price: DM Sans 22px #1A1612
rateInfo: "Today's rate: ₹{goldRatePerGram}/g · Updated {time}" — DM Sans 11px #8C8C8C
"Price breakdown →" link: DM Sans 12px #B8962E, expands inline accordion
```

Accordion content (price breakdown):
```
Gold value:    ₹{x}
Making charge: ₹{x} ({y}%)
GST:           ₹{x}
─────────────────
Total:         ₹{price}
```

---

### SPECS ROW
Component: `ProductSpecsRow`

Layout: 4-tile horizontal row, equal width, no scroll

Tiles:
```
[
  { label: "Purity",      value: "{karat} ({hallmark})" },
  { label: "Weight",      value: "{weight}g" },
  { label: "Making",      value: "{makingPct}%" },
  { label: "Certificate", value: "BIS Hallmark" },
]
```

Each tile: bg #FAF7F2, radius 8, padding 12, center-aligned
Label: DM Sans 10px #8C8C8C uppercase
Value: DM Sans 14px SemiBold #1A1612

---

### AFFORDABILITY BRIDGE
Component: `AffordabilityBridge`

Props:
```
productPriceRupees: number
productPriceGrams: number
userGoldBalanceGrams: number
userGoldBalanceRupees: number
hasActiveScheme: boolean
schemeMonthlyOptions: number[]   // [1000, 2000, 3000, 5000]
```

Layout: mx-16, bg #EFE3C8, radius 12, border-left 3px #B8962E, padding 16

State: `hasBalance` (userGoldBalanceRupees > 0)
```
Row 1: "Your balance: {userGoldBalanceGrams}g (₹{userGoldBalanceRupees})"
Row 2: MiniProgressRing (36px) + "{percent}% of this piece"
Row 3: "You need {remainingGrams}g more"
CTA: "Add to My Goal" — primary button
```

State: `noBalance, hasScheme`
```
Text: "Your {schemeName} is building toward this."
CTA: "View My Goal →"
```

State: `noBalance, noScheme`
```
Text: "₹{productPrice} — or ₹{monthlyAmount}/month for {months} months."
Note: "Starts with as little as ₹1,000/month."
CTA: "Start This Goal" — primary button
Secondary: "Learn about Goals →" — ghost
```

State: `canAffordNow` (userGoldBalanceRupees >= productPriceRupees)
```
bg: #BDC4B020 (sage tint)
badge: "You can buy this today" — Sage Whisper bg, DM Sans 11px
CTA: "Buy With My Gold" — primary
```

---

### PRIMARY ACTIONS
Component: `ProductActions`

Layout: Fixed bottom bar (above tab bar), bg #FFFFFF, shadow-top, padding 16, height 80px

```
Left button (secondary):  "Save to Dream Vault" — full-width 48%
Right button (primary):   "Buy Now" — full-width 48%
```

"Add to Cart" is accessible via the Cart icon in top bar. The product page prioritises intent (vault save or immediate buy).

State: `outOfStock`
```
Primary button: "Out of Stock" — disabled, bg #EBEBEB
Secondary: "Notify Me" — replaces Dream Vault button
```

State: `addingToVault`
```
Dream Vault button: loading spinner, disabled
```

State: `inVault`
```
Dream Vault button: "In Dream Vault ✓" — bg #EFE3C8
```

---

## SCREEN: Dream Vault

### Route: `/dream-vault`
### Auth: required

---

### HEADER
- bg #1E1A2E (Vault Dusk)
- Title: "Your Dream Vault" — Cormorant 28px #FAF7F2
- Subtext: "{n} dreams · {goldBalance}g available" — DM Sans 13px #C4B8D4

---

### VAULT ITEM CARD
Component: `DreamVaultCard`

Props:
```
productId: string
productName: string
productImage: string
productCategory: string
priceRupees: number
requiredGrams: number
currentGrams: number
percent: number
canAffordNow: boolean
goalAttached: boolean
goalId: string | null
```

Layout:
- bg #FFFFFF, radius 12, overflow hidden, mx-16, mb-12

Image row:
- Full-width image, height 180px, cover

Content row (padding 16):
- Left column:
  - productName: Cormorant 16px #1A1612
  - category: DM Sans 11px #8C8C8C
  - price: DM Sans 16px #1A1612
- Right column:
  - ProgressRing (48px)
  - "{currentGrams}g of {requiredGrams}g" — DM Sans 10px #8C8C8C

Action row:
```
State canAffordNow === true:
  Full-width primary button: "Buy With My Gold"
  bg: #B8962E

State canAffordNow === false, goalAttached === false:
  Full-width secondary button: "Start Accumulating →"

State goalAttached === true:
  Full-width ghost button: "View Goal →"

State canAffordNow === false, goalAttached === false:
  Below button: "₹{monthlyAmount}/month for {months} months" — DM Sans 12px #8C8C8C
```

Remove button: top-right of card, × icon 20px, tap shows ConfirmationBottomSheet

---

### States (full screen)

```
loading:
  3 shimmer DreamVaultCards

empty:
  bg #1E1A2E full screen
  Icon (vault outline) 48px #C4B8D4
  Text: "Your vault is empty." — Cormorant italic 20px #FAF7F2
  CTA: "Browse Collections" — ghost white
  CTA: "Ask Aura" — ghost white

error:
  Standard error + retry
```

---

## SCREEN: Goals (Goal Studio)

### Route: `/goals`
### Auth: required

---

### SECTION: Active Goals
Header: "Your Gold Goals" — Cormorant 28px

GoalCard (×n):
```
Props:
  goalId: string
  goalName: string
  productImage: string | null
  productName: string | null
  targetGrams: number
  currentGrams: number
  targetDateFormatted: string
  monthlyAmountRupees: number
  status: "on_track" | "contribution_due" | "completed" | "paused"

Layout: mx-16, bg #FFFFFF, radius 12, padding 16, shadow-sm, mb-12

Image strip (if product attached): full-width 120px height cover image, top of card
Content: ProgressRing (80px) left + detail stack right
  goalName: Cormorant 18px
  "{currentGrams}g of {targetGrams}g" — DM Sans 13px
  "{percent}% · {timeRemaining}" — DM Sans 12px #8C8C8C

StatusBadge:
  on_track: "On Track" — bg #BDC4B020 text #BDC4B0
  contribution_due: "Contribution Due" — bg #EFE3C820 text #B8962E
  completed: "Goal Achieved ✓" — bg #BDC4B040 text #1A1612
  paused: "Paused" — bg #EBEBEB text #8C8C8C

CTA: "Manage Goal →" — DM Sans 13px #B8962E, right-aligned
```

### Create New Goal Button
Full-width, primary, mx-16, mt-8: "+ Start a New Goal"
navigates to `/goals/create`

### Completed Goals Section
Collapsible section, initially collapsed
Header: "Completed Goals ({n})" — DM Sans 14px #8C8C8C

CompletedGoalCard (compact):
```
Row layout: product thumbnail 48px + goalName + date achieved + "Achieved ✓" badge
```

States:
```
loading: 2 shimmer GoalCards

noGoals:
  Centered illustration
  Text: "No active goals yet."
  CTA: "+ Start a New Goal" — primary full-width
  SubCTA: "Ask Aura to help me plan →"
```

---

## SCREEN: Goal Creation Flow

### Route: `/goals/create`
### Multi-step: 5 steps, back navigation allowed

Progress indicator: 5-dot row, top center, active dot #B8962E

---

### Step 1: Name Your Moment
Route: `/goals/create/moment`

Content:
```
Header: "What are you saving for?" — Cormorant 24px
GoalTypeCard (×6): same component as OnboardingIntent
```

Pre-populated state (from product page or Dream Vault):
```
If productId in route params:
  Show product thumbnail + name at top
  Subtext: "You're creating a goal for this piece."
  GoalTypeCards still shown for categorization
```

Validation: 1 selection required

---

### Step 2: Choose Dream Piece (Optional)
Route: `/goals/create/piece`

Header: "Is there a specific piece in mind?" — Cormorant 24px

Options:
```
Card 1: "Browse the collection →" — navigates to /shop with goalCreateContext=true
         On product tap: return to this step with product attached

Card 2: "I'll decide later" — skip to Step 3

Pre-populated (product already attached):
  Show ProductSummaryCard
  Button: "Change piece" — ghost
  Button: "Continue with this piece →" — primary
```

ProductSummaryCard:
```
Image (80px sq) + name + price + "attached" badge
```

---

### Step 3: Set Monthly Contribution
Route: `/goals/create/amount`

Header: "How much will you save each month?" — Cormorant 24px

Slider:
```
Min: 1000, Max: 50000, step: 500
Display: "₹{amount} / month" — Cormorant 28px #B8962E, center above slider

Below slider, live update (debounced 300ms):
  "{estimatedGrams}g over {duration} months" — DM Sans 14px #1A1612
  OR if product attached:
  "You'll reach your goal in {months} months" — DM Sans 14px #1A1612
  "Estimated completion: {monthName} {year}" — DM Sans 13px #8C8C8C
```

Quick-select pills below slider:
```
["₹1,000", "₹2,500", "₹5,000", "₹10,000"]
Tap to set slider to that value
```

---

### Step 4: Payment Setup
Route: `/goals/create/payment`

Header: "Set up your monthly payment" — Cormorant 24px

Payment options (radio):
```
UPI Autopay (default, recommended badge)
  Sub: UPI ID field
Debit Card
  Sub: Card details
Net Banking
```

Trust note: "Your contribution is credited as gold within 24 hours." — DM Sans 12px #8C8C8C

CTA: "Start My Goal" — primary

---

### Step 5: Confirmation
Route: `/goals/create/confirmation`

Full-screen layout:
```
Background: #1E1A2E (Vault Dusk)

Product image (if attached): full-width, height 280px, fade-in 400ms
OR illustration: gold ring/bangle illustration, fade-in

Headline: "Your goal has begun." — Cormorant 28px #FAF7F2, center

Details card (bg rgba(255,255,255,0.1), radius 12, padding 16):
  Goal name
  Monthly: ₹{amount}
  Next contribution: {date}
  Estimated completion: {date}

ProgressRing: center, 80px, starts at 0%, animates to first-contribution percent
  if first payment processed immediately

CTA: "See My Goal →" — primary gold button

Secondary: "Browse the Collection" — ghost white
```

---

## SCREEN: My Gold

### Route: `/my-gold`
### Auth: required, KYC preferred

---

### Hero Section
Component: `MyGoldHero`

Layout: Full-width, bg #2C1810, padding 32px

```
label: "Your Gold Reserve" — DM Sans 11px #EFE3C8 uppercase, tracking-wider
balance: "{totalGrams}g" — Cormorant 52px #FAF7F2, center
valueRow: "₹{totalValue} at today's rate" — DM Sans 16px #EFE3C8
sparkline: 90-day accumulation line, Antique Gold, 40px height
```

States:
```
noBalance:
  balance: "0g"
  valueRow: "Start a goal to begin accumulating"
  sparkline: hidden

loading:
  Shimmer same dimensions
```

---

### Gold Rate Row
Component: `GoldRateContextRow`

```
Layout: mx-16, bg #FFFFFF, radius 8, padding 12, row
Left: "22K today: ₹{rate}/g" — DM Sans 13px #1A1612
Right: "{direction} {pct}% vs last month" — DM Sans 12px, color: green if up, #DEB8A8 if down
Tap: navigate to /aura/gold-insights
```

---

### All Goal Rings Row
Component: `AllGoalRingsRow`

Horizontal ScrollView of ProgressRing (80px) per active goal
Under each ring: goal name, DM Sans 11px, truncate 1 line
Tap: navigate to `/goals/{goalId}`

Add goal button (last in row):
```
Dashed circle 80px + "+" center — DM Sans 20px #B8962E
Tap: navigate to /goals/create
```

---

### Can Redeem Today Section
(Same component as home screen, but full width here, not inside a card container)

---

### Contribution Ledger
Component: `GoldLedger`

Section header: "Your Gold Ledger" — Cormorant 20px

LedgerRow (per contribution):
```
Left: date (DM Sans 12px #8C8C8C) + month name (Cormorant 16px #1A1612)
Center: "₹{amount} contributed" — DM Sans 13px
Right column:
  "{grams}g credited" — DM Sans 13px #B8962E
  "Running: {totalGrams}g" — DM Sans 11px #8C8C8C
```

Row alternating bg: #FFFFFF / #FAF7F2
Separator: none (bg change is enough)

States:
```
empty: "No contributions yet." — DM Sans 13px #8C8C8C center
loading: 4 shimmer rows
```

---

### Milestone Timeline
Component: `MilestoneTimeline`

Horizontal dot-and-line timeline, scrollable
Milestone markers: 10g, 25g, 50g, 100g
Each milestone: larger dot #B8962E, label above/below
Completed milestones: filled gold dot
Upcoming: empty circle, #EBEBEB border
Current position: pulsing gold dot

---

## SCREEN: Aura

### Route: `/aura`
### Auth: required

---

### Landing Layout
Background: #FAF7F2

AuraMonogram: SVG symbol, 32px, #B8962E, center, pt-48

"Aura" label: Cormorant 22px #1A1612, center, mt-8

AuraContextCard:
```
bg #FFFFFF, radius 16, mx-16, padding 20, shadow-sm
Content: Aura's ambient insight — Cormorant italic 18px #1A1612
  Generated from: user's active goals + today's gold rate + last app activity

States:
  hasGoals: personalised insight with goal reference
  noGoals: "Tell me what moment you're preparing for."
  loading: shimmer text lines
```

ActionCards (×3):
```
bg #FFFFFF, radius 12, mx-16, padding 16, mb-8
Cormorant 17px #1A1612

["Show me pieces within my goal budget",
 "Help me plan my jewellery",
 "What does today's gold rate mean for me?"]

Right: ChevronRight 16px #8C8C8C
```

RecentActivity row (if exists):
```
"Last time: {summary of last interaction}" — DM Sans 13px #8C8C8C
CTA: "Continue →" — DM Sans 13px #B8962E
```

ChatInput:
```
Position: below action cards
Placeholder: "Or ask Aura anything…"
Height: 48px, bg #F5F5F5, radius 24, px-16
MicIcon right
```

States:
```
firstTimeUser:
  No recentActivity row
  ActionCards shuffled to show most relevant based on onboarding intent

returningUser:
  RecentActivity visible

noGoals:
  ActionCards: ["Help me set a goal", "Show me collections", "What is a Gold Goal?"]
```

---

### Aura Conversation View
Route: `/aura/conversation/{sessionId}`
Route: `/aura/goal-planning`
Route: `/aura/product-discovery`
Route: `/aura/gold-insights`

Layout:
- ConversationCard flow (not a chat thread)
- Cards slide up from bottom as conversation progresses
- Back navigation: return to Aura landing

AuraConversationCard:
```
bg #FFFFFF, radius 16, mx-16, mb-12
Aura message: Cormorant italic 16px #1A1612, padding 20
Options: vertical stack of OptionButton components
OR: InputWidget (slider, date picker, etc.)
```

OptionButton:
```
Full-width, height 48px, bg #FAF7F2, radius 8, DM Sans 15px #1A1612
Left-aligned text, right chevron
Selected: bg #EFE3C8, border-left 2px #B8962E
```

Product recommendation cards (inline in conversation):
```
Standard ProductCard component, within conversation scroll
```

---

## SCREEN: Profile

### Route: `/profile`
### Auth: required

---

### Header Section
```
bg #FAF7F2, padding 24

Avatar: initials in circle, 56px, bg #EFE3C8, Cormorant 22px #B8962E
Name: Cormorant 24px #1A1612
"Member since {year}" — DM Sans 13px #8C8C8C

Badges row:
  KYC badge: "Verified Member" bg #BDC4B020 text #BDC4B0 (if verified)
             "Complete KYC" bg #EFE3C8 text #B8962E (if pending)
  Goals badge: "{n} Active Goals" bg #EFE3C8 text #B8962E (if > 0)
```

---

### List Sections
Component: `ProfileListSection`

Sections and rows:
```
Section: Account
  [My Purchases, My Wishlist → Dream Vault, My Goals, My Gold]

Section: Profile
  [My Profile & KYC, Saved Addresses, Payment Methods]

Section: App
  [Notifications (with toggle), Invite & Earn, Help & Support, Store Locator]

Section: About
  [Our Story — Est. 1969, Terms & Privacy, App version (tappable for debug)]
```

ListRow:
```
Height: 56px, padding 16
Left: Icon 20px #8C8C8C
Label: DM Sans 15px #1A1612
Right: ChevronRight 16px #EBEBEB
  OR: Toggle (for Notifications)
  OR: Badge count (for My Purchases if active orders)
Separator: 1px #EBEBEB, inset left 52px
```

Sign Out:
```
Full-width ghost, DM Sans 15px #DEB8A8 (not alarming red)
Confirmation bottom sheet before executing
```

---

## SCREEN: Orders

### Route: `/orders`

OrderCard:
```
Props:
  orderId: string
  productName: string
  productImage: string
  orderDate: string
  status: "processing" | "confirmed" | "shipped" | "delivered" | "cancelled"
  amountRupees: number
  paymentMethod: "cash" | "scheme" | "card" | "upi"

StatusBadge colors:
  processing: #EFE3C8 / #B8962E
  confirmed:  #EFE3C8 / #B8962E
  shipped:    #BDC4B020 / #8C8C8C
  delivered:  #BDC4B040 / #1A1612
  cancelled:  #EBEBEB / #8C8C8C
```

States:
```
empty: "No purchases yet. Start exploring. →" CTA to /shop
```

---

## GLOBAL STATES

### App-wide Loading
Skeleton shimmer style: bg gradient animation #F5F5F5 → #EBEBEB → #F5F5F5, 1200ms loop

### App-wide Error
```
ErrorState component:
  Icon: 32px
  Headline: DM Sans 16px #1A1612
  Body: DM Sans 14px #8C8C8C
  CTA: "Try Again" — primary button
```

### Network Offline Banner
```
Top of screen, below top bar
bg #DEB8A8, text: "You're offline. Some features may not load." — DM Sans 13px #1A1612
Height: 36px, dismissible
```

### Auth Guard
Any route requiring auth:
- If not logged in: redirect to `/onboarding`
- Store intended route, redirect back after login

### Deep Link Handling
```
/product/{id}     → ProductDetail
/goals/create     → GoalCreateFlow Step 1
/vault            → DreamVault
/aura             → Aura landing
/collection/{id}  → CollectionPage
```

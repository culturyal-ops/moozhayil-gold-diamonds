# 04 — User Flows
## Moozhayil Gold & Diamonds — All Flows Defined

---

## FLOW NAMING CONVENTION

Each flow has:
- ID: FLOW-XXX
- Entry Point: where the flow begins
- Steps: numbered, with screen/component
- Decision Points: branching logic (marked DP-n)
- Success State: what "done" looks like
- Failure State: what can go wrong + recovery

---

## USER TYPE DEFINITIONS

| Type | Definition |
|---|---|
| Guest | Not logged in |
| Registered | Logged in, no KYC, no scheme |
| KYC User | Logged in + KYC verified |
| Goal User | KYC verified + at least 1 active goal/scheme |
| Shop User | Has browsed/purchased, no active goal |
| Hybrid User | Active goal + has purchased jewellery |

---

## FLOW-001: Guest → Registered User (Onboarding)

**Entry Point:** App first launch

```
Step 1: SplashScreen (auto-advance 3 slides, 2400ms each)
  DP-1: User taps Skip
    → Jump to Step 4
  DP-2: User completes all 3 slides
    → Advance to Step 4

Step 4: IntentScreen (/onboarding/intent)
  User selects 1+ goal types
  DP-3: User selects 0 and taps CTA
    → CTA remains disabled, no action
  DP-4: User selects ≥1 and taps "Begin My Journey"
    → Advance to Step 5
    → Store selectedGoals[] in session

Step 5: NameScreen (/onboarding/name)
  User enters first name
  DP-5: Name < 2 chars or invalid chars
    → Show inline error, block advance
  DP-6: Valid name entered, taps Continue
    → Advance to Step 6
    → Store name in session

Step 6: KYCIntroScreen (/onboarding/kyc-intro)
  DP-7: User taps "Complete KYC Now"
    → Navigate to /kyc/aadhaar (FLOW-003)
    → On KYC completion: navigate to /home
  DP-8: User taps "I'll do this later"
    → Set kycStatus: "pending"
    → Navigate to /home

Step 7: HomeScreen (/home)
  → Create user record in DB
  → Store selectedGoals as userIntents[]
  → Apply intent-based personalisation
```

**Success State:** User is on HomeScreen, name shown in GreetingCard, intent stored.

**Failure States:**
- Network error on account creation: retry toast, keep user on KYCIntro
- KYC service unavailable: show error, offer "Try later" → /home with kycStatus: "pending"

---

## FLOW-002: Phone Number Auth

**Entry Point:** Any auth-guarded route when not logged in

```
Step 1: AuthScreen (/auth)
  Phone number input (10 digits, India +91)
  DP-1: Invalid number format
    → Inline error "Enter a valid 10-digit number"
  DP-2: Valid number, tap "Send OTP"
    → API: POST /auth/send-otp
    → Show OTPScreen

Step 2: OTPScreen (/auth/otp)
  6-digit OTP input (auto-submit on 6th digit)
  Resend timer: 30 seconds countdown
  DP-3: OTP incorrect
    → Inline error "Incorrect OTP", clear fields
    → Allow 3 attempts
  DP-4: 3 failed attempts
    → Block for 10 minutes, show timer
  DP-5: Correct OTP
    → API: POST /auth/verify-otp
    → DP-6
  DP-6: Existing user?
    → Yes: restore session, navigate to /home or intended route
    → No: navigate to /onboarding/intent (FLOW-001 Step 4)

Resend flow:
  After 30s: "Resend OTP" link appears
  Tap: POST /auth/send-otp again, reset 30s timer, allow 2 resends max
  After 2 resends: "Call me instead" option
```

**Success State:** User authenticated, session token stored securely.

**Failure States:**
- OTP service down: "Unable to send OTP. Please try again." + retry
- Network timeout: retry toast
- Max attempts: lockout screen with countdown

---

## FLOW-003: KYC Verification

**Entry Point:** 
- Onboarding KYCIntro screen
- Profile → My Profile & KYC
- Any goal enrollment (KYC gate)

```
Step 1: KYCLanding (/kyc)
  Shows: what's needed (Aadhaar, PAN)
  CTA: "Start KYC"

Step 2: AadhaarEntry (/kyc/aadhaar)
  Input: 12-digit Aadhaar number
  DP-1: Invalid format → inline error
  DP-2: Valid → "Send OTP to linked mobile"
  API: POST /kyc/aadhaar/send-otp

Step 3: AadhaarOTP (/kyc/aadhaar/otp)
  Same OTP flow as FLOW-002 Step 2
  DP-3: Verified → proceed to Step 4
  DP-4: Failed → retry or skip to PAN only

Step 4: PANEntry (/kyc/pan)
  Input: PAN number
  DP-5: Invalid format → inline error
  DP-6: Valid → API: POST /kyc/pan/verify

Step 5: SelfieCapture (/kyc/selfie)
  Camera opens, face detection
  DP-7: Face not detected → retry prompt
  DP-8: Captured → API: POST /kyc/selfie

Step 6: KYCReview (/kyc/review)
  Summary of submitted info
  CTA: "Submit for Verification"
  API: POST /kyc/submit

Step 7: KYCPending (/kyc/pending)
  "Verification in progress. Usually done in 30 minutes."
  Push notification on completion

Step 8: KYCComplete
  Status: kycStatus → "verified"
  Navigate to: intended route (goal enrollment or profile)
```

**Success State:** kycStatus = "verified", user can enroll in goals.

**Failure States:**
- Aadhaar OTP fails 3 times: skip Aadhaar, proceed with PAN only
- PAN invalid: "PAN not found. Check and retry."
- Selfie fails: "Try in better lighting" + retry
- KYC rejected: show reason, allow resubmission after 24h

---

## FLOW-004: Product Browse → Dream Vault Save

**Entry Point:** Any product card (grid, search, collection, Aura suggestion)

```
Step 1: ProductCard visible in any list
  User taps card
  → Navigate to /shop/product/{productId}

Step 2: ProductDetailScreen
  User views images, specs, price
  DP-1: User taps "Save to Dream Vault"
    → Proceed to DP-2
  DP-2: User logged in?
    → No: navigate to /auth, return to product after auth
    → Yes: proceed to Step 3

Step 3: API: POST /vault/items { productId }
  Optimistic UI: button changes to "In Dream Vault ✓"
  DP-3: API success
    → Button state: inVault
    → GoalStartBottomSheet slides up (FLOW-006)
  DP-4: API error
    → Revert button to default
    → Toast: "Couldn't save. Try again."

Step 4: GoalStartBottomSheet visible
  DP-5: User taps "Create This Goal"
    → Navigate to /goals/create with productId param
    → FLOW-008 Goal Creation
  DP-6: User dismisses sheet
    → Product remains in vault
    → No goal created
    → User stays on product page
```

**Success State:** Product in vault. Optional: goal creation started.

**Failure States:**
- Already in vault: API returns 409, button shows "In Dream Vault ✓", no sheet
- Vault full (if limit imposed): show message, link to manage vault
- Network error: optimistic revert, error toast

---

## FLOW-005: Product Browse → Direct Purchase

**Entry Point:** ProductDetailScreen

```
Step 1: ProductDetailScreen
  User taps "Buy Now"
  DP-1: User logged in?
    → No: /auth then return
    → Yes: DP-2
  DP-2: KYC status?
    → none: KYC gate (FLOW-003), then return
    → pending: "KYC is being verified. You can proceed and complete later."
    → verified: proceed to Step 2

Step 2: CheckoutScreen (/checkout)
  Order summary: product, price, delivery
  Address selection (or add new)
  Payment method selection

Step 3: Payment
  DP-3: Payment method
    → UPI: UPI deeplink/SDK
    → Card: payment gateway
    → Gold balance (if sufficient): FLOW-010 Redemption

Step 4: OrderConfirmation (/orders/confirmation/{orderId})
  Order ID, expected delivery, summary
  CTA: "Continue Browsing"
  Secondary: "Track My Order"
  
  Post-purchase prompt (shown 2s after confirmation):
    "What's next for you, {name}?"
    CTA: "Start a new goal →"
```

**Success State:** Order created, payment confirmed, user on confirmation screen.

**Failure States:**
- Payment declined: "Payment failed. Try another method." + retry
- Item out of stock at checkout: "This item just sold out." + similar products
- Address incomplete: form validation, inline errors
- Network timeout: idempotency key ensures no double charge, retry safe

---

## FLOW-006: AffordabilityBridge → Goal Creation (from Product Page)

**Entry Point:** AffordabilityBridge CTA on ProductDetailScreen

```
Step 1: User on ProductDetailScreen, sees AffordabilityBridge
  State: noBalance + noScheme
  User taps "Start This Goal"

Step 2: GoalCreateFlow (/goals/create)
  Pre-populated: productId, productName, productPrice

Step 3: MomentScreen (Step 1 of goal creation)
  goalType auto-suggested based on product category:
    bridal products → "Wedding Jewellery"
    chains/coins → "Gold Investment"
    etc.
  User can change type

Step 4–7: Standard goal creation flow (FLOW-008 Steps 3–7)

Success: Goal created with product attached.
Product page AffordabilityBridge updates to "hasScheme" state.
```

---

## FLOW-007: Dream Vault → Redeem

**Entry Point:** DreamVaultCard with canAffordNow = true

```
Step 1: DreamVaultScreen
  DreamVaultCard shows "Buy With My Gold" button
  User taps

Step 2: RedemptionScreen (/my-gold/redeem)
  Shows:
    Gold balance: {n}g (₹{value})
    Product: name, image, price
    Balance after purchase: {balance - price}
  CTA: "Confirm Redemption"

Step 3: ConfirmationBottomSheet
  "This will deduct ₹{price} from your gold balance."
  Confirm / Cancel

Step 4: API: POST /orders { productId, paymentMethod: "gold_balance" }
  DP-1: Sufficient balance confirmed by server
    → OrderConfirmation (same as FLOW-005 Step 4)
    → Deduct from gold balance
    → Remove from Dream Vault
  DP-2: Balance insufficient (race condition: gold rate changed)
    → Show updated balance and product price
    → "Your balance is ₹{n} short due to a rate change."
    → Option: "Pay ₹{n} difference" or "Cancel"
```

**Success State:** Order confirmed, gold balance reduced, product removed from vault.

**Failure States:**
- Rate change makes balance insufficient: show diff, offer partial payment
- Server error: do not deduct balance, show error + retry
- Product out of stock: "This item is no longer available. View similar pieces."

---

## FLOW-008: Goal Creation (Full Flow)

**Entry Point:**
- Goals screen "+ Start a New Goal" button
- HomeScreen no-goals state CTA
- AffordabilityBridge on product page
- Dream Vault "Start Accumulating →"
- Aura goal planning flow completion

```
Step 1: MomentScreen (/goals/create/moment)
  User selects goal type (single select)
  DP-1: Arrived from product page
    → productId param present, show product card above goal types
  DP-2: No product attached
    → Standard goal type selection only
  CTA: "Next →" (disabled until selection made)

Step 2: PieceScreen (/goals/create/piece)
  DP-3: Product already attached (from Step 1 context)
    → Show ProductSummaryCard + "Change piece" + "Continue with this piece"
  DP-4: No product attached
    → Show "Browse the collection" + "I'll decide later"
  DP-5: User taps "Browse the collection"
    → Navigate to /shop with goalCreateContext=true
    → Product taps return to this step with product attached
  DP-6: User taps "I'll decide later"
    → Skip to Step 3 with no product

Step 3: AmountScreen (/goals/create/amount)
  Slider: ₹1,000 to ₹50,000, step ₹500
  Default: ₹3,000 (or last-used amount if returning user)
  Quick-select pills: ₹1,000 | ₹2,500 | ₹5,000 | ₹10,000

  Live preview (debounced 300ms after slider stop):
    No product: "{estimatedGrams}g over {duration} months"
    With product: "Reach your goal in {months} months · {completionDate}"
  
  DP-7: User has existing scheme
    → Show: "This adds to your existing accumulation"
    → Still create as new goal

Step 4: PaymentScreen (/goals/create/payment)
  UPI Autopay | Debit Card | Net Banking
  DP-8: UPI selected
    → UPI ID input + verify button
    → API: POST /payment/upi/verify
  DP-9: Card selected
    → Card number, expiry, CVV
  CTA: "Start My Goal"
  API: POST /goals { type, productId?, monthlyAmount, paymentMethod }

Step 5: Processing (loading state, 1–3 seconds)
  "Setting up your goal…" — DM Sans 14px centered
  AnimatedProgressIndicator (not spinner — a linear fill)
  DP-10: Success → Step 6
  DP-11: Payment setup failed → error bottom sheet, retry

Step 6: ConfirmationScreen (/goals/create/confirmation)
  Full-screen Vault Dusk bg
  Product image (if attached) or illustration
  "Your goal has begun." — Cormorant 28px
  Goal summary card
  ProgressRing animates 0% → first-contribution %
  CTA: "See My Goal →" → /goals/{newGoalId}
  Secondary: "Browse the Collection" → /shop
```

**Success State:** Goal record created. First contribution scheduled. User on confirmation screen.

**Failure States:**
- UPI ID invalid: inline error, don't block step
- Card declined: step 4 error state, retry with different card
- Network loss during creation: retry-safe (idempotency key), show "Trying again…"
- Goal already exists for same product: "You already have a goal for this piece. View it?"

---

## FLOW-009: Monthly Contribution (Autopay)

**Entry Point:** System-triggered on contribution due date

```
Step 1: Autopay executes (background, no user action)
  API: POST /contributions { goalId, amount, method: "autopay" }

Step 2: Success
  Push notification: "Your gold grew today. {name}, you're {percent}% closer."
  Home screen GreetingCard updates: "Your reserve grew ₹{n} this month."
  MilestoneTimeline dot fills to current month

Step 3: Milestone check
  If new milestone reached (10g, 25g, 50g, 100g):
    Queue milestone push notification for next app open
    On next app open: MilestationCelebrationOverlay

Step 4: CanRedeemToday section recalculates
  Fetches updated product list matching new balance
```

**Failure State (Autopay failure):**
```
  Push notification: "We couldn't process your contribution for {goalName}."
  In-app: GoalCard status → "contributionDue"
  StatusBadge pulses once per session
  
  User opens app:
    Toast: "Your contribution for {goalName} needs attention."
    CTA in toast: "Contribute Now →"
  
  ManualContributionFlow:
    GoalCard → "Manage Goal" → ContributionScreen
    User selects amount (pre-filled with monthly amount)
    One-time UPI/Card payment
    On success: status resets to "onTrack"
```

---

## FLOW-010: Aura Goal Planning

**Entry Point:**
- Aura landing → "Help me plan my jewellery" card
- Home screen no-goals state → "Ask Aura to help me plan →"
- Aura chat: wedding/planning intent detected

```
Step 1: AuraLandingScreen
  User taps "Help me plan my jewellery" ActionCard

Step 2: AuraGoalPlanningFlow (/aura/goal-planning)
  Card 1: "What are we planning for?"
    Options: My wedding | My daughter's | My son's | Other family

  Card 2: "When is the occasion?"
    MonthYearPicker widget embedded in card

  Card 3: "What's your overall jewellery budget?"
    Slider ₹50,000 – ₹10,00,000
    Live: "That's approximately {n}g of gold"

Step 3: Aura generates plan
  API: POST /aura/plan { occasion, date, budget }
  Loading: "Aura is thinking…" — shimmer on next card position
  
  Response card (Cormorant italic):
    "For a [occasion] in [month year], saving ₹{monthly}/month from today
     gives you approximately {grams}g — enough for [product category description]."
  
  3 product recommendation cards below text
  Each card: standard ProductCard (horizontal variant)
    + "Add to Dream Vault" button

Step 4: User action
  DP-1: Taps product "Add to Dream Vault"
    → FLOW-004 Steps 3–4 (vault save + GoalStartBottomSheet)
  DP-2: Taps "Start saving for this →"
    → Navigate to /goals/create with auraContext data prefilled
  DP-3: Taps product card
    → Navigate to /shop/product/{productId}
  DP-4: Types follow-up in chat input
    → AuraChatView, continues conversation
```

**Success State:** User has either saved to vault, started a goal, or has a product to browse.

**Failure States:**
- Aura API timeout: "Aura is taking longer than usual. Try again?"
- No products match budget: "I couldn't find exact matches. Let me show you closest options." + 3 products at nearest price point
- Date in the past: "That date has passed. Did you mean a future occasion?" + date picker again

---

## FLOW-011: Search → Product Discovery

**Entry Point:** SearchBar tap (any screen showing search bar)

```
Step 1: SearchScreen (/shop/search)
  Autofocused input
  Shows: recent searches + trending

Step 2: User types query
  Live results appear (debounced 300ms):
    Categories, Collections, Products

Step 3: User taps result
  DP-1: Category result → /shop/category/{categoryId}
  DP-2: Collection result → /shop/collection/{collectionId}
  DP-3: Product result → /shop/product/{productId}
  DP-4: No results state
    → CTA: "Ask Aura →" → /aura with query prefilled

Step 4: Recent searches
  Add query to recent searches on submit
  Max 8 recent searches stored locally
  Clear all option in recent section header
```

---

## FLOW-012: First-Time Occasion Browse

**Entry Point:** HomeScreen OccasionChip tap

```
Step 1: OccasionChip tapped (e.g., "Onam")
  Navigate to /shop/occasion/onam

Step 2: OccasionCollectionScreen
  Editorial header: "Onam 2025 — Made for the Season"
  Curated product grid: pre-filtered server-side by occasion tag
  FilterBar: visible, pre-set to occasion context

Step 3: Standard product browsing (FLOW-004 or FLOW-005)
```

---

## FLOW-013: My Gold → Browse Products (Scheme-to-Shop)

**Entry Point:** MyGoldScreen CanRedeemToday section

```
Step 1: User views "Ready to Redeem" section
  Products shown: priceRupees ≤ goldBalanceRupees

Step 2: User taps product
  Navigate to /shop/product/{productId}
  Query param: ?redeemContext=true

Step 3: ProductDetailScreen
  AffordabilityBridge shows "canAffordNow" state:
    "You can buy this today"
    CTA: "Buy With My Gold"

Step 4: Taps "Buy With My Gold"
  → FLOW-007 Redeem flow
```

---

## FLOW-014: Milestone Celebration

**Entry Point:** System trigger — next app open after milestone crossed

```
Step 1: App opens, AppShell checks milestone queue
  API: GET /user/milestones/uncelebrated

Step 2: MilestoneCelebrationOverlay appears (full-screen modal)
  bg Vault Dusk
  Gold ring illustration
  Text: "You've reached {n}g of gold."
  Sub: DM Sans 14px "{monthsAgo} months ago you started with nothing."
  CTA: "See what {n}g can buy →"
  Secondary: "Continue" (dismiss)

Step 3: User taps CTA
  Navigate to /my-gold with CanRedeemToday section highlighted

Step 4: Mark milestone as celebrated
  API: POST /user/milestones/{id}/celebrate
```

---

## FLOW-015: Guest Browse (No Auth)

**Entry Point:** Any product or collection from marketing link or QR code

```
Guest can access:
  - ProductDetailScreen (read-only)
  - CollectionScreen (read-only)
  - OccasionScreen (read-only)
  - AuraLandingScreen (read-only, no personalisation)

Guest cannot access:
  - Dream Vault (auth gate)
  - Goals (auth gate)
  - My Gold (auth gate)
  - Cart / Checkout (auth gate)

Auth gates:
  Any blocked action → AuthBottomSheet slides up
  "Sign in to save this to your Dream Vault"
  CTA: "Sign In" → FLOW-002
  After auth: return to intended action

Guest journey example:
  Marketing link → /shop/product/xyz
  Views product → taps "Save to Dream Vault"
  → AuthBottomSheet
  → Completes auth → Onboarding intent screen (if new user)
  → Returns to product → vault save completes
```

---

## FLOW-016: Returning User — Contribution Due

**Entry Point:** App open, GoalCard status = contributionDue

```
Step 1: HomeScreen GreetingCard
  No special treatment on greeting

Step 2: GoalProgressRingCard
  GoalCard shows contributionDue StatusBadge
  Badge pulses once on mount (animation)

Step 3: Toast notification (bottom of screen, auto-dismiss 4s)
  "Your {goalName} contribution is due."
  CTA in toast: "Contribute →"

Step 4: User taps Contribute (toast or GoalCard CTA)
  Navigate to /goals/{goalId}/contribute

Step 5: ContributionScreen
  Amount: pre-filled with monthlyAmount
  User can adjust amount (min: monthlyAmount, max: target remaining)
  Payment method: saved method shown + change option
  CTA: "Contribute Now"

Step 6: Success
  GoalCard status → onTrack
  GoldLedger updates with new entry
  Toast: "{grams}g added to your reserve."
```

---

## FLOW CROSS-REFERENCE

| Screen | Flows that land here |
|---|---|
| ProductDetailScreen | 004, 005, 006, 007, 012, 013 |
| GoalCreateFlow | 006, 008, 010 |
| DreamVaultScreen | 004, 007 |
| MyGoldScreen | 009, 013, 014 |
| AuraScreen | 010, 011 |
| AuthScreen | 002, 004 (gate), 005 (gate) |
| HomeScreen | 001, 009, 014, 016 |

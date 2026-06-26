# 08 — Edge Cases
## Moozhayil Gold & Diamonds — Every Unusual Scenario Handled

---

## EDGE CASE CATEGORIES

- EC-AUTH: Authentication
- EC-GOLD: Gold rate and balance
- EC-GOAL: Goal lifecycle
- EC-PAY: Payments
- EC-PROD: Products
- EC-VAULT: Dream Vault
- EC-ORDER: Orders
- EC-KYC: Verification
- EC-NET: Network and connectivity
- EC-DEVICE: Device-specific
- EC-AURA: Aura AI

---

## EC-AUTH

### EC-AUTH-001: User changes phone number
**Scenario:** A user gets a new SIM card and a different phone number.
**Handling:**
- No phone number change in v1 (complex identity and KYC implications)
- Profile screen shows phone as read-only
- Support contact option shown below phone field: "Changed number? Contact us."
- Admin flow exists to manually transfer account after identity verification

### EC-AUTH-002: Simultaneous sessions on two devices
**Scenario:** User logs in on a new device while already logged in on another.
**Handling:**
- Both sessions remain valid (no forced logout of old device)
- Push token on new device replaces old device's push token
- The old device's push notifications stop (silently — no disruption to old session until token expires)

### EC-AUTH-003: Expired token during a multi-step flow
**Scenario:** User starts goal creation, access token expires during Step 3 (e.g., they leave the app for an hour).
**Handling:**
- On next API call: 401 returned
- Client silently attempts token refresh using refresh_token
- If refresh succeeds: retry the failed call, user experiences no interruption
- If refresh fails: redirect to auth screen, store partial form state in local storage, restore after re-auth

### EC-AUTH-004: OTP delivery failure
**Scenario:** OTP SMS is not delivered (carrier issue, DND list, etc.).
**Handling:**
- After 60s: show "Didn't get it?" with "Resend" option
- After 2 resends: show "Call me instead" option (voice OTP)
- If all fail: "Contact our store at [phone]" as escape hatch
- Never tell the user "OTP sent" without backend confirmation of dispatch

---

## EC-GOLD

### EC-GOLD-001: Gold rate not updated (stale rate)
**Scenario:** Rate provider fails to update for >24 hours.
**Handling:**
- Backend: monitor rate age; if >8 hours old, alert admin
- Frontend: if `rate_updated_at` is >8 hours ago, show "Rate may be outdated" below price
- Orders can still be placed — price used is the last available rate
- Do not block purchases; log anomaly for admin review

### EC-GOLD-002: Extreme gold rate movement (>5% in one day)
**Scenario:** Gold rate spikes or drops dramatically (geopolitical event, etc.).
**Handling:**
- If rate changes >5% from opening: add a banner notification to scheme users:
  "Gold rates moved significantly today. Your scheme still accumulates at the current lower/higher rate."
- No automatic scheme adjustments
- Aura gold insight updates to reflect the movement with context

### EC-GOLD-003: Gold rate drops between Dream Vault save and goal creation
**Scenario:** User saves a ₹1,00,000 necklace. Gold rate drops 3%. Product is now ₹97,000. User creates a goal.
**Handling:**
- Goal creation uses the current price at the moment of enrollment
- The `target_amount_paise` on the goal is set at enrollment time
- If the goal was created with the old price estimate, the accumulated gold may exceed what's needed — surfaced as "You may be able to redeem sooner than expected"

### EC-GOLD-004: Gold rate rises enough to make "Can Redeem Today" disappear
**Scenario:** User's gold balance is ₹85,000. A product shows in CanRedeemToday. Gold rate rises. Product now costs ₹89,000.
**Handling:**
- CanRedeemToday is recalculated on every screen load using current rate
- Product disappears from the section without notification
- If user taps to buy: the product page shows updated price with AffordabilityBridge updated accordingly

### EC-GOLD-005: Zero gold balance user
**Scenario:** New user with no contributions.
**Handling:**
- MyGoldHero shows "0g" — not blank, not loading
- CanRedeemToday section: hidden entirely (server returns empty, client renders nothing)
- GoalProgressRingCard: no-goals state (invitation to start)
- Ledger: empty state message, not an error

### EC-GOLD-006: Contribution processing mid-day rate change
**Scenario:** Autopay triggers at 10:00 AM. Gold rate updates at 10:02 AM. Contribution was debited before the new rate.
**Handling:**
- Rate is locked at the moment the contribution record is created (before debit)
- If debit and credit are in different rate windows: the rate on the contribution record governs
- This is the `gold_rate_per_gram_paise` field on contributions — set atomically with contribution creation

---

## EC-GOAL

### EC-GOAL-001: Product attached to goal goes out of stock
**Scenario:** User creates a goal for a specific necklace. The necklace sells out 3 months later.
**Handling:**
- Goal continues unaffected (accumulation keeps going)
- Product attachment is removed from goal
- Push notification: "The piece you were saving for is no longer available. Your gold is safe — find a new dream piece."
- On GoalCard: product image replaced with category illustration, goal name retained
- AffordabilityBridge on product page: no longer links to this goal

### EC-GOAL-002: Product price changes significantly after goal creation
**Scenario:** Product was ₹84,000 when goal was created. Gold rate rises. Product is now ₹95,000.
**Handling:**
- `target_amount_paise` on goal stays fixed at creation price
- `percent_complete` uses the fixed target amount (not current price)
- On GoalCard: a subtle note "Product price has changed. Current price: ₹95,000." appears below progress
- User can update the target or continue with the original goal amount

### EC-GOAL-003: User tries to enroll without KYC
**Scenario:** User taps "Start This Goal" from a product page.
**Handling:**
- Client checks `kyc_status` from cached user object
- If not verified: KYCGateBottomSheet slides up
  - Shows: "To start a Gold Goal, we need to verify your identity."
  - CTA: "Verify Now (2 min)" → /kyc
  - Secondary: "Remind me later" → dismisses, stays on product page
- On KYC completion: deep link returns to goal creation flow

### EC-GOAL-004: User tries to create a 6th goal (at limit)
**Scenario:** User already has 5 active goals and tries to create another.
**Handling:**
- POST /goals returns 400 GOAL_LIMIT_REACHED
- Client shows bottom sheet: "You have 5 active goals — the maximum. Complete or pause an existing goal to start a new one."
- CTA: "Manage My Goals →" → /goals

### EC-GOAL-005: Autopay fails multiple consecutive months
**Scenario:** User's UPI autopay fails 3 consecutive months.
**Handling:**
- Month 1 failure: notification + in-app toast
- Month 2 failure: notification + GoalCard badge
- Month 3 failure: notification + goal status → `paused` + prominent in-app message
  "Your goal has been paused due to missed contributions. Your gold is safe."
  CTA: "Reactivate" → manual contribution + update payment method

### EC-GOAL-006: Goal duration expires with no redemption
**Scenario:** 12-month goal ends. User never buys. Gold just sits as balance.
**Handling:**
- Gold remains in user's balance indefinitely (no expiry)
- Goal status → `completed` (even if never redeemed)
- User gets prompt: "Your goal completed! Your gold is ready to use whenever you are."
- No penalty, no pressure to buy
- The balance shows in CanRedeemToday permanently

### EC-GOAL-007: User pauses and resumes goal
**Scenario:** User pauses a goal for financial reasons, resumes 2 months later.
**Handling:**
- Pause: no contributions debited. Gold already accumulated is retained.
- Bonus eligibility: pausing forfeits the completion bonus (rule BR-GOAL-004)
- But user is not told this proactively — only surfaces in terms
- Resume: `next_contribution_date` recalculated from resume date
- `estimated_completion_date` updates accordingly

### EC-GOAL-008: Two goals saving for the same product
**Scenario:** User creates Goal A and Goal B, both attached to the same necklace.
**Handling:**
- Allowed — no system restriction
- Both goals accumulate to the same unified balance
- When combined balance reaches product price, CanRedeemToday shows the product once
- Edge case visible in My Gold: two goal rings for one product; system doesn't merge them

---

## EC-PAY

### EC-PAY-001: Payment gateway timeout during contribution
**Scenario:** User taps "Contribute Now." Network drops after payment is debited but before confirmation.
**Handling:**
- Idempotency key prevents double debit
- If debit succeeded but confirmation not received: retry on next app open
- Backend reconciliation job: checks pending contributions >10 minutes old against payment gateway
- If payment confirmed by gateway: contribution status → completed
- If not confirmed: status → failed, refund triggered, user notified

### EC-PAY-002: UPI app not installed
**Scenario:** User selects UPI payment. No UPI app is installed on device.
**Handling:**
- Client checks for installed UPI apps before showing UPI as primary option
- If none found: show card as primary, UPI as secondary with "Install a UPI app" note
- Deep link to Play Store/App Store for a recommended UPI app

### EC-PAY-003: Card declined
**Scenario:** Card payment fails during goal enrollment.
**Handling:**
- Payment step shows error: "Payment declined. Check your card details or try a different card."
- Goal record is not created (enrollment fails atomically with payment)
- Form is not cleared — user can fix and retry
- After 3 declines on same card: suggest alternative payment method

### EC-PAY-004: Double tap on "Contribute Now"
**Scenario:** User taps contribute button twice quickly.
**Handling:**
- Button enters `loading` state on first tap (disabled immediately)
- All subsequent taps ignored until response received or timeout
- Idempotency key covers server-side duplicate prevention

### EC-PAY-005: Refund processing
**Scenario:** User cancels an order after payment.
**Handling:**
- Card/UPI payment: refund initiated via gateway. 5–7 business days.
- Gold balance redemption: balance restored immediately on cancellation.
- User notified via push notification when refund is initiated.
- Order status shows "Refund Initiated" → "Refunded"

---

## EC-PROD

### EC-PROD-001: Product viewed while price updates
**Scenario:** User is on a product page. Gold rate updates. Price changes by ₹400.
**Handling:**
- Price is refetched every 10 minutes while user is on product page (background poll)
- If price changes: show "Price updated" banner below price block (not intrusive)
- Old price crossed out, new price shown
- Cart item prices update similarly on cart open

### EC-PROD-002: Last unit sells while in cart
**Scenario:** Product is in user's cart. Another user buys the last unit.
**Handling:**
- Detected at checkout (POST /orders)
- Error: OUT_OF_STOCK returned
- Cart page shows: "This item is no longer available" with item greyed out
- CTA: "Remove and continue" or "Find similar pieces"

### EC-PROD-003: Product has no images
**Scenario:** Admin published a product without uploading images.
**Handling:**
- Frontend: show placeholder image (brand monogram on Champagne Veil background)
- Never break layout; always render something
- Admin alert triggered (backend validation warning on publish)

### EC-PROD-004: AR model fails to load
**Scenario:** User taps "Try On." AR model URL returns 404 or load fails.
**Handling:**
- Try On button shows loading for 3 seconds max
- On failure: "AR try-on unavailable right now. Try again later."
- Button reverts to inactive state
- No crash; graceful fallback to standard image view

### EC-PROD-005: Search with special characters or emojis
**Scenario:** User searches "bangles 💛" or "necklace & earrings set."
**Handling:**
- Strip non-alphanumeric characters (except spaces) before sending to search API
- Sanitized query: "bangles" and "necklace earrings set"
- Never pass raw user input with special chars to database

---

## EC-VAULT

### EC-VAULT-001: Item added to vault by unauthenticated user
**Scenario:** Guest user taps "Save to Dream Vault."
**Handling:**
- Store product_id in local storage (not in DB)
- Show auth prompt
- After registration/login: auto-add stored product_ids to vault via POST /vault (one call per stored item)
- Clear local storage after sync

### EC-VAULT-002: Maximum vault size
**Scenario:** User saves 50+ products to vault (no technical limit in v1).
**Handling:**
- No hard limit in v1
- If performance issues emerge: soft limit of 50 items; oldest removed when 51st is added
- User notified: "Your Dream Vault is full. Remove an item to add a new one."

### EC-VAULT-003: Vault item's goal is deleted
**Scenario:** User cancels a goal that was attached to a vault item.
**Handling:**
- Vault item remains
- `goal_id` on vault item is set to null
- Item shows back in "Start Accumulating" state (as if no goal attached)

---

## EC-ORDER

### EC-ORDER-001: Multiple customers checkout same last unit simultaneously
**Scenario:** Two users tap "Buy Now" on the last available product within milliseconds.
**Handling:**
- Database-level pessimistic lock on stock decrement
- First transaction to acquire lock: order created, stock decremented to 0
- Second transaction: lock fails, returns OUT_OF_STOCK error
- Second user sees: "This item just sold out. View similar pieces."

### EC-ORDER-002: Address not serviceable
**Scenario:** User's saved address is in a remote area without delivery coverage.
**Handling:**
- `/addresses/validate-pincode` called when address is added or selected at checkout
- Non-serviceable pincode: "We don't currently deliver to this pincode. You can pick up from our store."
- Store pickup option offered
- If no nearby store: "Contact us to arrange delivery."

### EC-ORDER-003: Gold balance deducted but delivery fails
**Scenario:** Order is placed, gold balance deducted, but the parcel is lost in transit.
**Handling:**
- This is an operations / insurance problem, not a UI problem
- Order status: `delivery_failed` (custom status for lost parcel)
- Gold balance restored (manual admin action)
- Replacement order created or refund issued
- User contacted via push notification and phone

---

## EC-KYC

### EC-KYC-001: Aadhaar name and PAN name don't match
**Scenario:** Aadhaar says "PRIYA MENON", PAN says "P MENON."
**Handling:**
- Fuzzy match with 80% threshold (handles initials, middle name omissions)
- "P MENON" vs "PRIYA MENON": likely a match — pass
- "PRIYA MENON" vs "DEEPA NAIR": fail
- On fail: "Names on your documents don't match. Please contact support."

### EC-KYC-002: KYC rejected
**Scenario:** Admin reviews and rejects KYC.
**Handling:**
- Push notification: "KYC verification was unsuccessful."
- Profile screen shows rejection reason (if providable) + "Resubmit" CTA
- User can resubmit after 24-hour cooldown
- 3 rejections: manual review required, helpdesk escalation

### EC-KYC-003: KYC in review for >2 hours
**Scenario:** KYC review takes longer than expected.
**Handling:**
- Standard SLA is 30 minutes
- If pending >2 hours: push notification "Still working on your verification. We'll notify you soon."
- No action needed from user
- Admin alert triggered for delayed reviews

### EC-KYC-004: User tries to use a feature requiring KYC mid-flow
**Scenario:** User is browsing products, adds to cart, reaches checkout, and the cart total is ₹60,000 (above the no-KYC limit).
**Handling:**
- KYC gate shown at checkout when total > ₹50,000
- Cart is preserved (not cleared)
- After KYC completion: user is returned to checkout with cart intact

---

## EC-NET

### EC-NET-001: Complete offline state
**Scenario:** User has no internet connection.
**Handling:**
- OfflineBanner shown at top of all screens
- Cached home screen content shown (last successful load)
- Actions that require network: disabled with tooltip "You're offline"
- Actions that don't: Dream Vault browsing (cached), viewing saved goals (cached)
- On reconnect: OfflineBanner dismissed, background refresh of key data

### EC-NET-002: Slow network (>5 second load times)
**Scenario:** User on 2G or poor network.
**Handling:**
- All images: lazy load with shimmer
- Critical text content loads first (name, balance, goal %)
- Heavy sections (product grid): load progressively
- After 10 seconds: "Loading slowly. Check your connection." with retry option
- Never show a blank screen; always show something useful

### EC-NET-003: API returns unexpected response shape
**Scenario:** Backend deploys a breaking change and response shape changes.
**Handling:**
- All API responses parsed defensively: missing fields default to null/empty
- Never crash on unexpected keys — ignore unknown fields
- If a critical field is missing (e.g., `price` on a product): show error state for that item, not full screen crash
- Error logging: report to monitoring service (Sentry or equivalent)

---

## EC-DEVICE

### EC-DEVICE-001: App backgrounded during payment
**Scenario:** User is redirected to UPI app, payment completes, user returns. App may have been cleared from memory.
**Handling:**
- On app resume (foreground): check pending contributions status via GET /goals/{id} or GET /contributions/pending
- If contribution completed: show success toast + update UI
- Do not require user to re-confirm or re-trigger

### EC-DEVICE-002: Push notification tapped when app is killed
**Scenario:** User taps a push notification from a cold start.
**Handling:**
- Parse `deep_link` from notification payload
- Navigate directly to the linked screen after app initialisation + auth check
- If not authenticated: auth screen first, then deep link target

### EC-DEVICE-003: Very small screen (320px width)
**Scenario:** App runs on an older device with 320px width (e.g., iPhone SE 1st gen).
**Handling:**
- 2-column product grid collapses to 1-column below 360px
- Progress ring sizes scale proportionally (lg → md, md → sm)
- No horizontal overflow on any screen (test all layouts at 320px minimum)

### EC-DEVICE-004: Large text accessibility setting
**Scenario:** User has system font size set to maximum.
**Handling:**
- All text respects system font scaling (no fixed pixel font sizes in accessibility-critical text)
- Layouts designed with text wrap in mind — no single-line truncation for critical content
- Exception: product card names — 2-line max with ellipsis is acceptable

---

## EC-AURA

### EC-AURA-001: Aura API timeout
**Scenario:** Aura responds in >5 seconds.
**Handling:**
- Show "Aura is thinking…" for up to 8 seconds (shimmer on next card position)
- After 8 seconds: "Aura is taking a moment. Try again?" with retry button
- Cache last Aura home insight; serve cached version if Aura is slow

### EC-AURA-002: Aura returns no products for a recommendation
**Scenario:** User has a very specific or expensive budget. No products match.
**Handling:**
- Never show empty recommendation section
- Fallback 1: Widen budget by 20%, try again
- Fallback 2: Show "Closest options" — 3 products nearest to budget
- Fallback 3: Show "Browse all bridal/occasion collections" link

### EC-AURA-003: Aura conversation context lost (session expired)
**Scenario:** User returns to an Aura conversation after 24 hours.
**Handling:**
- Sessions expire after 24 hours
- On return: show a summary card: "Last time, you were planning for a wedding in March 2027."
- CTA: "Continue this plan" (restores context) or "Start fresh"
- Full message history is not replayed — only the summary

### EC-AURA-004: Profanity or off-topic input in Aura chat
**Scenario:** User types something unrelated or inappropriate in the Aura chat.
**Handling:**
- Client-side: no filtering (don't play content police)
- Server-side: system prompt instructs Aura to redirect:
  "I'm best at helping you find jewellery and plan your gold goals. What can I help you find today?"
- Aura never generates offensive responses; it deflects gracefully

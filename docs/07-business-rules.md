# 07 — Business Rules
## Moozhayil Gold & Diamonds — Domain Logic and Constraints

---

## SECTION 1: GOLD PRICING RULES

### BR-PRICE-001: Price Calculation Formula

Product price is always computed at query time from the current gold rate.
No prices are stored statically — they reflect the live market.

```
gold_value        = weight_grams × current_rate_per_gram
making_value      = gold_value × (making_charge_pct / 100)
wastage_value     = gold_value × (wastage_pct / 100)
base_price        = gold_value + making_value + wastage_value + stone_value_fixed
gst               = base_price × (gst_pct / 100)
total_price       = base_price + gst
```

### BR-PRICE-002: Gold Rate Updates

- Rates are updated minimum once daily at market open (approx 10:00 AM IST)
- Source: IBJA (India Bullion and Jewellers Association) rates
- Rate is locked per purity (22K, 18K, 24K separately)
- A contribution made during the day uses the rate active at time of transaction (not end-of-day)
- The `effective_to` field on the previous rate record is set when a new rate is inserted

### BR-PRICE-003: Scheme Monthly Amount → Grams Conversion

```
grams_credited = contribution_amount_paise / rate_per_gram_paise
```

Rate used: the 22K rate active at the exact timestamp the contribution is processed.
This is recorded on the contribution record and is immutable.

### BR-PRICE-004: Display Rounding

- Grams displayed: always 1 decimal place (e.g., "37.4g") — stored as 4 decimal places internally
- Rupee amounts displayed: no decimal places, Indian number formatting (₹2,34,600)
- Monthly scheme suggestion: `CEIL(product_total_price / 36 / 500) × 500` — always rounded up to nearest ₹500

### BR-PRICE-005: Price Validity Window

Prices shown to users are valid for 15 minutes after page load.
After 15 minutes, the frontend must refresh the product price before allowing Add to Cart or Buy Now.
If rate changes during checkout, user must confirm updated price before order is placed.

---

## SECTION 2: GOAL / SCHEME RULES

### BR-GOAL-001: Minimum Monthly Contribution

- Minimum: ₹1,000 per month per goal
- Maximum: ₹50,000 per month per goal (regulatory limit for non-KYC schemes)
- KYC-verified users: maximum ₹2,00,000 per month per goal

### BR-GOAL-002: Goal Duration

- Standard duration: 12 months
- Extended options: 18 months, 24 months, 36 months
- Minimum duration: 12 months
- No custom durations allowed in v1

### BR-GOAL-003: Maximum Active Goals Per User

- Non-KYC users: 0 (cannot create goals)
- KYC-pending users: 0 (cannot create goals until verified)
- KYC-verified users: up to 5 active goals simultaneously

### BR-GOAL-004: Goal Bonus (Traditional Scheme Benefit)

On completion of a goal (all monthly contributions paid, no missed months):
- Bonus = 1 monthly contribution amount in gold credit
- Credited to user's balance within 24 hours of final contribution
- Bonus is forfeited if any contribution is missed (not made up within the grace period)
- Bonus type recorded as `contribution.type = "bonus"`

### BR-GOAL-005: Missed Contribution Grace Period

- Grace period: 7 days after the scheduled contribution date
- If not paid within 7 days: status → `contribution_due` (not failed)
- If not paid within 30 days: status → `failed`, goal status → `paused`
- User can manually contribute to make up missed payments
- Making up a missed payment within 30 days restores eligibility for the bonus

### BR-GOAL-006: Goal Cancellation and Gold Retention

- User may cancel a goal at any time
- All gold accumulated (contributions converted to grams) is retained in the user's balance
- No penalties for cancellation in v1 (may change with regulatory guidance)
- Gold balance remains redeemable for any jewellery purchase indefinitely

### BR-GOAL-007: Goal Completion

A goal is considered complete when:
- Duration months have elapsed AND
- All contributions are in `completed` status (or made up within grace period)
- OR: User redeems accumulated gold for a purchase (goal marked complete on redemption)

On completion:
1. Bonus credited (if eligible — BR-GOAL-004)
2. Notification sent: `goal_completed`
3. Milestone check triggered (BR-MILESTONE rules)
4. Goal status → `completed`
5. Gold balance remains; user is prompted to set a new goal

### BR-GOAL-008: Product Attachment

- A product can be attached to a goal at creation or any time after
- A product attachment is a reference only — not a reservation or hold
- If the product sells out, the goal continues; product attachment is removed and user is notified
- One product per goal maximum
- Same product can be attached to multiple goals by the same user (edge case: two goals saving for the same piece)

### BR-GOAL-009: Scheme Interoperability

All gold from all goals contributes to one unified balance per user.
A user with 3 active goals has one total gold balance (sum of all goal contributions).
Any product can be redeemed against the total balance regardless of which goal funded it.

---

## SECTION 3: REDEMPTION RULES

### BR-REDEEM-001: Redemption Eligibility

User can redeem (purchase using gold balance) when:
1. KYC status is `verified`
2. Gold balance value (in rupees at current rate) ≥ product total price
3. Product is in stock

### BR-REDEEM-002: Partial Redemption

If gold balance covers part of the product price:
- User can pay the remainder via UPI/card
- Minimum gold redemption: no minimum (even ₹100 of balance can offset a purchase)
- The system shows: "Use ₹{balance} in gold + pay ₹{difference}"

### BR-REDEEM-003: Gold Rate at Redemption

Gold balance is valued at the current 22K rate at the moment of redemption.
The order records the exact rate used.
If the rate changes between "Buy Now" tap and order confirmation, the user sees the updated price.

### BR-REDEEM-004: Post-Redemption Balance

After redemption:
- Balance is reduced by `product_gold_value / current_rate` grams (exact gold equivalent of money spent)
- The making charges and GST portion of the product price are deducted from remaining balance in rupee terms
- Net balance after purchase = `old_balance_rupees - product_total_price`; converted back to grams at current rate

---

## SECTION 4: KYC RULES

### BR-KYC-001: Actions Requiring KYC

The following require `kyc_status = "verified"`:
- Creating a new goal/scheme
- Making any gold contribution
- Redeeming gold for purchase (buying with gold balance)
- Placing any order above ₹50,000

The following do not require KYC:
- Browsing products
- Saving to Dream Vault
- Adding to cart
- Placing orders below ₹50,000 (cash/card payment only)

### BR-KYC-002: KYC Document Requirements

Minimum for verification:
- Option A: Aadhaar (OTP-verified) + selfie
- Option B: PAN + selfie

Both Aadhaar and PAN are preferred. Either alone is accepted in v1.

### BR-KYC-003: Name Matching

Name on PAN must approximately match name on Aadhaar (fuzzy match, 80% similarity threshold).
Mismatch → KYC rejected, user informed, can resubmit.

### BR-KYC-004: KYC Re-verification

KYC does not expire once verified.
If a user's phone changes: KYC must be re-submitted.
Admin can manually flag KYC for re-review.

---

## SECTION 5: GOLD BALANCE RULES

### BR-BALANCE-001: Balance Calculation

The authoritative gold balance is always:
```
SUM(contributions.grams_credited)
WHERE contributions.status = 'completed'
AND contributions.user_id = {userId}
```

The `gold_balance_snapshots` table provides cached values for performance.
Snapshots are refreshed: after every completed contribution, after every redemption, nightly at 2 AM.

If snapshot is older than 1 hour: recompute from source on next GET /gold-balance request.

### BR-BALANCE-002: Balance Floor

Gold balance can never go negative.
Redemptions are blocked server-side if balance would go negative.

### BR-BALANCE-003: Balance Display Rounding

Always show 1 decimal place of grams to users.
Internal calculations use full 4 decimal precision.
Never round up — always floor to 1 decimal for display.
Example: 37.4892g displays as "37.4g"

---

## SECTION 6: ORDERING RULES

### BR-ORDER-001: Inventory Check at Order Creation

Stock is checked at the moment POST /orders is called.
If stock = 0: `OUT_OF_STOCK` error returned. Order not created.
Stock is decremented atomically on order creation (pessimistic lock).

### BR-ORDER-002: Order Idempotency

All POST /orders requests must include an `idempotency_key` (UUID generated by client).
If the same key is received twice (e.g., network retry), the second request returns the existing order.
This prevents double-charges on network timeouts.

### BR-ORDER-003: Order Cancellation Window

User can cancel an order if status is `pending_payment` or `confirmed` (not yet shipped).
Once `shipped`: cancellation not allowed (return process applies instead).
Cancellation triggers full refund of any card/UPI payment.
Gold balance is restored on cancellation.

### BR-ORDER-004: COD Policy

Cash on delivery available for orders below ₹25,000.
Not available for gold-balance redemptions.

---

## SECTION 7: PRODUCT RULES

### BR-PRODUCT-001: Price Fluctuation Warning

If a product's price has changed by more than 3% since the user first viewed it in the current session, show a price change indicator on the product page and in cart.

### BR-PRODUCT-002: Stock Display

```
stock_quantity > 5:  Show "In Stock"
stock_quantity 2-5:  Show "Only {n} left"
stock_quantity 1:    Show "Last piece"
stock_quantity 0:    Show "Out of Stock" — block purchase, show "Notify Me"
```

### BR-PRODUCT-003: Scheme Nudge Threshold

The affordability scheme nudge (monthly payment suggestion) is displayed on product cards and product pages only when:
- Product price > ₹25,000

Below ₹25,000: no scheme nudge (the impulse purchase threshold).

### BR-PRODUCT-004: AR Try-On Availability

AR try-on is available only on iOS 12+ and Android ARCore-compatible devices.
The `has_ar` flag on the product is a necessary but not sufficient condition.
Client must also check device capability before showing the "Try On" button.

---

## SECTION 8: NOTIFICATION RULES

### BR-NOTIF-001: Contribution Reminder

Reminder notifications are sent:
- 3 days before scheduled contribution date
- 1 day before
- On the day (if autopay fails)

Reminders are suppressed if autopay is configured and last 3 autopay attempts succeeded.

### BR-NOTIF-002: Milestone Celebration

A milestone celebration notification is sent once, immediately when the milestone is crossed.
The in-app overlay (MilestoneCelebrationOverlay) is shown on the next app open after the milestone.
It is shown only once (tracked by `celebrated_at`).

### BR-NOTIF-003: Aura Suggestion Frequency

Aura product suggestions via push notification: maximum 2 per week.
Not sent if user has opened the app within 24 hours (they've already seen in-app suggestions).

### BR-NOTIF-004: Gold Rate Alert

Gold rate alerts are opt-in (off by default).
When enabled: notify if 22K rate changes by more than 2% in a single day.

---

## SECTION 9: AURA RULES

### BR-AURA-001: Personalisation Requirements

Aura uses the following data for personalisation (fetched at session start):
- User's active goals and progress
- User's intent tags (from onboarding)
- User's dream vault contents
- User's product view history (last 90 days)
- Current gold rate and 30-day trend
- Upcoming contribution dates

### BR-AURA-002: Recommendation Safety

Aura must never recommend:
- Out-of-stock products
- Products discontinued (deleted_at set)
- Products outside the user's stated budget (allow 20% over budget as upper bound)

### BR-AURA-003: Session Limits

Free chat messages: 30 per hour per user.
Structured flows (goal planning, product discovery): no limit.

---

## SECTION 10: REFERRAL RULES

### BR-REFERRAL-001: Reward Trigger

Referrer reward is granted when:
- Referred user registers using the referral code AND
- Referred user completes their first goal enrollment AND
- First contribution is successfully processed

### BR-REFERRAL-002: Reward Value

v1 reward: ₹500 in gold credit (credited as a bonus contribution to the referrer's primary active goal).
Referred user reward: ₹500 discount on first jewellery purchase (applied as a coupon at checkout).

### BR-REFERRAL-003: Self-Referral Prevention

A user cannot apply their own referral code.
Checked by: matching phone number and device fingerprint.

---

## SECTION 11: REGULATORY NOTES

### BR-REG-001: PML Act Compliance

Per Prevention of Money Laundering Act (PMLA) guidelines for jewellers:
- Transactions above ₹2,00,000: require PAN collection (enforced at checkout)
- Transactions above ₹10,00,000: require SAR (Suspicious Activity Report) evaluation by admin

### BR-REG-002: GST

- Gold jewellery: 3% GST on (gold value + making charges)
- Making charges only (service): 5% GST (if billed separately — not applicable in this model)
- Stone components: 3% GST (same as gold in current structure)
- All GST amounts shown separately in price breakdown

### BR-REG-003: Scheme Registration

Gold saving schemes are regulated under SEBI guidelines for un-notified schemes.
Schemes must be registered with local jewellers' associations.
Monthly contribution above ₹50,000: requires enhanced KYC (both Aadhaar + PAN mandatory).
This is enforced in BR-GOAL-001.

# 06 — API Specification
## Moozhayil Gold & Diamonds — All Endpoints Defined

---

## CONVENTIONS

- Base URL: `https://api.moozhayil.com/v1`
- Auth: Bearer token in Authorization header — `Authorization: Bearer {jwt}`
- All responses: `Content-Type: application/json`
- All timestamps: ISO 8601 UTC — `2025-10-15T09:30:00Z`
- All monetary values: returned in PAISE as integers + formatted string
  - `{ "amount_paise": 84500000, "amount_display": "₹84,500" }`
- All gold weights: returned as decimal string + formatted string
  - `{ "grams": "37.4000", "grams_display": "37.4g" }`
- Pagination: cursor-based on list endpoints
  - Request: `?cursor={cursor}&limit={n}` (default limit: 20, max: 50)
  - Response: `{ data: [], next_cursor: "...", has_more: bool }`
- Auth required: marked [AUTH]
- Auth optional: marked [OPTIONAL_AUTH] — returns personalized data if token present

---

## ERROR RESPONSE FORMAT

```json
{
  "error": {
    "code": "INSUFFICIENT_BALANCE",
    "message": "Gold balance is insufficient for this purchase",
    "details": {
      "required_paise": 84500000,
      "available_paise": 62300000
    }
  }
}
```

### Standard Error Codes

| Code | HTTP | Meaning |
|---|---|---|
| UNAUTHORIZED | 401 | Missing or invalid token |
| FORBIDDEN | 403 | Token valid but action not permitted |
| NOT_FOUND | 404 | Resource does not exist |
| CONFLICT | 409 | Duplicate resource (e.g., item already in vault) |
| UNPROCESSABLE | 422 | Validation error, field-level errors in details |
| RATE_LIMITED | 429 | Too many requests |
| SERVER_ERROR | 500 | Unexpected server error |
| KYC_REQUIRED | 403 | Action requires verified KYC |
| INSUFFICIENT_BALANCE | 400 | Gold balance too low |
| PAYMENT_FAILED | 400 | Payment gateway rejection |
| OUT_OF_STOCK | 400 | Product no longer available |
| GOAL_LIMIT_REACHED | 400 | User has max allowed active goals |

---

## AUTH ENDPOINTS

---

### POST /auth/send-otp
Send OTP to phone number.

**Request:**
```json
{
  "phone": "+919876543210"
}
```

**Response 200:**
```json
{
  "otp_session_id": "ses_abc123",
  "expires_in_seconds": 300,
  "resend_allowed_after_seconds": 30
}
```

**Errors:** 422 (invalid phone), 429 (too many requests)

---

### POST /auth/verify-otp
Verify OTP and get auth token.

**Request:**
```json
{
  "otp_session_id": "ses_abc123",
  "otp": "483920"
}
```

**Response 200:**
```json
{
  "access_token": "eyJ...",
  "refresh_token": "eyJ...",
  "expires_in": 3600,
  "user": {
    "id": "usr_xyz",
    "phone": "+919876543210",
    "name": null,
    "kyc_status": "pending",
    "is_new_user": true
  }
}
```

**Errors:** 400 (wrong OTP), 400 (expired OTP), 429 (max attempts exceeded)

---

### POST /auth/refresh
Refresh access token.

**Request:**
```json
{
  "refresh_token": "eyJ..."
}
```

**Response 200:**
```json
{
  "access_token": "eyJ...",
  "expires_in": 3600
}
```

**Errors:** 401 (invalid/expired refresh token)

---

### POST /auth/logout [AUTH]
Invalidate current session.

**Request:** empty body

**Response 200:**
```json
{ "success": true }
```

---

## USER ENDPOINTS

---

### GET /user/me [AUTH]
Get current user profile.

**Response 200:**
```json
{
  "id": "usr_xyz",
  "name": "Priya",
  "phone": "+919876543210",
  "email": null,
  "kyc_status": "verified",
  "member_since": "2023-04-01",
  "city": "Thrissur",
  "intent_tags": ["wedding", "investment"],
  "gold_balance": {
    "grams": "37.4000",
    "grams_display": "37.4g",
    "value_paise": 23328000,
    "value_display": "₹2,33,280",
    "rate_used_paise": 624000,
    "rate_display": "₹6,240/g",
    "rate_updated_at": "2025-10-15T09:30:00Z"
  },
  "active_goals_count": 2,
  "push_token_registered": true
}
```

---

### PATCH /user/me [AUTH]
Update user profile.

**Request:**
```json
{
  "name": "Priya Menon",
  "email": "priya@example.com",
  "city": "Thrissur"
}
```

**Response 200:** Updated user object (same as GET /user/me)

**Errors:** 422 (validation)

---

### POST /user/intent [AUTH]
Save onboarding intent tags.

**Request:**
```json
{
  "intents": ["wedding", "festival"]
}
```

**Response 200:**
```json
{ "success": true, "intents": ["wedding", "festival"] }
```

---

### POST /user/push-token [AUTH]
Register device push token.

**Request:**
```json
{
  "token": "fcm_token_here",
  "platform": "android"
}
```

**Response 200:**
```json
{ "success": true }
```

---

### GET /user/milestones/uncelebrated [AUTH]
Get milestones reached but not yet shown in app.

**Response 200:**
```json
{
  "milestones": [
    {
      "id": "ms_abc",
      "type": "gold_25g",
      "reached_at": "2025-10-14T18:00:00Z",
      "grams_display": "25g"
    }
  ]
}
```

---

### POST /user/milestones/{id}/celebrate [AUTH]
Mark milestone as celebrated (shown).

**Response 200:**
```json
{ "success": true }
```

---

## KYC ENDPOINTS

---

### GET /kyc/status [AUTH]
Get KYC status for current user.

**Response 200:**
```json
{
  "kyc_status": "in_review",
  "aadhaar_verified": true,
  "pan_verified": true,
  "selfie_verified": false,
  "submitted_at": "2025-10-14T10:00:00Z",
  "rejection_reason": null
}
```

---

### POST /kyc/aadhaar/send-otp [AUTH]
Trigger Aadhaar OTP.

**Request:**
```json
{
  "aadhaar_number": "123456789012"
}
```

**Response 200:**
```json
{
  "session_id": "kyc_ses_abc",
  "expires_in_seconds": 300
}
```

**Errors:** 422 (invalid Aadhaar), 400 (Aadhaar not linked to mobile)

---

### POST /kyc/aadhaar/verify [AUTH]
Verify Aadhaar OTP.

**Request:**
```json
{
  "session_id": "kyc_ses_abc",
  "otp": "483920"
}
```

**Response 200:**
```json
{
  "verified": true,
  "name_on_aadhaar": "PRIYA MENON"
}
```

---

### POST /kyc/pan/verify [AUTH]
Verify PAN number.

**Request:**
```json
{
  "pan_number": "ABCDE1234F"
}
```

**Response 200:**
```json
{
  "verified": true,
  "name_on_pan": "PRIYA MENON",
  "pan_type": "individual"
}
```

**Errors:** 400 (PAN not found), 400 (name mismatch)

---

### POST /kyc/selfie [AUTH]
Upload selfie for face verification.
Content-Type: `multipart/form-data`

**Request:** field `selfie` (image/jpeg, max 5MB)

**Response 200:**
```json
{
  "uploaded": true,
  "face_detected": true
}
```

**Errors:** 400 (no face detected), 413 (file too large)

---

### POST /kyc/submit [AUTH]
Submit KYC for review.

**Response 200:**
```json
{
  "kyc_status": "in_review",
  "estimated_completion": "30 minutes"
}
```

**Errors:** 400 (incomplete — missing required documents)

---

## GOLD RATE ENDPOINTS

---

### GET /gold-rate
Get current gold rates. No auth required.

**Response 200:**
```json
{
  "rates": {
    "22k": {
      "rate_per_gram_paise": 624000,
      "rate_display": "₹6,240/g",
      "updated_at": "2025-10-15T09:30:00Z",
      "change_pct_today": 0.4,
      "change_pct_30d": 3.2
    },
    "18k": {
      "rate_per_gram_paise": 510000,
      "rate_display": "₹5,100/g",
      "updated_at": "2025-10-15T09:30:00Z"
    },
    "24k": {
      "rate_per_gram_paise": 680000,
      "rate_display": "₹6,800/g",
      "updated_at": "2025-10-15T09:30:00Z"
    }
  }
}
```

---

### GET /gold-rate/history
Get 90-day gold rate history for sparkline.

**Query params:** `?purity=22k&days=90`

**Response 200:**
```json
{
  "purity": "22k",
  "history": [
    { "date": "2025-07-16", "rate_paise": 608000 },
    { "date": "2025-07-17", "rate_paise": 610000 }
  ]
}
```

---

### GET /gold-rate/insight [OPTIONAL_AUTH]
Get personalised gold rate insight (Aura ambient banner).

**Response 200:**
```json
{
  "insight_text": "Your reserve grew ₹742 this month as gold rates climbed.",
  "insight_type": "rate",
  "link_route": "/aura/gold-insights",
  "personalised": true
}
```

When no auth / no balance, returns generic insight.

---

## PRODUCT ENDPOINTS

---

### GET /products [OPTIONAL_AUTH]
List products with filtering and pagination.

**Query params:**
```
category_id:    UUID
collection_id:  UUID
occasion_id:    UUID
purity:         22k | 18k | 24k
min_price:      integer (paise)
max_price:      integer (paise)
min_weight:     decimal
max_weight:     decimal
sort:           newest | price_asc | price_desc | most_loved | weight_asc
search:         string
is_featured:    boolean
cursor:         string
limit:          integer (default 20, max 50)
```

**Response 200:**
```json
{
  "data": [
    {
      "id": "prod_abc",
      "sku": "MGD-NK-001",
      "name": "Lakshmi Kada — Temple Bangle Pair",
      "category": {
        "id": "cat_bangles",
        "name": "Bangles & Kadas"
      },
      "purity": "22k",
      "purity_display": "22K (916)",
      "weight_grams": "13.6000",
      "weight_display": "13.6g",
      "price": {
        "total_paise": 84966000,
        "total_display": "₹84,966",
        "gold_value_paise": 84864000,
        "making_charge_paise": 10183680,
        "gst_paise": 2854901,
        "rate_used_paise": 624000,
        "rate_display": "₹6,240/g"
      },
      "scheme_monthly": {
        "amount_paise": 236000,
        "amount_display": "₹2,360/mo",
        "months": 36
      },
      "primary_image": "https://cdn.moozhayil.com/products/prod_abc/main.jpg",
      "is_wishlisted": false,
      "is_in_vault": false,
      "stock_available": true,
      "has_ar": true,
      "badges": ["new"]
    }
  ],
  "next_cursor": "cursor_xyz",
  "has_more": true,
  "total_count": 148
}
```

---

### GET /products/{id} [OPTIONAL_AUTH]
Get single product detail.

**Response 200:**
```json
{
  "id": "prod_abc",
  "sku": "MGD-NK-001",
  "name": "Lakshmi Kada — Temple Bangle Pair",
  "description": "Full description text",
  "category": { "id": "cat_bangles", "name": "Bangles & Kadas", "slug": "bangles" },
  "collection": { "id": "col_temple", "name": "Temple Collection" },
  "purity": "22k",
  "purity_display": "22K (916)",
  "hallmark_number": "BIS-22K-0019432",
  "weight_grams": "13.6000",
  "making_charge_pct": "12.00",
  "wastage_pct": "0.00",
  "has_stones": false,
  "gst_pct": "3.00",
  "price": {
    "total_paise": 84966000,
    "total_display": "₹84,966",
    "gold_value_paise": 84864000,
    "gold_value_display": "₹84,864",
    "making_charge_paise": 10183680,
    "making_charge_display": "₹10,184",
    "gst_paise": 2854901,
    "gst_display": "₹2,855",
    "rate_used_paise": 624000,
    "rate_display": "₹6,240/g",
    "rate_updated_at": "2025-10-15T09:30:00Z"
  },
  "scheme_monthly": {
    "amount_paise": 236000,
    "amount_display": "₹2,360/mo",
    "months": 36
  },
  "images": [
    { "url": "...", "type": "white_background", "is_primary": true },
    { "url": "...", "type": "on_model" },
    { "url": "...", "type": "detail" },
    { "url": "...", "type": "lifestyle" }
  ],
  "ar_model_url": "https://cdn.moozhayil.com/ar/prod_abc.usdz",
  "has_ar": true,
  "stock_available": true,
  "stock_quantity": 3,
  "is_wishlisted": false,
  "is_in_vault": false,
  "affordability": {
    "user_balance_grams": "14.2000",
    "user_balance_paise": 88608000,
    "percent_accumulated": 14,
    "can_afford_now": false,
    "grams_needed": "13.6000",
    "grams_needed_display": "13.6g still to go"
  },
  "occasions": [
    { "id": "occ_wedding", "name": "Wedding" },
    { "id": "occ_festival", "name": "Festival" }
  ]
}
```

**Errors:** 404 (not found), 410 (product deleted/discontinued)

---

### GET /products/{id}/similar [OPTIONAL_AUTH]
Get similar products.

**Query params:** `?limit=5`

**Response 200:** Same structure as GET /products but `data` array only.

---

### GET /products/search [OPTIONAL_AUTH]
Full-text search with autocomplete.

**Query params:** `?q={query}&limit=10`

**Response 200:**
```json
{
  "query": "bridal necklace",
  "results": {
    "categories": [
      { "id": "cat_necklaces", "name": "Necklaces", "product_count": 48 }
    ],
    "collections": [
      { "id": "col_bridal", "name": "Bridal Kundan", "cover_image": "..." }
    ],
    "products": [
      { "id": "prod_x", "name": "...", "price": {}, "primary_image": "..." }
    ]
  }
}
```

---

## CATEGORY / COLLECTION / OCCASION ENDPOINTS

---

### GET /categories
Get category tree.

**Response 200:**
```json
{
  "categories": [
    {
      "id": "cat_necklaces",
      "name": "Necklaces",
      "slug": "necklaces",
      "icon_url": "...",
      "product_count": 48,
      "subcategories": []
    }
  ]
}
```

---

### GET /collections
Get active collections.

**Query params:** `?featured_only=true`

**Response 200:**
```json
{
  "collections": [
    {
      "id": "col_kerala_kasavu",
      "name": "Kerala Kasavu",
      "slug": "kerala-kasavu",
      "description": "...",
      "cover_image_url": "...",
      "piece_count": 14,
      "starting_price_display": "₹24,500"
    }
  ]
}
```

---

### GET /occasions
Get all active occasions.

**Response 200:**
```json
{
  "occasions": [
    {
      "id": "occ_wedding",
      "name": "Wedding",
      "slug": "wedding",
      "icon_url": "...",
      "bg_image_url": "..."
    }
  ]
}
```

---

## GOAL ENDPOINTS

---

### GET /goals [AUTH]
Get all goals for current user.

**Query params:** `?status=active` (active | completed | paused | all)

**Response 200:**
```json
{
  "goals": [
    {
      "id": "goal_abc",
      "name": "Anu's Wedding Bangles",
      "goal_type": "wedding",
      "status": "active",
      "target_product": {
        "id": "prod_abc",
        "name": "Lakshmi Kada",
        "primary_image": "..."
      },
      "target_grams": "13.6000",
      "target_amount_display": "₹84,966",
      "current_grams": "9.7920",
      "current_value_display": "₹61,102",
      "percent_complete": 72,
      "monthly_amount_display": "₹2,360/mo",
      "start_date": "2025-02-01",
      "next_contribution_date": "2025-11-01",
      "estimated_completion_date": "2026-03-01",
      "months_remaining": 5,
      "status_label": "On Track",
      "contribution_count": 8
    }
  ],
  "summary": {
    "total_grams": "37.4000",
    "total_grams_display": "37.4g",
    "total_value_display": "₹2,33,280",
    "active_count": 2,
    "monthly_total_display": "₹7,360/mo"
  }
}
```

---

### POST /goals [AUTH] [KYC_REQUIRED]
Create a new goal.

**Request:**
```json
{
  "goal_type": "wedding",
  "name": "Anu's Wedding Bangles",
  "target_product_id": "prod_abc",
  "monthly_amount_paise": 236000,
  "duration_months": 36,
  "payment_method_id": "pm_xyz",
  "start_date": "2025-11-01"
}
```

**Response 201:**
```json
{
  "goal": { /* full goal object */ },
  "first_contribution_scheduled": "2025-11-01"
}
```

**Errors:** 400 (GOAL_LIMIT_REACHED), 403 (KYC_REQUIRED), 422 (validation)

---

### GET /goals/{id} [AUTH]
Get single goal detail with full contribution history.

**Response 200:**
```json
{
  "goal": { /* full goal object */ },
  "contributions": [
    {
      "id": "con_abc",
      "amount_display": "₹2,360",
      "grams_credited_display": "0.38g",
      "contribution_month": "2025-10-01",
      "month_label": "October 2025",
      "status": "completed",
      "completed_at": "2025-10-01T10:00:00Z",
      "gold_rate_display": "₹6,240/g",
      "running_total_grams": "9.7920"
    }
  ],
  "redeemable_products": [
    { /* ProductCard data for products ≤ current balance */ }
  ]
}
```

---

### PATCH /goals/{id} [AUTH]
Update goal (pause, resume, rename).

**Request:**
```json
{
  "status": "paused",
  "name": "Updated Goal Name"
}
```

**Response 200:** Updated goal object.

**Errors:** 400 (cannot modify completed goal)

---

### DELETE /goals/{id} [AUTH]
Cancel a goal.

**Response 200:**
```json
{
  "success": true,
  "gold_retained_grams": "9.7920",
  "message": "Your accumulated gold is retained in your balance."
}
```

---

### POST /goals/{id}/contribute [AUTH]
Make a one-time manual contribution.

**Request:**
```json
{
  "amount_paise": 472000,
  "payment_method_id": "pm_xyz"
}
```

**Response 200:**
```json
{
  "contribution": { /* contribution object */ },
  "new_balance_grams": "10.1720",
  "milestone_reached": {
    "type": "gold_10g",
    "grams_display": "10g"
  }
}
```

**Errors:** 400 (PAYMENT_FAILED), 422 (amount below minimum)

---

## GOLD BALANCE ENDPOINTS

---

### GET /gold-balance [AUTH]
Get current gold balance summary.

**Response 200:**
```json
{
  "total_grams": "37.4000",
  "total_grams_display": "37.4g",
  "total_value_paise": 23328000,
  "total_value_display": "₹2,33,280",
  "rate_used": {
    "purity": "22k",
    "rate_paise": 624000,
    "rate_display": "₹6,240/g",
    "updated_at": "2025-10-15T09:30:00Z",
    "change_pct_30d": 3.2,
    "personal_gain_paise": 74200,
    "personal_gain_display": "₹742"
  },
  "by_goal": [
    {
      "goal_id": "goal_abc",
      "goal_name": "Anu's Wedding Bangles",
      "grams": "9.7920"
    }
  ]
}
```

---

### GET /gold-balance/ledger [AUTH]
Full contribution ledger, all goals combined.

**Query params:** `?cursor=&limit=20&goal_id=` (optional goal filter)

**Response 200:**
```json
{
  "data": [
    {
      "id": "con_abc",
      "goal_id": "goal_abc",
      "goal_name": "Anu's Wedding Bangles",
      "month_label": "October 2025",
      "amount_display": "₹2,360",
      "grams_credited_display": "0.38g",
      "running_total_grams_display": "37.4g",
      "type": "autopay",
      "completed_at": "2025-10-01T10:00:00Z"
    }
  ],
  "next_cursor": "...",
  "has_more": false
}
```

---

### GET /gold-balance/redeemable-products [AUTH]
Products user can afford with current gold balance.

**Query params:** `?limit=6&cursor=`

**Response 200:** Same as GET /products with affordability context.

---

## DREAM VAULT ENDPOINTS

---

### GET /vault [AUTH]
Get all Dream Vault items.

**Response 200:**
```json
{
  "items": [
    {
      "id": "vault_abc",
      "product": { /* product object with current price */ },
      "goal": {
        "id": "goal_abc",
        "name": "...",
        "percent_complete": 72
      },
      "affordability": {
        "can_afford_now": false,
        "percent_complete": 14,
        "grams_needed_display": "13.6g",
        "suggested_monthly_display": "₹2,360/mo",
        "months_to_afford": 8
      },
      "added_at": "2025-09-15T10:00:00Z"
    }
  ],
  "count": 4
}
```

---

### POST /vault [AUTH]
Add item to Dream Vault.

**Request:**
```json
{
  "product_id": "prod_abc"
}
```

**Response 201:**
```json
{
  "vault_item": { /* vault item object */ },
  "goal_suggestion": {
    "suggested_monthly_paise": 236000,
    "suggested_monthly_display": "₹2,360/mo",
    "months_to_complete": 36,
    "completion_date_display": "March 2029"
  }
}
```

**Errors:** 409 (already in vault), 404 (product not found)

---

### DELETE /vault/{itemId} [AUTH]
Remove item from vault.

**Response 200:**
```json
{ "success": true }
```

---

## ORDER ENDPOINTS

---

### GET /orders [AUTH]
List orders.

**Query params:** `?status=&cursor=&limit=`

**Response 200:**
```json
{
  "data": [
    {
      "id": "ord_abc",
      "order_number": "MGD-2025-00123",
      "status": "delivered",
      "status_display": "Delivered",
      "total_display": "₹84,966",
      "items": [
        {
          "product_name": "Lakshmi Kada",
          "product_image": "...",
          "quantity": 1
        }
      ],
      "payment_method": "gold_balance",
      "ordered_at": "2025-10-10T14:00:00Z",
      "delivered_at": "2025-10-13T11:00:00Z"
    }
  ],
  "next_cursor": null,
  "has_more": false
}
```

---

### GET /orders/{id} [AUTH]
Get order detail with tracking.

**Response 200:**
```json
{
  "order": {
    "id": "ord_abc",
    "order_number": "MGD-2025-00123",
    "status": "shipped",
    "items": [ /* full product snapshots */ ],
    "delivery_address": { /* address snapshot */ },
    "payment_breakdown": {
      "gold_used_grams_display": "13.6g",
      "gold_value_display": "₹84,864",
      "additional_paid_display": "₹102",
      "total_display": "₹84,966"
    },
    "tracking": {
      "carrier": "Bluedart",
      "tracking_number": "BDT123456",
      "tracking_url": "https://...",
      "events": [
        {
          "status": "Picked up",
          "location": "Thrissur Hub",
          "timestamp": "2025-10-11T09:00:00Z"
        }
      ]
    }
  }
}
```

---

### POST /orders [AUTH] [KYC_REQUIRED]
Create an order (checkout).

**Request:**
```json
{
  "items": [
    { "product_id": "prod_abc", "quantity": 1 }
  ],
  "delivery_address_id": "addr_xyz",
  "payment_method": "gold_balance",
  "payment_method_id": null,
  "use_gold_balance_grams": "13.6000",
  "idempotency_key": "client_generated_uuid"
}
```

**Response 201:**
```json
{
  "order": { /* order object */ },
  "payment_required": false,
  "payment_url": null
}
```

**Response 201 (partial payment):**
```json
{
  "order": { /* order object, status: pending_payment */ },
  "payment_required": true,
  "payment_amount_paise": 10200,
  "payment_url": "upi://...",
  "payment_session_id": "pay_xyz"
}
```

**Errors:** 400 (OUT_OF_STOCK), 400 (INSUFFICIENT_BALANCE), 403 (KYC_REQUIRED)

---

### POST /orders/{id}/payment-callback
Handle payment gateway webhook (server-to-server).

Not called by client directly. Included for backend completeness.

---

## CART ENDPOINTS

---

### GET /cart [AUTH]
Get cart contents with current prices.

**Response 200:**
```json
{
  "items": [
    {
      "id": "cart_abc",
      "product": { /* product with current price */ },
      "quantity": 1
    }
  ],
  "subtotal_display": "₹84,966",
  "item_count": 1
}
```

---

### POST /cart/items [AUTH]
Add to cart.

**Request:**
```json
{
  "product_id": "prod_abc",
  "quantity": 1
}
```

**Response 201:** Updated cart object.
**Errors:** 409 (already in cart), 400 (OUT_OF_STOCK)

---

### DELETE /cart/items/{productId} [AUTH]
Remove from cart.

**Response 200:** Updated cart object.

---

### DELETE /cart [AUTH]
Clear entire cart.

**Response 200:**
```json
{ "success": true }
```

---

## AURA ENDPOINTS

---

### POST /aura/insight [AUTH]
Get personalised home screen Aura insight.

**Request:** empty body (uses user context from token)

**Response 200:**
```json
{
  "insight_text": "You're 3.2g away from your wedding goal. Gold eased 1.4% today.",
  "insight_type": "goal",
  "link_route": "/aura/goal-planning",
  "data": {
    "goal_name": "Anu's Wedding Bangles",
    "grams_remaining": "3.2000",
    "rate_change_pct": -1.4
  }
}
```

---

### POST /aura/plan [AUTH]
Generate a goal plan from Aura planning flow.

**Request:**
```json
{
  "occasion": "wedding",
  "target_date": "2027-03-01",
  "budget_paise": 25000000
}
```

**Response 200:**
```json
{
  "plan": {
    "monthly_amount_paise": 450000,
    "monthly_amount_display": "₹4,500/mo",
    "months": 18,
    "estimated_grams": "24.6000",
    "estimated_grams_display": "24.6g",
    "narrative": "Starting ₹4,500 monthly today gives you approximately 24.6g by March 2027 — enough for a complete bridal set."
  },
  "recommended_products": [
    { /* product objects */ }
  ]
}
```

---

### POST /aura/discover [AUTH]
Get product recommendations from discovery flow.

**Request:**
```json
{
  "for_person": "self",
  "occasion": "anniversary",
  "budget_paise": 5000000
}
```

**Response 200:**
```json
{
  "recommendations": [
    {
      "product": { /* product object */ },
      "reason": "A classic Kerala piece, meaningful for anniversaries."
    }
  ]
}
```

---

### POST /aura/sessions [AUTH]
Create a new Aura session.

**Request:**
```json
{
  "flow_type": "chat"
}
```

**Response 201:**
```json
{
  "session_id": "aura_ses_abc"
}
```

---

### POST /aura/sessions/{sessionId}/messages [AUTH]
Send a message to Aura and get response.

**Request:**
```json
{
  "message": "What should I buy for my wife's anniversary?",
  "context": {
    "current_goal_id": "goal_abc",
    "viewing_product_id": null
  }
}
```

**Response 200:**
```json
{
  "response": {
    "text": "For an anniversary, I'd suggest something personal and timeless...",
    "products": [ /* up to 3 product objects */ ],
    "action": {
      "type": "suggest_goal",
      "cta_label": "Start saving for this →",
      "route": "/goals/create"
    }
  },
  "session_id": "aura_ses_abc"
}
```

---

## ADDRESS ENDPOINTS

---

### GET /addresses [AUTH]
List saved addresses.

**Response 200:**
```json
{
  "addresses": [ /* address objects */ ]
}
```

---

### POST /addresses [AUTH]
Add address.

**Request:**
```json
{
  "label": "Home",
  "full_name": "Priya Menon",
  "phone": "+919876543210",
  "line1": "123 MG Road",
  "line2": "Near Temple",
  "city": "Thrissur",
  "state": "Kerala",
  "pincode": "680001"
}
```

**Response 201:** Address object.
**Errors:** 422 (validation), 400 (unserviceable pincode)

---

### PATCH /addresses/{id} [AUTH]
Update address.

**Response 200:** Updated address.

---

### DELETE /addresses/{id} [AUTH]
Remove address.

**Response 200:**
```json
{ "success": true }
```

---

### POST /addresses/validate-pincode
Check if pincode is serviceable.

**Request:**
```json
{ "pincode": "680001" }
```

**Response 200:**
```json
{
  "serviceable": true,
  "city": "Thrissur",
  "state": "Kerala",
  "estimated_delivery_days": 3
}
```

---

## NOTIFICATION ENDPOINTS

---

### GET /notifications [AUTH]
List notifications.

**Query params:** `?unread_only=false&cursor=&limit=20`

**Response 200:**
```json
{
  "data": [
    {
      "id": "notif_abc",
      "type": "contribution_success",
      "title": "Gold credited",
      "body": "0.38g added to your Wedding goal.",
      "is_read": false,
      "deep_link": "/goals/goal_abc",
      "created_at": "2025-10-01T10:05:00Z"
    }
  ],
  "unread_count": 3,
  "next_cursor": null,
  "has_more": false
}
```

---

### POST /notifications/{id}/read [AUTH]
Mark notification as read.

**Response 200:**
```json
{ "success": true }
```

---

### POST /notifications/read-all [AUTH]
Mark all notifications as read.

**Response 200:**
```json
{ "success": true, "marked_count": 3 }
```

---

## BANNER / CMS ENDPOINTS

---

### GET /banners
Get active banners for a placement.

**Query params:** `?placement=home_hero`

**Response 200:**
```json
{
  "banners": [
    {
      "id": "ban_abc",
      "image_url": "...",
      "cta_label": "Explore Collection",
      "cta_route": "/shop/collection/col_onam"
    }
  ]
}
```

---

## STORE ENDPOINTS

---

### GET /stores
Get all store locations.

**Query params:** `?lat=10.5&lng=76.2&radius_km=50` (optional proximity filter)

**Response 200:**
```json
{
  "stores": [
    {
      "id": "store_thrissur",
      "name": "Moozhayil Gold & Diamonds, Thrissur",
      "address": "Round North, Thrissur, Kerala 680001",
      "phone": "+914872123456",
      "latitude": 10.5276,
      "longitude": 76.2144,
      "opening_hours": {
        "mon": "10:00-19:00",
        "tue": "10:00-19:00",
        "sun": "closed"
      },
      "is_open_now": true,
      "distance_km": 1.2
    }
  ]
}
```

---

## REFERRAL ENDPOINTS

---

### GET /referrals/my-code [AUTH]
Get user's referral code.

**Response 200:**
```json
{
  "referral_code": "PRIYA2025",
  "share_url": "https://moozhayil.com/r/PRIYA2025",
  "reward_description": "Both you and your friend get ₹500 in gold credit",
  "successful_referrals": 2,
  "pending_referrals": 1
}
```

---

### POST /referrals/apply [AUTH]
Apply a referral code (new user only).

**Request:**
```json
{ "referral_code": "PRIYA2025" }
```

**Response 200:**
```json
{
  "success": true,
  "reward": "₹500 gold credit will be applied on your first goal enrollment."
}
```

**Errors:** 400 (invalid code), 400 (already used a code), 400 (own code)

---

## WEBHOOK ENDPOINTS (Server-to-Server)

These are not called by the mobile client.

### POST /webhooks/payment
Receive payment gateway callbacks.

### POST /webhooks/kyc
Receive KYC verification results from provider.

### POST /webhooks/gold-rate
Receive gold rate updates from rate provider.

---

## RATE LIMITS

| Endpoint group | Limit |
|---|---|
| /auth/send-otp | 3 per phone per 10 minutes |
| /auth/verify-otp | 5 attempts per session |
| /aura/sessions/{id}/messages | 30 messages per hour |
| All other endpoints | 100 requests per minute per user |
| Unauthenticated endpoints | 20 requests per minute per IP |

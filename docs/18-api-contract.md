# 18 - API Contract
## Moozhayil Gold & Diamonds - API Bible

This document is the authoritative API contract for v1.

Base URL: `https://api.moozhayil.com/v1`

No implementation code is defined here.

---

## 1. Global Contract

### 1.1 Protocol

- Transport: HTTPS only.
- Format: JSON.
- Charset: UTF-8.
- Time: ISO 8601 UTC.
- Auth: `Authorization: Bearer {access_token}`.
- API version: path version `/v1`.

### 1.2 Authentication Rules

Endpoint markers:
- `PUBLIC`: No token accepted or required.
- `OPTIONAL_AUTH`: Token may personalize response.
- `AUTH`: Valid access token required.
- `KYC_BASIC`: `basic_verified` or `enhanced_verified` required.
- `KYC_ENHANCED`: `enhanced_verified` required.
- `ADMIN`: Admin token and role required.
- `WEBHOOK`: Provider signature required.

Access token:
- Lifetime: 1 hour.
- Claims: `user_id`, `session_id`, `kyc_status`.
- Must not include phone, Aadhaar, PAN, address, payment data, or raw roles beyond required coarse claims.

Refresh token:
- Stored by client in secure storage.
- Stored by backend only as hash in `auth_sessions`.

### 1.3 Response Envelope

Single-resource endpoints return the resource object directly.

List endpoints return:

```json
{
  "data": [],
  "next_cursor": "cur_01J9Y7W6Q2",
  "has_more": true
}
```

Action endpoints return:

```json
{
  "success": true
}
```

### 1.4 Error Format

```json
{
  "error": {
    "code": "INSUFFICIENT_BALANCE",
    "message": "Gold balance is insufficient for this purchase",
    "details": {
      "required_paise": 8496600,
      "available_paise": 6230000
    },
    "request_id": "req_01J9Y7W6Q2"
  }
}
```

### 1.5 Standard Error Codes

| Code | HTTP | Meaning |
|---|---:|---|
| `BAD_REQUEST` | 400 | Request cannot be processed |
| `UNAUTHORIZED` | 401 | Missing or invalid token |
| `FORBIDDEN` | 403 | Authenticated but not allowed |
| `KYC_REQUIRED` | 403 | Basic KYC required |
| `ENHANCED_KYC_REQUIRED` | 403 | Enhanced KYC required |
| `NOT_FOUND` | 404 | Resource does not exist |
| `CONFLICT` | 409 | Duplicate or state conflict |
| `PRICE_CHANGED` | 409 | Transaction price changed |
| `OUT_OF_STOCK` | 409 | Product unavailable |
| `UNPROCESSABLE` | 422 | Validation error |
| `RATE_LIMITED` | 429 | Too many requests |
| `SERVER_ERROR` | 500 | Unexpected server error |
| `PROVIDER_UNAVAILABLE` | 503 | Third-party provider unavailable |

### 1.6 Money and Gold

Money:
- All request and response money fields use integer paise.
- Display strings are convenience fields only.

Gold:
- API gold values are decimal strings with 4 places.
- Display strings use 1 decimal place floored.

Example:

```json
{
  "amount_paise": 8496600,
  "amount_display": "₹84,966",
  "grams": "37.4892",
  "grams_display": "37.4g"
}
```

### 1.7 Pagination

Query:
- `cursor`: opaque string.
- `limit`: default `20`, max `50`.

Rules:
- Cursor is opaque.
- Clients must not parse cursors.
- Missing cursor means first page.

### 1.8 Sorting

Only documented sort values are accepted.

Unknown sort values return `422`.

### 1.9 Filtering

Unknown filter fields return `422`.

Filter values are validated by type and enum.

### 1.10 Idempotency

Required header:

`Idempotency-Key: {uuid}`

Required on:
- `POST /goals`
- `POST /goals/:id/contribute`
- `POST /orders`
- `POST /admin/orders/:id/refund`

Rules:
- Same key and same request returns original response.
- Same key and different request returns `409 IDEMPOTENCY_CONFLICT`.

### 1.11 Rate Limits

| Scope | Limit |
|---|---:|
| `POST /auth/send-otp` | 3 per phone per 10 minutes |
| `POST /auth/verify-otp` | 5 attempts per OTP session |
| Aura chat messages | 30 per user per hour |
| Authenticated API | 100 per user per minute |
| Public API | 20 per IP per minute |
| Admin sensitive actions | 20 per admin per minute |

### 1.12 Versioning

Rules:
- `/v1` is backward-compatible for released clients.
- Fields are not removed or type-changed.
- New fields are optional from client perspective.
- Breaking changes require `/v2`.
- Deprecation window is at least two supported app releases.

---

## 2. DTOs

### 2.1 User DTO

```json
{
  "id": "8b5f4ac8-5fd3-4b62-8f42-d2fb91f23e3b",
  "name": "Priya Menon",
  "phone": "+919876543210",
  "email": "priya@example.com",
  "city": "Thrissur",
  "kyc_status": "basic_verified",
  "kyc_display": "Verified Member",
  "member_since": "2026-01-10",
  "intent_tags": ["wedding", "investment"],
  "active_goals_count": 2
}
```

### 2.2 Product DTO

```json
{
  "id": "prod_01J9Y7",
  "sku": "MGD-NK-001",
  "name": "Lakshmi Kada Temple Bangle Pair",
  "category": { "id": "cat_bangles", "name": "Bangles & Kadas", "slug": "bangles-kadas" },
  "collection": { "id": "col_temple", "name": "Temple Collection", "slug": "temple" },
  "purity": "22k",
  "purity_display": "22K (916)",
  "weight_grams": "13.6000",
  "weight_display": "13.6g",
  "price": {
    "total_paise": 9789911,
    "total_display": "₹97,899",
    "gold_value_paise": 8486400,
    "gold_value_display": "₹84,864",
    "making_charge_paise": 1018368,
    "making_charge_display": "₹10,184",
    "wastage_paise": 0,
    "gst_paise": 285143,
    "gst_display": "₹2,851",
    "rate_used_paise": 624000,
    "rate_display": "₹6,240/g",
    "rate_updated_at": "2026-06-26T04:30:00Z",
    "price_valid_until": "2026-06-26T04:45:00Z"
  },
  "scheme_monthly": {
    "amount_paise": 300000,
    "amount_display": "₹3,000/mo",
    "months": 36
  },
  "primary_image": "https://cdn.moozhayil.com/products/prod_01J9Y7/main.jpg",
  "is_in_vault": false,
  "stock_available": true,
  "stock_label": "Only 3 left",
  "has_ar": true,
  "badges": ["new"]
}
```

### 2.3 Goal DTO

```json
{
  "id": "goal_01J9Y7",
  "name": "Anu's Wedding Bangles",
  "goal_type": "wedding",
  "status": "active",
  "status_label": "On Track",
  "target_product": {
    "id": "prod_01J9Y7",
    "name": "Lakshmi Kada Temple Bangle Pair",
    "primary_image": "https://cdn.moozhayil.com/products/prod_01J9Y7/main.jpg"
  },
  "target_amount_paise": 9789911,
  "target_amount_display": "₹97,899",
  "target_grams": "13.6000",
  "current_grams": "9.7920",
  "current_grams_display": "9.7g",
  "current_value_paise": 7052393,
  "current_value_display": "₹70,524",
  "percent_complete": 72,
  "monthly_amount_paise": 300000,
  "monthly_amount_display": "₹3,000/mo",
  "duration_months": 36,
  "start_date": "2026-07-01",
  "next_contribution_date": "2026-08-01",
  "estimated_completion_date": "2029-06-01",
  "months_remaining": 35
}
```

### 2.4 Order DTO

```json
{
  "id": "ord_01J9Y7",
  "order_number": "MGD-2026-00123",
  "status": "confirmed",
  "status_display": "Confirmed",
  "total_paise": 9789911,
  "total_display": "₹97,899",
  "payment_method": "gold_balance",
  "items": [
    {
      "product_id": "prod_01J9Y7",
      "product_name": "Lakshmi Kada Temple Bangle Pair",
      "product_image": "https://cdn.moozhayil.com/products/prod_01J9Y7/main.jpg",
      "quantity": 1,
      "unit_price_paise": 9789911,
      "unit_price_display": "₹97,899"
    }
  ],
  "ordered_at": "2026-06-26T05:10:00Z"
}
```

---

## 3. Auth Endpoints

### POST `/auth/send-otp` `PUBLIC`

Request:

```json
{
  "phone": "+919876543210"
}
```

Validation:
- `phone` required, E.164 India format.

Response `200`:

```json
{
  "otp_session_id": "otp_01J9Y7",
  "expires_in_seconds": 300,
  "resend_allowed_after_seconds": 30
}
```

Errors: `422`, `429`, `503`.

### POST `/auth/verify-otp` `PUBLIC`

Request:

```json
{
  "otp_session_id": "otp_01J9Y7",
  "otp": "483920"
}
```

Response `200`:

```json
{
  "access_token": "eyJ...",
  "refresh_token": "refresh_token_value",
  "expires_in": 3600,
  "user": {
    "id": "usr_01J9Y7",
    "phone": "+919876543210",
    "name": null,
    "kyc_status": "not_started",
    "is_new_user": true
  }
}
```

Errors: `400`, `401`, `429`.

### POST `/auth/refresh` `PUBLIC`

Request:

```json
{
  "refresh_token": "refresh_token_value"
}
```

Response `200`:

```json
{
  "access_token": "eyJ...",
  "expires_in": 3600
}
```

Errors: `401`.

### POST `/auth/logout` `AUTH`

Request: `{}`.

Response `200`:

```json
{ "success": true }
```

---

## 4. User Endpoints

### GET `/user/me` `AUTH`

Response `200`: User DTO plus gold summary.

### PATCH `/user/me` `AUTH`

Request:

```json
{
  "name": "Priya Menon",
  "email": "priya@example.com",
  "city": "Thrissur"
}
```

Validation:
- `name`: 2-100 chars.
- `email`: valid email or null.
- `city`: max 100 chars.

Response `200`: User DTO.

### POST `/user/intent` `AUTH`

Request:

```json
{
  "intents": ["wedding", "festival"]
}
```

Response `200`:

```json
{
  "success": true,
  "intents": ["wedding", "festival"]
}
```

### POST `/user/devices` `AUTH`

Request:

```json
{
  "push_token": "fcm_token_here",
  "platform": "android",
  "device_fingerprint": "dfp_01J9",
  "app_version": "1.0.0"
}
```

Response `200`:

```json
{
  "device_id": "dev_01J9Y7",
  "success": true
}
```

### DELETE `/user/devices/:deviceId` `AUTH`

Response `200`: `{ "success": true }`

### GET `/user/milestones/uncelebrated` `AUTH`

Response `200`:

```json
{
  "milestones": [
    {
      "id": "ms_01J9Y7",
      "type": "gold_10g",
      "reached_at": "2026-06-26T04:30:00Z",
      "grams_display": "10.0g"
    }
  ]
}
```

### POST `/user/milestones/:id/celebrate` `AUTH`

Response `200`: `{ "success": true }`

---

## 5. KYC Endpoints

### GET `/kyc/status` `AUTH`

Response `200`:

```json
{
  "kyc_status": "in_review",
  "aadhaar_verified": true,
  "pan_verified": true,
  "selfie_verified": false,
  "submitted_at": "2026-06-26T04:30:00Z",
  "rejection_reason": null,
  "resubmission_allowed_at": null
}
```

### POST `/kyc/aadhaar/send-otp` `AUTH`

Request:

```json
{
  "aadhaar_number": "123456789012"
}
```

Response `200`:

```json
{
  "session_id": "kyc_otp_01J9Y7",
  "expires_in_seconds": 300
}
```

Security: Aadhaar is encrypted and never logged.

### POST `/kyc/aadhaar/verify` `AUTH`

Request:

```json
{
  "session_id": "kyc_otp_01J9Y7",
  "otp": "483920"
}
```

Response `200`:

```json
{
  "verified": true,
  "name_on_aadhaar_masked": "PRIYA M****"
}
```

### POST `/kyc/pan/verify` `AUTH`

Request:

```json
{
  "pan_number": "ABCDE1234F"
}
```

Response `200`:

```json
{
  "verified": true,
  "name_on_pan_masked": "PRIYA M****",
  "pan_type": "individual"
}
```

### POST `/kyc/selfie` `AUTH`

Content-Type: `multipart/form-data`.

Field:
- `selfie`: JPEG/PNG, max 5MB.

Response `200`:

```json
{
  "uploaded": true,
  "face_detected": true
}
```

### POST `/kyc/submit` `AUTH`

Request: `{}`.

Response `200`:

```json
{
  "kyc_status": "in_review",
  "estimated_completion": "30 minutes"
}
```

---

## 6. Gold Rate Endpoints

### GET `/gold-rate` `PUBLIC`

Response `200`:

```json
{
  "rates": {
    "22k": {
      "rate_per_gram_paise": 624000,
      "rate_display": "₹6,240/g",
      "updated_at": "2026-06-26T04:30:00Z",
      "change_pct_today": 0.4,
      "change_pct_30d": 3.2,
      "is_stale": false
    }
  }
}
```

### GET `/gold-rate/history` `PUBLIC`

Query:
- `purity`: `14k`, `18k`, `22k`, `24k`; default `22k`.
- `days`: `30`, `60`, `90`; default `90`.

Response `200`:

```json
{
  "purity": "22k",
  "history": [
    { "date": "2026-06-25", "rate_paise": 624000 }
  ]
}
```

### GET `/gold-rate/insight` `OPTIONAL_AUTH`

Response `200`:

```json
{
  "insight_text": "Gold eased 0.4% today. Your reserve is valued at ₹2,33,280.",
  "insight_type": "rate",
  "link_route": "/aura/gold-insights",
  "personalised": true
}
```

---

## 7. Product and Catalog Endpoints

### GET `/products` `OPTIONAL_AUTH`

Query:
- `category_id`: UUID.
- `collection_id`: UUID.
- `occasion_id`: UUID.
- `purity`: purity enum.
- `min_price_paise`: integer.
- `max_price_paise`: integer.
- `min_weight_grams`: decimal string.
- `max_weight_grams`: decimal string.
- `sort`: `newest`, `price_asc`, `price_desc`, `most_loved`, `weight_asc`.
- `search`: string.
- `is_featured`: boolean.
- `cursor`, `limit`.

Response `200`: paginated Product DTOs.

### GET `/products/:id` `OPTIONAL_AUTH`

Response `200`: Product detail DTO with images, specs, price breakdown, affordability, occasions, and `price_valid_until`.

Errors: `404`, `410`.

### GET `/products/:id/similar` `OPTIONAL_AUTH`

Query:
- `limit`: default 5, max 10.

Response `200`: Product DTO array.

### GET `/products/search` `OPTIONAL_AUTH`

Query:
- `q`: string, 2-80 chars.
- `limit`: default 10, max 20.

Response `200`:

```json
{
  "query": "bridal necklace",
  "results": {
    "categories": [{ "id": "cat_necklaces", "name": "Necklaces", "product_count": 48 }],
    "collections": [{ "id": "col_bridal", "name": "Bridal Kundan", "cover_image": "https://cdn.moozhayil.com/c.jpg" }],
    "products": []
  }
}
```

### GET `/categories` `PUBLIC`

Response `200`: `{ "categories": [] }`

### GET `/collections` `PUBLIC`

Query:
- `featured_only`: boolean.

Response `200`: `{ "collections": [] }`

### GET `/occasions` `PUBLIC`

Response `200`: `{ "occasions": [] }`

---

## 8. Dream Vault Endpoints

### GET `/vault` `AUTH`

Response `200`:

```json
{
  "items": [
    {
      "id": "vault_01J9Y7",
      "product": {},
      "goal": null,
      "affordability": {
        "can_afford_now": false,
        "percent_complete": 14,
        "grams_needed_display": "13.6g",
        "suggested_monthly_paise": 236000,
        "suggested_monthly_display": "₹2,360/mo",
        "months_to_afford": 36
      },
      "added_at": "2026-06-26T04:30:00Z"
    }
  ],
  "count": 1
}
```

### POST `/vault` `AUTH`

Request:

```json
{ "product_id": "prod_01J9Y7" }
```

Response `201`:

```json
{
  "vault_item": {},
  "goal_suggestion": {
    "suggested_monthly_paise": 236000,
    "suggested_monthly_display": "₹2,360/mo",
    "months_to_complete": 36,
    "completion_date_display": "June 2029"
  }
}
```

Errors: `404`, `409`.

### DELETE `/vault/:itemId` `AUTH`

Response `200`: `{ "success": true }`

---

## 9. Goal and Contribution Endpoints

### GET `/goals` `AUTH`

Query:
- `status`: `active`, `completed`, `paused`, `all`.

Response `200`:

```json
{
  "goals": [],
  "summary": {
    "total_grams": "37.4000",
    "total_grams_display": "37.4g",
    "total_value_paise": 23328000,
    "total_value_display": "₹2,33,280",
    "active_count": 2,
    "monthly_total_paise": 736000,
    "monthly_total_display": "₹7,360/mo"
  }
}
```

### POST `/goals` `AUTH` `KYC_BASIC`

Headers:
- `Idempotency-Key` required.

Request:

```json
{
  "goal_type": "wedding",
  "name": "Anu's Wedding Bangles",
  "target_product_id": "prod_01J9Y7",
  "monthly_amount_paise": 236000,
  "duration_months": 36,
  "payment_method_id": "pm_01J9Y7",
  "start_date": "2026-07-01"
}
```

Validation:
- Monthly amount min `100000`.
- Basic KYC max `5000000`.
- Enhanced KYC max `20000000`.
- Duration one of `12`, `18`, `24`, `36`.
- Max 5 active goals.

Response `201`:

```json
{
  "goal": {},
  "first_contribution_scheduled": "2026-07-01"
}
```

### GET `/goals/:id` `AUTH`

Response `200`: goal, contributions, redeemable products.

### PATCH `/goals/:id` `AUTH`

Request:

```json
{
  "name": "Updated Goal Name",
  "status": "paused"
}
```

Allowed status transitions follow `17-database-bible.md`.

Response `200`: Goal DTO.

### DELETE `/goals/:id` `AUTH`

Response `200`:

```json
{
  "success": true,
  "gold_retained_grams": "9.7920",
  "message": "Your accumulated gold is retained in your balance."
}
```

### POST `/goals/:id/contribute` `AUTH` `KYC_BASIC`

Headers:
- `Idempotency-Key` required.

Request:

```json
{
  "amount_paise": 472000,
  "payment_method_id": "pm_01J9Y7"
}
```

Response `200`:

```json
{
  "contribution": {
    "id": "con_01J9Y7",
    "status": "pending_payment",
    "amount_paise": 472000,
    "amount_display": "₹4,720"
  },
  "payment_required": true,
  "payment_session_id": "pay_01J9Y7"
}
```

### GET `/contributions/pending` `AUTH`

Response `200`:

```json
{
  "pending": [
    {
      "id": "con_01J9Y7",
      "goal_id": "goal_01J9Y7",
      "status": "processing",
      "created_at": "2026-06-26T04:30:00Z"
    }
  ]
}
```

---

## 10. Gold Balance Endpoints

### GET `/gold-balance` `AUTH`

Response `200`:

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
    "updated_at": "2026-06-26T04:30:00Z"
  }
}
```

### GET `/gold-balance/ledger` `AUTH`

Query:
- `cursor`, `limit`, `goal_id`.

Response `200`: paginated ledger rows derived from `gold_ledger_entries`.

### GET `/gold-balance/redeemable-products` `AUTH`

Query:
- `cursor`, `limit`.

Response `200`: paginated Product DTOs.

---

## 11. Cart and Address Endpoints

### GET `/cart` `AUTH`

Response `200`: cart with current prices.

### POST `/cart/items` `AUTH`

Request:

```json
{
  "product_id": "prod_01J9Y7",
  "quantity": 1
}
```

Response `201`: cart DTO.

### DELETE `/cart/items/:productId` `AUTH`

Response `200`: cart DTO.

### DELETE `/cart` `AUTH`

Response `200`: `{ "success": true }`

### GET `/addresses` `AUTH`

Response `200`: `{ "addresses": [] }`

### POST `/addresses` `AUTH`

Request:

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

Response `201`: address DTO.

### PATCH `/addresses/:id` `AUTH`

Response `200`: address DTO.

### DELETE `/addresses/:id` `AUTH`

Response `200`: `{ "success": true }`

### POST `/addresses/validate-pincode` `PUBLIC`

Request:

```json
{ "pincode": "680001" }
```

Response `200`:

```json
{
  "serviceable": true,
  "city": "Thrissur",
  "state": "Kerala",
  "estimated_delivery_days": 3,
  "pickup_available": true
}
```

---

## 12. Payment and Order Endpoints

### POST `/payments/upi/verify` `AUTH`

Request:

```json
{ "upi_id": "priya@upi" }
```

Response `200`:

```json
{
  "verified": true,
  "display_label": "UPI: priya@upi"
}
```

### POST `/payments/methods` `AUTH`

Request:

```json
{
  "type": "upi",
  "provider_token": "rzp_token_01J9Y7",
  "display_label": "UPI: priya@upi",
  "is_default": true
}
```

Response `201`: payment method DTO.

### GET `/payments/methods` `AUTH`

Response `200`: `{ "payment_methods": [] }`

### DELETE `/payments/methods/:id` `AUTH`

Response `200`: `{ "success": true }`

### POST `/payments/reconcile` `ADMIN`

Permission: `finance_manager` or `super_admin`.

Request:

```json
{ "payment_transaction_id": "ptx_01J9Y7" }
```

Response `202`:

```json
{
  "success": true,
  "job_id": "job_01J9Y7"
}
```

### GET `/orders` `AUTH`

Query:
- `status`, `cursor`, `limit`.

Response `200`: paginated Order DTOs.

### GET `/orders/:id` `AUTH`

Response `200`: full order detail, tracking, payment breakdown.

### POST `/orders` `AUTH`

Headers:
- `Idempotency-Key` required.

Request:

```json
{
  "items": [
    { "product_id": "prod_01J9Y7", "quantity": 1 }
  ],
  "delivery_address_id": "addr_01J9Y7",
  "payment_method": "gold_balance",
  "payment_method_id": null,
  "use_gold_balance_grams": "13.6000"
}
```

Response `201`:

```json
{
  "order": {},
  "payment_required": false,
  "payment_amount_paise": 0,
  "payment_session_id": null,
  "payment_url": null
}
```

Errors:
- `KYC_REQUIRED` if order > ₹50,000 or gold redemption.
- `ENHANCED_KYC_REQUIRED` if policy requires.
- `PRICE_CHANGED`.
- `OUT_OF_STOCK`.
- `INSUFFICIENT_BALANCE`.

### POST `/orders/:id/cancel` `AUTH`

Request:

```json
{ "reason": "Changed my mind" }
```

Response `200`:

```json
{
  "order": {},
  "refund_initiated": true
}
```

---

## 13. Notification Endpoints

### GET `/notifications` `AUTH`

Query:
- `unread_only`: boolean.
- `cursor`, `limit`.

Response `200`:

```json
{
  "data": [
    {
      "id": "notif_01J9Y7",
      "type": "contribution_success",
      "title": "Gold credited",
      "body": "0.3g added to your Wedding goal.",
      "is_read": false,
      "deep_link": "/goals/goal_01J9Y7",
      "created_at": "2026-06-26T04:30:00Z"
    }
  ],
  "unread_count": 3,
  "next_cursor": null,
  "has_more": false
}
```

### POST `/notifications/:id/read` `AUTH`

Response `200`: `{ "success": true }`

### POST `/notifications/read-all` `AUTH`

Response `200`:

```json
{ "success": true, "marked_count": 3 }
```

---

## 14. Aura Endpoints

### POST `/aura/insight` `AUTH`

Response `200`:

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

### POST `/aura/plan` `AUTH`

Request:

```json
{
  "occasion": "wedding",
  "target_date": "2027-03-01",
  "budget_paise": 25000000
}
```

Response `200`: structured plan and recommended Product DTOs.

### POST `/aura/discover` `AUTH`

Request:

```json
{
  "for_person": "self",
  "occasion": "anniversary",
  "budget_paise": 5000000
}
```

Response `200`: filtered recommendations.

### POST `/aura/sessions` `AUTH`

Request:

```json
{ "flow_type": "chat" }
```

Response `201`:

```json
{ "session_id": "aura_ses_01J9Y7" }
```

### POST `/aura/sessions/:sessionId/messages` `AUTH`

Request:

```json
{
  "message": "What should I buy for my wife's anniversary?",
  "context": {
    "current_goal_id": "goal_01J9Y7",
    "viewing_product_id": null
  }
}
```

Response `200`:

```json
{
  "response": {
    "text": "For an anniversary, I would suggest something personal and timeless.",
    "products": [],
    "action": {
      "type": "suggest_goal",
      "cta_label": "Start saving for this",
      "route": "/goals/create"
    }
  },
  "session_id": "aura_ses_01J9Y7"
}
```

Safety:
- No raw KYC, phone, address, or payment data is sent to Aura.
- Product outputs are post-filtered by backend.

---

## 15. CMS, Store, Referral Endpoints

### GET `/banners` `PUBLIC`

Query:
- `placement`: `home_hero`, `shop_top`, `goals_top`.

Response `200`: `{ "banners": [] }`

### GET `/stores` `PUBLIC`

Query:
- `lat`, `lng`, `radius_km`.

Response `200`: `{ "stores": [] }`

### GET `/referrals/my-code` `AUTH`

Response `200`:

```json
{
  "referral_code": "PRIYA2026",
  "share_url": "https://moozhayil.com/r/PRIYA2026",
  "reward_description": "Both you and your friend get ₹500 in gold credit",
  "successful_referrals": 2,
  "pending_referrals": 1
}
```

### POST `/referrals/apply` `AUTH`

Request:

```json
{ "referral_code": "PRIYA2026" }
```

Response `200`:

```json
{
  "success": true,
  "reward": "₹500 gold credit will be applied on your first goal enrollment."
}
```

---

## 16. Webhooks

All webhooks:
- Are `WEBHOOK`.
- Verify provider signature.
- Persist raw event in `webhook_events`.
- Acknowledge duplicates.
- Enqueue processing job.
- Return `200` after durable persistence.

### POST `/webhooks/payment`

Provider: Razorpay.

Headers:
- Provider signature header required.

Events:
- `payment.authorized`
- `payment.captured`
- `payment.failed`
- `refund.created`
- `refund.processed`
- `mandate.activated`
- `mandate.failed`

Response:

```json
{ "received": true }
```

### POST `/webhooks/kyc`

Provider: KYC provider.

Events:
- `aadhaar.verified`
- `pan.verified`
- `selfie.verified`
- `kyc.approved`
- `kyc.rejected`

Response:

```json
{ "received": true }
```

### POST `/webhooks/gold-rate`

Provider: gold rate provider.

Events:
- `rate.updated`
- `rate.corrected`

Response:

```json
{ "received": true }
```

---

## 17. Admin API Contract

Admin endpoints are under `/admin`.

Rules:
- `ADMIN` auth required.
- Least privilege role check required.
- Sensitive actions require step-up auth.
- Money, KYC, ledger, stock, refund, gold rate, and SAR actions audit logged.

Canonical admin endpoint groups:
- `GET/POST/PATCH /admin/products`
- `POST /admin/products/:id/images`
- `POST /admin/products/:id/publish`
- `GET/POST/PATCH /admin/categories`
- `GET/POST/PATCH /admin/collections`
- `GET/POST/PATCH /admin/occasions`
- `GET/POST/PATCH /admin/banners`
- `GET /admin/kyc/reviews`
- `POST /admin/kyc/:userId/approve`
- `POST /admin/kyc/:userId/reject`
- `GET /admin/orders`
- `PATCH /admin/orders/:id/status`
- `POST /admin/orders/:id/refund`
- `POST /admin/gold-rates/override`
- `GET /admin/audit-logs`
- `GET /admin/users/:id/support-summary`
- `POST /admin/ledger-adjustments`
- `POST /admin/ledger-adjustments/:id/approve`
- `POST /admin/sar-reviews/:id/decision`

---

## 18. Retry Policies

Client retry:
- GET endpoints may retry once after network failure.
- Mutating endpoints retry only with same idempotency key.
- Token refresh retries original request once.

Backend retry:
- Webhook processing retries with exponential backoff.
- Queue jobs move to dead letter after configured max attempts.
- Provider reconciliation runs for pending payment/refund/KYC states.

---

## 19. Deterministic Contract Decisions

- `/vault` is the API path; Dream Vault is the product name.
- `/dream-vault` is the Flutter route.
- Device push registration uses `/user/devices`.
- Payment callbacks are only `/webhooks/payment`.
- Manual contributions use `/goals/:id/contribute`.
- Autopay contributions are backend-owned jobs.
- Money examples in this document use correct paise math.
- `is_in_vault` replaces user-facing wishlist language.

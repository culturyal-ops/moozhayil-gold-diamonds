# 05 — Database Schema
## Moozhayil Gold & Diamonds — All Tables, Fields, and Relations

---

## CONVENTIONS

- All tables: snake_case
- All PKs: UUID v4
- Timestamps: created_at, updated_at on every table (excluded from field lists for brevity — assume present)
- Soft delete: deleted_at nullable timestamp (where noted)
- Monetary values: stored as INTEGER in paise (₹1 = 100 paise)
- Gold weight: stored as DECIMAL(10,4) in grams
- Percentages: stored as DECIMAL(5,2) (e.g., 12.50 for 12.5%)

---

## TABLE: users

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| phone | VARCHAR(15) | UNIQUE NOT NULL | E.164 format: +919876543210 |
| name | VARCHAR(100) | | Set during onboarding |
| email | VARCHAR(255) | UNIQUE NULLABLE | Optional |
| kyc_status | ENUM | NOT NULL | pending, in_review, verified, rejected |
| kyc_verified_at | TIMESTAMP | NULLABLE | |
| member_since | DATE | NOT NULL DEFAULT now() | |
| city | VARCHAR(100) | NULLABLE | |
| intent_tags | TEXT[] | NULLABLE | ["wedding","investment"] from onboarding |
| last_active_at | TIMESTAMP | | |
| push_token | VARCHAR(500) | NULLABLE | FCM/APNs token |
| deleted_at | TIMESTAMP | NULLABLE | Soft delete |

---

## TABLE: user_intents

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id | |
| intent_type | ENUM | NOT NULL | wedding, investment, festival, gift, family, other |
| selected_at | TIMESTAMP | NOT NULL | |
| is_active | BOOLEAN | DEFAULT true | |

---

## TABLE: kyc_documents

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id UNIQUE | One KYC record per user |
| aadhaar_number | VARCHAR(12) | NULLABLE | Encrypted at rest |
| aadhaar_verified | BOOLEAN | DEFAULT false | |
| pan_number | VARCHAR(10) | NULLABLE | Encrypted at rest |
| pan_verified | BOOLEAN | DEFAULT false | |
| selfie_url | VARCHAR(1000) | NULLABLE | S3 path |
| selfie_verified | BOOLEAN | DEFAULT false | |
| submitted_at | TIMESTAMP | NULLABLE | |
| reviewed_at | TIMESTAMP | NULLABLE | |
| rejection_reason | TEXT | NULLABLE | |
| reviewer_id | UUID | NULLABLE | FK admin_users.id |

---

## TABLE: addresses

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| label | VARCHAR(50) | | "Home", "Office" |
| full_name | VARCHAR(100) | NOT NULL | |
| phone | VARCHAR(15) | NOT NULL | |
| line1 | VARCHAR(255) | NOT NULL | |
| line2 | VARCHAR(255) | NULLABLE | |
| city | VARCHAR(100) | NOT NULL | |
| state | VARCHAR(100) | NOT NULL | |
| pincode | VARCHAR(6) | NOT NULL | |
| is_default | BOOLEAN | DEFAULT false | |
| deleted_at | TIMESTAMP | NULLABLE | |

---

## TABLE: payment_methods

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| type | ENUM | NOT NULL | upi, card, netbanking |
| display_label | VARCHAR(100) | NOT NULL | "UPI: user@bank" or "Visa ···4242" |
| provider_token | VARCHAR(500) | NOT NULL | Tokenized, never raw card data |
| is_default | BOOLEAN | DEFAULT false | |
| is_autopay_enabled | BOOLEAN | DEFAULT false | |
| deleted_at | TIMESTAMP | NULLABLE | |

---

## TABLE: gold_rate_history

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| purity | ENUM | NOT NULL | 22k, 18k, 24k |
| rate_per_gram_paise | INTEGER | NOT NULL | Rate × 100 |
| effective_from | TIMESTAMP | NOT NULL | |
| effective_to | TIMESTAMP | NULLABLE | NULL = currently active |
| source | VARCHAR(100) | | "MCX", "manual", "ibja" |

Index: (purity, effective_from DESC) — for fast "current rate" lookup.

---

## TABLE: goals

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| name | VARCHAR(255) | NOT NULL | User-defined or auto-generated |
| goal_type | ENUM | NOT NULL | wedding, investment, festival, gift, family, other |
| status | ENUM | NOT NULL DEFAULT active | active, paused, completed, cancelled |
| target_product_id | UUID | FK products.id NULLABLE | Dream piece (optional) |
| target_amount_paise | INTEGER | NULLABLE | From product price at enrollment time |
| target_grams | DECIMAL(10,4) | NULLABLE | Calculated at enrollment |
| monthly_amount_paise | INTEGER | NOT NULL | Contribution per month |
| duration_months | INTEGER | NOT NULL | Plan duration |
| start_date | DATE | NOT NULL | |
| next_contribution_date | DATE | NOT NULL | |
| completed_at | TIMESTAMP | NULLABLE | |
| paused_at | TIMESTAMP | NULLABLE | |
| aura_created | BOOLEAN | DEFAULT false | Created via Aura flow |
| deleted_at | TIMESTAMP | NULLABLE | |

---

## TABLE: contributions

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| goal_id | UUID | FK goals.id NOT NULL | |
| user_id | UUID | FK users.id NOT NULL | |
| amount_paise | INTEGER | NOT NULL | |
| gold_rate_per_gram_paise | INTEGER | NOT NULL | Rate at time of contribution |
| grams_credited | DECIMAL(10,4) | NOT NULL | Calculated: amount / rate |
| contribution_month | DATE | NOT NULL | First day of the month |
| type | ENUM | NOT NULL | autopay, manual, bonus, adjustment |
| status | ENUM | NOT NULL DEFAULT pending | pending, processing, completed, failed, refunded |
| payment_method_id | UUID | FK payment_methods.id NULLABLE | |
| payment_reference | VARCHAR(255) | NULLABLE | Gateway txn ID |
| completed_at | TIMESTAMP | NULLABLE | |
| failed_at | TIMESTAMP | NULLABLE | |
| failure_reason | TEXT | NULLABLE | |

Index: (goal_id, contribution_month) — for ledger queries
Index: (user_id, status) — for dashboard

---

## TABLE: gold_balance_snapshots

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| total_grams | DECIMAL(10,4) | NOT NULL | Snapshot at point in time |
| total_value_paise | INTEGER | NOT NULL | Snapshot value |
| gold_rate_used_paise | INTEGER | NOT NULL | Rate at snapshot time |
| snapshot_at | TIMESTAMP | NOT NULL | |
| reason | ENUM | | contribution, redemption, adjustment, daily_close |

Note: Actual balance is sum of contributions.grams_credited across all goals.
Snapshots are for performance caching — recomputed nightly and on each transaction.

---

## TABLE: products

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| sku | VARCHAR(50) | UNIQUE NOT NULL | |
| name | VARCHAR(255) | NOT NULL | |
| description | TEXT | NULLABLE | |
| category_id | UUID | FK categories.id NOT NULL | |
| collection_id | UUID | FK collections.id NULLABLE | |
| purity | ENUM | NOT NULL | 22k, 18k, 24k, 14k |
| hallmark_number | VARCHAR(50) | NULLABLE | BIS number |
| weight_grams | DECIMAL(10,4) | NOT NULL | |
| making_charge_pct | DECIMAL(5,2) | NOT NULL | |
| wastage_pct | DECIMAL(5,2) | DEFAULT 0 | |
| has_stones | BOOLEAN | DEFAULT false | |
| stone_value_paise | INTEGER | DEFAULT 0 | Fixed value component |
| gst_pct | DECIMAL(5,2) | NOT NULL DEFAULT 3.0 | |
| stock_quantity | INTEGER | NOT NULL DEFAULT 0 | |
| is_published | BOOLEAN | DEFAULT false | |
| is_featured | BOOLEAN | DEFAULT false | |
| has_ar | BOOLEAN | DEFAULT false | |
| ar_model_url | VARCHAR(1000) | NULLABLE | |
| sort_order | INTEGER | DEFAULT 0 | |
| deleted_at | TIMESTAMP | NULLABLE | |

Price calculation (not stored — computed at query time):
  gold_value = weight_grams × current_rate
  making_value = gold_value × (making_charge_pct / 100)
  wastage_value = gold_value × (wastage_pct / 100)
  base_price = gold_value + making_value + wastage_value + stone_value
  gst = base_price × (gst_pct / 100)
  total_price = base_price + gst

---

## TABLE: product_images

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| product_id | UUID | FK products.id NOT NULL | |
| url | VARCHAR(1000) | NOT NULL | CDN URL |
| type | ENUM | NOT NULL | white_background, on_model, detail, lifestyle |
| sort_order | INTEGER | NOT NULL DEFAULT 0 | |
| is_primary | BOOLEAN | DEFAULT false | |

---

## TABLE: product_occasion_tags

| Field | Type | Constraints | Notes |
|---|---|---|---|
| product_id | UUID | FK products.id | |
| occasion_id | UUID | FK occasions.id | |
| PRIMARY KEY | (product_id, occasion_id) | | |

---

## TABLE: categories

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| name | VARCHAR(100) | NOT NULL | "Necklaces", "Bangles & Kadas" |
| slug | VARCHAR(100) | UNIQUE NOT NULL | "necklaces", "bangles-kadas" |
| parent_id | UUID | FK categories.id NULLABLE | For subcategories |
| icon_url | VARCHAR(1000) | NULLABLE | |
| image_url | VARCHAR(1000) | NULLABLE | |
| sort_order | INTEGER | DEFAULT 0 | |
| is_active | BOOLEAN | DEFAULT true | |

---

## TABLE: collections

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| name | VARCHAR(255) | NOT NULL | "Kerala Kasavu", "Bridal Kundan" |
| slug | VARCHAR(255) | UNIQUE NOT NULL | |
| description | TEXT | NULLABLE | |
| cover_image_url | VARCHAR(1000) | NULLABLE | |
| is_active | BOOLEAN | DEFAULT true | |
| is_featured | BOOLEAN | DEFAULT false | |
| valid_from | DATE | NULLABLE | For seasonal collections |
| valid_to | DATE | NULLABLE | |
| sort_order | INTEGER | DEFAULT 0 | |

---

## TABLE: occasions

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| name | VARCHAR(100) | NOT NULL | "Wedding", "Onam" |
| slug | VARCHAR(100) | UNIQUE NOT NULL | |
| icon_url | VARCHAR(1000) | NULLABLE | |
| bg_image_url | VARCHAR(1000) | NULLABLE | |
| is_active | BOOLEAN | DEFAULT true | |
| sort_order | INTEGER | DEFAULT 0 | |

---

## TABLE: dream_vault_items

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| product_id | UUID | FK products.id NOT NULL | |
| goal_id | UUID | FK goals.id NULLABLE | If a goal is attached |
| added_at | TIMESTAMP | NOT NULL | |
| removed_at | TIMESTAMP | NULLABLE | Soft delete |

UNIQUE constraint: (user_id, product_id) WHERE removed_at IS NULL

---

## TABLE: orders

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| order_number | VARCHAR(20) | UNIQUE NOT NULL | Human-readable: MGD-2025-00123 |
| user_id | UUID | FK users.id NOT NULL | |
| status | ENUM | NOT NULL | pending_payment, confirmed, processing, shipped, delivered, cancelled, refunded |
| total_paise | INTEGER | NOT NULL | |
| gold_value_paise | INTEGER | NOT NULL | Gold component |
| making_charges_paise | INTEGER | NOT NULL | |
| gst_paise | INTEGER | NOT NULL | |
| delivery_address_id | UUID | FK addresses.id NOT NULL | Snapshot at order time |
| delivery_address_snapshot | JSONB | NOT NULL | Full address at time of order |
| payment_method | ENUM | NOT NULL | gold_balance, upi, card, netbanking, cod |
| payment_reference | VARCHAR(255) | NULLABLE | |
| gold_balance_used_grams | DECIMAL(10,4) | DEFAULT 0 | |
| gold_rate_at_order_paise | INTEGER | NOT NULL | |
| notes | TEXT | NULLABLE | |
| shipped_at | TIMESTAMP | NULLABLE | |
| delivered_at | TIMESTAMP | NULLABLE | |
| cancelled_at | TIMESTAMP | NULLABLE | |
| cancellation_reason | TEXT | NULLABLE | |

---

## TABLE: order_items

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| order_id | UUID | FK orders.id NOT NULL | |
| product_id | UUID | FK products.id NOT NULL | |
| product_snapshot | JSONB | NOT NULL | Full product at time of order |
| quantity | INTEGER | NOT NULL DEFAULT 1 | |
| unit_price_paise | INTEGER | NOT NULL | Price at order time |
| weight_grams | DECIMAL(10,4) | NOT NULL | Weight at order time |
| gold_rate_paise | INTEGER | NOT NULL | Rate at order time |

---

## TABLE: cart_items

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| product_id | UUID | FK products.id NOT NULL | |
| quantity | INTEGER | NOT NULL DEFAULT 1 | |
| added_at | TIMESTAMP | NOT NULL | |

UNIQUE: (user_id, product_id)
Note: Cart is ephemeral. Cleared on order completion. No soft delete needed.

---

## TABLE: notifications

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| type | ENUM | NOT NULL | (see notification types below) |
| title | VARCHAR(255) | NOT NULL | |
| body | TEXT | NOT NULL | |
| deep_link | VARCHAR(500) | NULLABLE | Route to navigate on tap |
| metadata | JSONB | NULLABLE | Type-specific data |
| is_read | BOOLEAN | DEFAULT false | |
| is_sent | BOOLEAN | DEFAULT false | |
| sent_at | TIMESTAMP | NULLABLE | |
| read_at | TIMESTAMP | NULLABLE | |
| scheduled_for | TIMESTAMP | NULLABLE | For scheduled notifications |

Notification types:
  contribution_due, contribution_success, contribution_failed,
  milestone_reached, goal_completed, order_confirmed,
  order_shipped, order_delivered, kyc_verified, kyc_rejected,
  gold_rate_alert, aura_suggestion, product_back_in_stock

---

## TABLE: user_milestones

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| milestone_type | ENUM | NOT NULL | gold_10g, gold_25g, gold_50g, gold_100g, first_goal, first_purchase |
| reached_at | TIMESTAMP | NOT NULL | |
| celebrated_at | TIMESTAMP | NULLABLE | NULL = not yet shown in app |
| goal_id | UUID | FK goals.id NULLABLE | |

---

## TABLE: aura_sessions

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| flow_type | ENUM | NOT NULL | goal_planning, product_discovery, gold_insights, chat |
| started_at | TIMESTAMP | NOT NULL | |
| ended_at | TIMESTAMP | NULLABLE | |
| goal_created | BOOLEAN | DEFAULT false | |
| products_added_to_vault | INTEGER | DEFAULT 0 | |
| goal_id_created | UUID | FK goals.id NULLABLE | |

---

## TABLE: aura_messages

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| session_id | UUID | FK aura_sessions.id NOT NULL | |
| role | ENUM | NOT NULL | aura, user |
| content | TEXT | NOT NULL | |
| metadata | JSONB | NULLABLE | { productIds: [], goalType: "" } |
| sequence | INTEGER | NOT NULL | Order within session |

---

## TABLE: banners

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| title | VARCHAR(255) | NOT NULL | |
| image_url | VARCHAR(1000) | NOT NULL | |
| cta_label | VARCHAR(100) | NULLABLE | |
| cta_route | VARCHAR(500) | NULLABLE | Deep link |
| placement | ENUM | NOT NULL | home_hero, shop_top, goals_top |
| sort_order | INTEGER | DEFAULT 0 | |
| valid_from | TIMESTAMP | NULLABLE | |
| valid_to | TIMESTAMP | NULLABLE | |
| is_active | BOOLEAN | DEFAULT true | |

---

## TABLE: product_views

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| user_id | UUID | FK users.id NOT NULL | |
| product_id | UUID | FK products.id NOT NULL | |
| viewed_at | TIMESTAMP | NOT NULL | |
| source | ENUM | | search, home, shop, aura, vault, collection |

Used for: recently viewed, Aura personalisation, analytics.
Retention: 90 days.

---

## TABLE: referrals

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| referrer_user_id | UUID | FK users.id NOT NULL | |
| referred_user_id | UUID | FK users.id NULLABLE | Set when referred user registers |
| referral_code | VARCHAR(20) | UNIQUE NOT NULL | |
| status | ENUM | DEFAULT pending | pending, registered, rewarded |
| registered_at | TIMESTAMP | NULLABLE | |
| rewarded_at | TIMESTAMP | NULLABLE | |
| reward_type | ENUM | NULLABLE | gold_credit, discount_voucher |
| reward_value | INTEGER | NULLABLE | In paise or grams × 10000 |

---

## TABLE: store_locations

| Field | Type | Constraints | Notes |
|---|---|---|---|
| id | UUID | PK | |
| name | VARCHAR(255) | NOT NULL | "Moozhayil Gold, Thrissur" |
| address | TEXT | NOT NULL | |
| city | VARCHAR(100) | NOT NULL | |
| state | VARCHAR(100) | NOT NULL | |
| pincode | VARCHAR(6) | NOT NULL | |
| phone | VARCHAR(15) | NOT NULL | |
| latitude | DECIMAL(9,6) | NOT NULL | |
| longitude | DECIMAL(9,6) | NOT NULL | |
| opening_hours | JSONB | NOT NULL | { mon: "10:00-19:00", ... } |
| is_active | BOOLEAN | DEFAULT true | |

---

## RELATIONSHIPS SUMMARY

```
users
  ├── user_intents (1:many)
  ├── kyc_documents (1:1)
  ├── addresses (1:many)
  ├── payment_methods (1:many)
  ├── goals (1:many)
  │     └── contributions (1:many)
  ├── gold_balance_snapshots (1:many)
  ├── dream_vault_items (1:many)
  ├── orders (1:many)
  │     └── order_items (1:many)
  ├── cart_items (1:many)
  ├── notifications (1:many)
  ├── user_milestones (1:many)
  ├── aura_sessions (1:many)
  │     └── aura_messages (1:many)
  ├── product_views (1:many)
  └── referrals (1:many as referrer + 0:1 as referred)

products
  ├── product_images (1:many)
  ├── product_occasion_tags (many:many → occasions)
  ├── categories (many:1)
  ├── collections (many:1, nullable)
  ├── dream_vault_items (1:many)
  ├── order_items (1:many)
  ├── cart_items (1:many)
  └── goals.target_product_id (0:many)

goals
  ├── contributions (1:many)
  ├── products (many:1, nullable target)
  ├── dream_vault_items (1:many, nullable)
  └── user_milestones (1:many, nullable)
```

---

## INDEXES (Performance Critical)

```sql
-- Auth
CREATE UNIQUE INDEX idx_users_phone ON users(phone);

-- Product listing (most common query)
CREATE INDEX idx_products_category ON products(category_id) WHERE deleted_at IS NULL AND is_published = true;
CREATE INDEX idx_products_collection ON products(collection_id) WHERE deleted_at IS NULL AND is_published = true;
CREATE INDEX idx_products_purity ON products(purity) WHERE is_published = true;

-- Product occasion filtering
CREATE INDEX idx_pot_occasion ON product_occasion_tags(occasion_id);

-- Gold rate (latest rate lookup)
CREATE INDEX idx_gold_rate_purity_time ON gold_rate_history(purity, effective_from DESC);

-- Goals by user
CREATE INDEX idx_goals_user_status ON goals(user_id, status) WHERE deleted_at IS NULL;

-- Contributions by goal
CREATE INDEX idx_contributions_goal ON contributions(goal_id, contribution_month DESC);

-- Dream vault by user
CREATE INDEX idx_vault_user ON dream_vault_items(user_id) WHERE removed_at IS NULL;

-- Notifications unread
CREATE INDEX idx_notifications_user_unread ON notifications(user_id, is_read) WHERE is_read = false;

-- Product views for recency
CREATE INDEX idx_product_views_user_time ON product_views(user_id, viewed_at DESC);

-- Balance calculation
CREATE INDEX idx_contributions_user_completed ON contributions(user_id, status) WHERE status = 'completed';
```

---

## COMPUTED VIEWS (for API performance)

```sql
-- user_gold_balance: sum of all completed contributions per user
CREATE MATERIALIZED VIEW user_gold_balance AS
  SELECT
    user_id,
    SUM(grams_credited) AS total_grams,
    MAX(created_at) AS last_updated
  FROM contributions
  WHERE status = 'completed'
  GROUP BY user_id;

-- Refresh: after each completed contribution

-- product_current_price: compute price at current gold rate
CREATE VIEW product_current_price AS
  SELECT
    p.id,
    p.name,
    p.weight_grams,
    p.purity,
    p.making_charge_pct,
    p.wastage_pct,
    p.stone_value_paise,
    p.gst_pct,
    gr.rate_per_gram_paise AS current_rate,
    (
      (p.weight_grams * gr.rate_per_gram_paise)
      + (p.weight_grams * gr.rate_per_gram_paise * p.making_charge_pct / 100)
      + (p.weight_grams * gr.rate_per_gram_paise * p.wastage_pct / 100)
      + p.stone_value_paise
    ) AS base_price_paise,
    (
      (
        (p.weight_grams * gr.rate_per_gram_paise)
        + (p.weight_grams * gr.rate_per_gram_paise * p.making_charge_pct / 100)
        + (p.weight_grams * gr.rate_per_gram_paise * p.wastage_pct / 100)
        + p.stone_value_paise
      ) * (1 + p.gst_pct / 100)
    ) AS total_price_paise
  FROM products p
  CROSS JOIN LATERAL (
    SELECT rate_per_gram_paise
    FROM gold_rate_history
    WHERE purity = p.purity AND effective_to IS NULL
    LIMIT 1
  ) gr;
```

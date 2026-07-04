-- CreateEnum
CREATE TYPE "purity" AS ENUM ('14k', '18k', '22k', '24k');

-- CreateEnum
CREATE TYPE "product_image_type" AS ENUM ('white_background', 'on_model', 'detail', 'lifestyle');

-- CreateTable
CREATE TABLE "gold_rate_history" (
    "id" UUID NOT NULL,
    "purity" "purity" NOT NULL,
    "rate_per_gram_paise" INTEGER NOT NULL,
    "effective_from" TIMESTAMPTZ(6) NOT NULL,
    "effective_to" TIMESTAMPTZ(6),
    "source" VARCHAR(100) NOT NULL,
    "created_by_admin_id" UUID,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "gold_rate_history_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "slug" VARCHAR(100) NOT NULL,
    "parent_id" UUID,
    "icon_url" VARCHAR(1000),
    "image_url" VARCHAR(1000),
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "collections" (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "slug" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "cover_image_url" VARCHAR(1000),
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "is_featured" BOOLEAN NOT NULL DEFAULT false,
    "valid_from" DATE,
    "valid_to" DATE,
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "collections_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "occasions" (
    "id" UUID NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "slug" VARCHAR(100) NOT NULL,
    "icon_url" VARCHAR(1000),
    "bg_image_url" VARCHAR(1000),
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "occasions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "products" (
    "id" UUID NOT NULL,
    "sku" VARCHAR(50) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT,
    "category_id" UUID NOT NULL,
    "collection_id" UUID,
    "purity" "purity" NOT NULL,
    "hallmark_number" VARCHAR(50),
    "weight_grams" DECIMAL(10,4) NOT NULL,
    "making_charge_pct" DECIMAL(5,2) NOT NULL,
    "wastage_pct" DECIMAL(5,2) NOT NULL DEFAULT 0,
    "has_stones" BOOLEAN NOT NULL DEFAULT false,
    "stone_value_paise" INTEGER NOT NULL DEFAULT 0,
    "gst_pct" DECIMAL(5,2) NOT NULL DEFAULT 3.00,
    "stock_quantity" INTEGER NOT NULL DEFAULT 0,
    "is_published" BOOLEAN NOT NULL DEFAULT false,
    "is_featured" BOOLEAN NOT NULL DEFAULT false,
    "has_ar" BOOLEAN NOT NULL DEFAULT false,
    "ar_model_url" VARCHAR(1000),
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "deleted_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_images" (
    "id" UUID NOT NULL,
    "product_id" UUID NOT NULL,
    "s3_key" VARCHAR(1000) NOT NULL,
    "cdn_url" VARCHAR(1000) NOT NULL,
    "type" "product_image_type" NOT NULL,
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "is_primary" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "product_images_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_occasion_tags" (
    "product_id" UUID NOT NULL,
    "occasion_id" UUID NOT NULL,
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_occasion_tags_pkey" PRIMARY KEY ("product_id","occasion_id")
);

-- CreateTable
CREATE TABLE "cms_banners" (
    "id" UUID NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "image_url" VARCHAR(1000) NOT NULL,
    "cta_label" VARCHAR(100),
    "cta_route" VARCHAR(500),
    "placement" VARCHAR(50) NOT NULL,
    "sort_order" INTEGER NOT NULL DEFAULT 0,
    "valid_from" TIMESTAMPTZ(6),
    "valid_to" TIMESTAMPTZ(6),
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "created_by_admin_id" UUID,
    "updated_by_admin_id" UUID,
    "deleted_at" TIMESTAMPTZ(6),
    "created_at" TIMESTAMPTZ(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMPTZ(6) NOT NULL,

    CONSTRAINT "cms_banners_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_gold_rate_history_purity_effective_from" ON "gold_rate_history"("purity", "effective_from" DESC);

-- CreateIndex
CREATE INDEX "idx_gold_rate_history_purity_effective_to" ON "gold_rate_history"("purity", "effective_to");

-- CreateIndex
CREATE UNIQUE INDEX "categories_slug_key" ON "categories"("slug");

-- CreateIndex
CREATE INDEX "idx_categories_parent_id" ON "categories"("parent_id");

-- CreateIndex
CREATE INDEX "idx_categories_is_active" ON "categories"("is_active");

-- CreateIndex
CREATE INDEX "idx_categories_sort_order" ON "categories"("sort_order");

-- CreateIndex
CREATE UNIQUE INDEX "collections_slug_key" ON "collections"("slug");

-- CreateIndex
CREATE INDEX "idx_collections_is_active" ON "collections"("is_active");

-- CreateIndex
CREATE INDEX "idx_collections_is_featured" ON "collections"("is_featured");

-- CreateIndex
CREATE INDEX "idx_collections_valid_from" ON "collections"("valid_from");

-- CreateIndex
CREATE INDEX "idx_collections_valid_to" ON "collections"("valid_to");

-- CreateIndex
CREATE UNIQUE INDEX "occasions_slug_key" ON "occasions"("slug");

-- CreateIndex
CREATE INDEX "idx_occasions_is_active" ON "occasions"("is_active");

-- CreateIndex
CREATE INDEX "idx_occasions_sort_order" ON "occasions"("sort_order");

-- CreateIndex
CREATE UNIQUE INDEX "products_sku_key" ON "products"("sku");

-- CreateIndex
CREATE INDEX "idx_products_sku" ON "products"("sku");

-- CreateIndex
CREATE INDEX "idx_products_category_id" ON "products"("category_id");

-- CreateIndex
CREATE INDEX "idx_products_collection_id" ON "products"("collection_id");

-- CreateIndex
CREATE INDEX "idx_products_purity" ON "products"("purity");

-- CreateIndex
CREATE INDEX "idx_products_is_featured" ON "products"("is_featured");

-- CreateIndex
CREATE INDEX "idx_products_published_deleted_at" ON "products"("is_published", "deleted_at");

-- CreateIndex
CREATE INDEX "idx_product_images_product_id" ON "product_images"("product_id");

-- CreateIndex
CREATE INDEX "idx_product_images_product_id_sort_order" ON "product_images"("product_id", "sort_order");

-- CreateIndex
CREATE INDEX "idx_product_occasion_tags_occasion_id" ON "product_occasion_tags"("occasion_id");

-- CreateIndex
CREATE INDEX "idx_product_occasion_tags_product_id" ON "product_occasion_tags"("product_id");

-- CreateIndex
CREATE INDEX "idx_cms_banners_placement_is_active_sort_order" ON "cms_banners"("placement", "is_active", "sort_order");

-- CreateIndex
CREATE INDEX "idx_cms_banners_valid_from" ON "cms_banners"("valid_from");

-- CreateIndex
CREATE INDEX "idx_cms_banners_valid_to" ON "cms_banners"("valid_to");

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_parent_id_fkey" FOREIGN KEY ("parent_id") REFERENCES "categories"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_collection_id_fkey" FOREIGN KEY ("collection_id") REFERENCES "collections"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_occasion_tags" ADD CONSTRAINT "product_occasion_tags_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "products"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_occasion_tags" ADD CONSTRAINT "product_occasion_tags_occasion_id_fkey" FOREIGN KEY ("occasion_id") REFERENCES "occasions"("id") ON DELETE CASCADE ON UPDATE CASCADE;

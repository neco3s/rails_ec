# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_28_120023) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name", null: false, comment: "商品名"
    t.string "code", null: false, comment: "商品コード"
    t.text "description", null: false, comment: "商品説明"
    t.integer "price", null: false, comment: "価格"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_products_on_id", unique: true
  end

  create_table "promo_codes", force: :cascade do |t|
    t.string "code", null: false, comment: "プロモーションコード"
    t.float "discount", null: false, comment: "ディスカウント"
    t.boolean "used", default: false, null: false, comment: "使用済み"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_promo_codes_on_code", unique: true
  end

  create_table "purchase_detail_associations", force: :cascade do |t|
    t.integer "purchase_id", null: false, comment: "購入ID"
    t.integer "purchase_detail_id", null: false, comment: "購入明細ID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_detail_id"], name: "index_purchase_detail_associations_on_purchase_detail_id", unique: true
    t.index ["purchase_id"], name: "index_purchase_detail_associations_on_purchase_id"
  end

  create_table "purchase_details", force: :cascade do |t|
    t.integer "product_id", null: false, comment: "商品ID"
    t.integer "quantity", null: false, comment: "数量"
    t.integer "unit_price", null: false, comment: "単価"
    t.integer "subtotal", null: false, comment: "小計"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_purchase_details_on_id", unique: true
    t.index ["product_id"], name: "index_purchase_details_on_product_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "promo_code_id", comment: "プロモーションコードID"
    t.string "first_name", null: false, comment: "名"
    t.string "last_name", null: false, comment: "姓"
    t.string "username", null: false, comment: "ニックネーム"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "address", null: false, comment: "市区町村+番地"
    t.string "address_optional", comment: "階層や部屋番号"
    t.string "country", null: false, comment: "国"
    t.string "state", null: false, comment: "都道府県"
    t.integer "zip", null: false, comment: "郵便番号"
    t.string "name_on_card", null: false, comment: "クレジットカードの名前"
    t.integer "credit_card_number", null: false, comment: "クレジットカードナンバー"
    t.date "expiration", null: false, comment: "有効期限"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_purchases_on_email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "purchase_detail_associations", "purchase_details"
  add_foreign_key "purchase_detail_associations", "purchases"
  add_foreign_key "purchase_details", "products"
  add_foreign_key "purchases", "promo_codes"
end

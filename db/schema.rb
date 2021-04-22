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

ActiveRecord::Schema.define(version: 0) do

  create_table "auction_item_prices", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "auction_item_id", null: false
    t.float "new_price", default: 0.0, null: false
    t.float "old_price", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_item_id"], name: "index_auction_item_prices_on_auction_item_id"
  end

  create_table "auction_item_users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "auction_id", null: false
    t.bigint "auction_item_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_item_id", "user_id"], name: "index_auction_item_users_on_auction_item_id_and_user_id"
    t.index ["auction_item_id"], name: "index_auction_item_users_on_auction_item_id"
    t.index ["status"], name: "index_auction_item_users_on_status"
  end

  create_table "auction_items", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "product_name", null: false
    t.string "category_name", null: false
    t.string "auction_name", null: false
    t.integer "status", default: 0, null: false
    t.bigint "auction_id", null: false
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.float "price", default: 0.0, null: false
    t.float "min_price", default: 0.0, null: false
    t.bigint "marker", null: false
    t.string "serial", null: false
    t.string "address", null: false
    t.string "source_link"
    t.json "images"
    t.bigint "user_id"
    t.float "used_hours", default: 0.0, null: false
    t.datetime "year_of_manufacture", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_auction_items_on_auction_id"
    t.index ["category_id"], name: "index_auction_items_on_category_id"
    t.index ["product_id"], name: "index_auction_items_on_product_id"
    t.index ["status"], name: "index_auction_items_on_status"
    t.index ["user_id"], name: "index_auction_items_on_user_id"
  end

  create_table "auctions", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_auctions_on_status"
  end

  create_table "banners", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "url"
    t.string "cover"
    t.string "cover_tmp"
    t.string "title"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_banners_on_status"
  end

  create_table "categories", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "thumb"
    t.string "thumb_tmp"
    t.integer "status", default: 0, null: false
    t.string "category_id"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["status"], name: "index_categories_on_status"
  end

  create_table "companies", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "logo"
    t.string "logo_tmp"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_companies_on_status"
  end

  create_table "favorites", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favoritable_id", "favoritable_type"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "followers", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "followable_type", null: false
    t.bigint "followable_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followable_id", "followable_type"], name: "index_followers_on_followable_type_and_followable_id"
    t.index ["user_id"], name: "index_followers_on_user_id"
  end

  create_table "images", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "file"
    t.string "file_tmp"
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.float "price", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
    t.index ["imageable_id"], name: "index_images_on_imageable_id"
    t.index ["imageable_type"], name: "index_images_on_imageable_type"
  end

  create_table "news", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "content"
    t.string "cover"
    t.string "content_tmp"
    t.string "cover_tmp"
    t.text "short_description"
    t.string "title", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_news_on_status"
  end

  create_table "products", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "thumb"
    t.string "thumb_tmp"
    t.string "code", null: false
    t.float "price", default: 0.0, null: false
    t.string "keyword"
    t.bigint "company_id", null: false
    t.bigint "category_id", null: false
    t.float "star", default: 0.0, null: false
    t.float "star_total", default: 0.0, null: false
    t.datetime "started_at"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["keyword"], name: "index_products_on_keyword"
    t.index ["status"], name: "index_products_on_status"
  end

  create_table "rates", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ratable_type", null: false
    t.bigint "ratable_id", null: false
    t.bigint "user_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ratable_id", "ratable_type"], name: "index_rates_on_ratable_type_and_ratable_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.integer "role", default: 0, null: false
    t.integer "gender", default: 0, null: false
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at", precision: 6
    t.datetime "last_sign_in_at", precision: 6
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "avatar"
    t.string "avatar_tmp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  create_table "videos", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cover"
    t.string "cover_tmp"
    t.string "url", null: false
    t.string "title", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_videos_on_status"
  end

end

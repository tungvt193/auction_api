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
    t.string "product_name", null: false
    t.string "category_name", null: false
    t.string "auction_name", null: false
    t.integer "status", default: 0, null: false
    t.bigint "auction_id", null: false
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.bigint "company_id", null: false
    t.float "price", default: 0.0, null: false
    t.float "rating", default: 0.0, null: false
    t.float "min_price", default: 0.0, null: false
    t.string "marker", null: false
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
    t.index ["company_id"], name: "index_auction_items_on_company_id"
    t.index ["product_id"], name: "index_auction_items_on_product_id"
    t.index ["status"], name: "index_auction_items_on_status"
    t.index ["user_id"], name: "index_auction_items_on_user_id"
  end

  create_table "auctions", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "display_name", default: ""
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string "color"
    t.float "rating", default: 0.0, null: false
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

  create_table "bookings", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "auction_item_id", null: false
    t.bigint "auction_id", null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.integer "booking_type", default: 0, null: false
    t.string "address"
    t.string "zoom_id"
    t.string "zoom_password"
    t.bigint "supporter_id"
    t.datetime "booking_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_bookings_on_auction_id"
    t.index ["auction_item_id"], name: "index_bookings_on_auction_item_id"
    t.index ["status"], name: "index_bookings_on_status"
    t.index ["supporter_id"], name: "index_bookings_on_supporter_id"
    t.index ["user_id", "auction_item_id"], name: "index_bookings_on_user_id_and_auction_item_id"
  end

  create_table "categories", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "english_name", null: false
    t.string "thumb"
    t.string "thumb_tmp"
    t.integer "status", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position"], name: "index_categories_on_position"
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

  create_table "crawlers", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "file"
    t.string "file_tmp"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_crawlers_on_status"
  end

  create_table "device_tokens", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.text "token"
    t.integer "token_type", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["token_type"], name: "index_device_tokens_on_token_type"
    t.index ["user_id"], name: "index_device_tokens_on_user_id"
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
    t.index ["followable_id", "followable_type", "user_id"], name: "index_followers_on_followable_type_and_followable_id", unique: true
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
    t.string "slug"
    t.bigint "votes_total", default: 0, null: false
    t.bigint "comments_count", default: 0, null: false
    t.bigint "comments_total", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_news_on_status"
  end

  create_table "notifications", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.integer "notification_type", default: 0, null: false
    t.text "message"
    t.boolean "status", default: false, null: false
    t.string "image_url"
    t.json "data"
    t.bigint "user_id"
    t.text "reader_ids"
    t.text "blinder_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notification_type"], name: "index_notifications_on_notification_type"
    t.index ["status"], name: "index_notifications_on_status"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "order_items", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "auction_item_id", null: false
    t.bigint "auction_id", null: false
    t.bigint "product_id", null: false
    t.float "price", default: 0.0, null: false
    t.integer "status", default: 0, null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_order_items_on_auction_id"
    t.index ["auction_item_id"], name: "index_order_items_on_auction_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["status"], name: "index_order_items_on_status"
  end

  create_table "orders", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_general_ci", force: :cascade do |t|
    t.string "code", null: false
    t.string "cod_code"
    t.integer "status", default: 0, null: false
    t.bigint "user_id", null: false
    t.integer "payment_type", default: 0, null: false
    t.bigint "price", default: 0, null: false
    t.float "tax", default: 0.0, null: false
    t.datetime "booking_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_orders_on_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_companies", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_product_companies_on_company_id"
    t.index ["product_id"], name: "index_product_companies_on_product_id"
  end

  create_table "products", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "thumb"
    t.string "thumb_tmp"
    t.string "keyword"
    t.bigint "category_id", null: false
    t.bigint "sub_category_id", null: false
    t.float "star", default: 0.0, null: false
    t.float "star_total", default: 0.0, null: false
    t.text "short_description"
    t.datetime "started_at"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["keyword"], name: "index_products_on_keyword"
    t.index ["status"], name: "index_products_on_status"
    t.index ["sub_category_id"], name: "index_products_on_sub_category_id"
  end

  create_table "rates", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "ratable_type", null: false
    t.bigint "ratable_id", null: false
    t.bigint "user_id", null: false
    t.bigint "auction_id"
    t.text "comment"
    t.float "star", default: 0.0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["auction_id"], name: "index_rates_on_auction_id"
    t.index ["ratable_id", "ratable_type"], name: "index_rates_on_ratable_type_and_ratable_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
  end

  create_table "sub_categories", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "english_name", null: false
    t.bigint "category_id", null: false
    t.integer "status", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
    t.index ["position"], name: "index_sub_categories_on_position"
    t.index ["status"], name: "index_sub_categories_on_status"
  end

  create_table "users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.integer "role", default: 0, null: false
    t.integer "user_type", default: 0, null: false
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
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
    t.index ["status"], name: "index_users_on_status"
    t.index ["user_type"], name: "index_users_on_user_type"
  end

  create_table "videos", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "cover_url"
    t.string "video_id", null: false
    t.string "title", null: false
    t.text "description"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["status"], name: "index_videos_on_status"
  end

end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_29_110950) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "hotel_sites", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.bigint "site_id", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_hotel_sites_on_hotel_id"
    t.index ["site_id"], name: "index_hotel_sites_on_site_id"
  end

  create_table "hotel_types", force: :cascade do |t|
    t.bigint "hotel_site_id", null: false
    t.string "link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "origin_id", null: false
    t.index ["hotel_site_id"], name: "index_hotel_types_on_hotel_site_id"
    t.index ["origin_id"], name: "index_hotel_types_on_origin_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "city"
    t.string "origin_url"
  end

  create_table "month_prices", force: :cascade do |t|
    t.string "month"
    t.integer "price"
    t.string "price_option"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "link"
    t.bigint "origin_id"
    t.integer "year"
    t.bigint "hotel_type_id"
    t.index ["hotel_type_id"], name: "index_month_prices_on_hotel_type_id"
    t.index ["origin_id"], name: "index_month_prices_on_origin_id"
  end

  create_table "origins", force: :cascade do |t|
    t.string "name"
    t.bigint "hotel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hotel_id"], name: "index_origins_on_hotel_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "hotel_sites", "hotels"
  add_foreign_key "hotel_sites", "sites"
  add_foreign_key "hotel_types", "hotel_sites"
  add_foreign_key "hotel_types", "origins"
  add_foreign_key "month_prices", "hotel_types"
  add_foreign_key "month_prices", "origins"
  add_foreign_key "origins", "hotels"
end

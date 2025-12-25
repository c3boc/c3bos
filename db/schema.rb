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

ActiveRecord::Schema[8.1].define(version: 2025_12_24_122846) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "beverages", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "locations", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "room"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "order_items", id: :serial, force: :cascade do |t|
    t.integer "amount"
    t.integer "beverage_id"
    t.datetime "created_at", null: false
    t.integer "order_id"
    t.datetime "updated_at", null: false
    t.index ["beverage_id"], name: "index_order_items_on_beverage_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "order_permissions", force: :cascade do |t|
    t.boolean "allow", default: false, null: false
    t.bigint "beverage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["beverage_id"], name: "index_order_permissions_on_beverage_id"
    t.index ["user_id"], name: "index_order_permissions_on_user_id"
  end

  create_table "orders", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "location_id"
    t.integer "state", default: 0
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["location_id"], name: "index_orders_on_location_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "password_digest"
    t.integer "role", null: false
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "order_items", "beverages"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_permissions", "beverages"
  add_foreign_key "order_permissions", "users"
  add_foreign_key "orders", "locations"
  add_foreign_key "orders", "users"
end

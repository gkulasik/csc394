# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141102011258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
    t.integer  "customer_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    default: 1
  end

  add_index "carts", ["customer_id", "item_id"], name: "index_carts_on_customer_id_and_item_id", using: :btree

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state_province"
    t.string   "postal_code"
    t.string   "country"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true, using: :btree

  create_table "images", force: true do |t|
    t.integer  "picture_id"
    t.string   "picture_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

  add_index "images", ["picture_id", "picture_type"], name: "index_images_on_picture_id_and_picture_type", using: :btree

  create_table "inventories", force: true do |t|
    t.integer  "item_id"
    t.integer  "inventory_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.text     "description"
    t.string   "keywords"
    t.decimal  "unit_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "order_details", force: true do |t|
    t.integer  "orderSummary_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.decimal  "item_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_summaries", force: true do |t|
    t.integer  "customer_id"
    t.datetime "order_date"
    t.datetime "ship_date"
    t.decimal  "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

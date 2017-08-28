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

ActiveRecord::Schema.define(version: 20170828222335) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "registration"
    t.decimal  "balance"
    t.date     "last_payment_date"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "airport_id"
    t.string   "owner"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "email"
    t.string   "telephone"
    t.string   "owner_first_name"
    t.string   "owner_last_name"
    t.string   "company"
    t.string   "quickbooks_customer_id"
    t.datetime "deleted_at"
    t.boolean  "account_closed",           default: false, null: false
    t.string   "auth_token"
    t.string   "acct"
    t.string   "routing"
    t.string   "encrypted_account_num"
    t.string   "encrypted_account_num_iv"
  end

  add_index "accounts", ["deleted_at"], name: "index_accounts_on_deleted_at", using: :btree

  create_table "airports", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "type"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "token"
    t.string   "secret"
    t.string   "realm_id"
    t.string   "access_token"
    t.string   "access_secret"
    t.string   "company_id"
    t.boolean  "connected_to_qb"
    t.string   "qb_account_id"
  end

  add_index "airports", ["email"], name: "index_airports_on_email", unique: true, using: :btree
  add_index "airports", ["reset_password_token"], name: "index_airports_on_reset_password_token", unique: true, using: :btree

  create_table "automated_transactions", force: :cascade do |t|
    t.integer  "account_id"
    t.string   "description"
    t.string   "long_description"
    t.decimal  "subtotal"
    t.boolean  "taxable"
    t.decimal  "tax"
    t.decimal  "total"
    t.boolean  "paid"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "registration"
    t.integer  "airport_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "description"
    t.decimal  "units_on_hand"
    t.decimal  "tax_rate"
    t.decimal  "price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "airport_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string   "registration"
    t.boolean  "paid"
    t.integer  "creator_id"
    t.decimal  "subtotal"
    t.decimal  "tax"
    t.decimal  "total"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "airport_id"
    t.integer  "account_id"
    t.integer  "user_id"
  end

  add_index "invoices", ["account_id"], name: "index_invoices_on_account_id", using: :btree

  create_table "line_items", force: :cascade do |t|
    t.string   "description"
    t.string   "long_description"
    t.decimal  "price"
    t.decimal  "units"
    t.boolean  "tax"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "invoice"
    t.integer  "invoice_id"
    t.decimal  "total"
    t.decimal  "tax_amount"
    t.decimal  "tax_rate"
    t.integer  "inventory_id"
  end

  add_index "line_items", ["inventory_id"], name: "index_line_items_on_inventory_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "invoices", "accounts"
  add_foreign_key "line_items", "inventories"
end

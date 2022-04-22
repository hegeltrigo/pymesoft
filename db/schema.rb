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

ActiveRecord::Schema.define(version: 2021_08_22_133146) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "subdomain"
    t.integer "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
  end

  create_table "company_details", force: :cascade do |t|
    t.string "company_name"
    t.string "nit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "address"
    t.string "phone_number"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "sex"
    t.string "number_id"
    t.datetime "born_date"
    t.string "nationality"
    t.string "living_place"
    t.string "address"
    t.string "civil_status"
    t.string "job"
    t.string "company_name"
    t.string "position"
    t.decimal "money_income"
    t.string "work_address"
    t.string "working_time"
    t.string "work_phone"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nit"
    t.integer "client_type"
  end

  create_table "inputs", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "input_date"
    t.text "description"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id"
    t.index ["item_id"], name: "index_inputs_on_item_id"
  end

  create_table "invoice_dosages", force: :cascade do |t|
    t.string "authorization_number"
    t.datetime "emission_deadline"
    t.integer "invoice_initial_number"
    t.string "dosage_key"
    t.string "economic_activity"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "legend"
    t.boolean "computarized"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "number"
    t.string "customer_nit"
    t.string "customer_name"
    t.date "issue_date"
    t.decimal "amount"
    t.decimal "applicable_tax_credit_amount"
    t.decimal "ice_iehd_amount"
    t.decimal "amount_for_sales_at_zero_rate"
    t.decimal "amount_not_subject_to_tax_credit"
    t.decimal "rebates_and_discounts_earned"
    t.string "state"
    t.string "control_code"
    t.integer "user_id"
    t.integer "invoice_dosage_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "upc"
    t.string "sku"
    t.string "name"
    t.text "description"
    t.integer "input", default: 0
    t.integer "output", default: 0
    t.integer "amount_stock", default: 0
    t.decimal "price"
    t.decimal "cost_price"
    t.boolean "published", default: false
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "jwt_blacklist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["jti"], name: "index_jwt_blacklist_on_jti"
  end

  create_table "line_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "sale_id"
    t.string "detail"
    t.integer "quantiy"
    t.decimal "unit_price"
    t.decimal "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_line_items_on_sale_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "output_date"
    t.text "description"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_outputs_on_item_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.date "purchase_date"
    t.integer "supplier_id"
    t.string "invoice_number"
    t.string "dui_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authorization_number"
    t.float "amount"
    t.string "control_code"
    t.string "purchase_type"
    t.integer "ticket_type"
    t.integer "sales_type"
    t.integer "amount_not_subjet_to_tax_credict"
    t.integer "discounts_and_bonuses"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "amount"
    t.decimal "total_amount"
    t.decimal "remaining_amount"
    t.decimal "discount"
    t.decimal "tax"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "invoice_id"
    t.index ["customer_id"], name: "index_sales_on_customer_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specification_products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "specification_value_id"
    t.integer "item_id"
  end

  create_table "specification_values", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "specification_id"
    t.string "value"
  end

  create_table "specifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "stores", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "description"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "cellphone"
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treasury_inputs", force: :cascade do |t|
    t.datetime "input_date"
    t.text "description"
    t.decimal "quantity"
    t.bigint "treasury_petty_cash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treasury_petty_cash_id"], name: "index_treasury_inputs_on_treasury_petty_cash_id"
  end

  create_table "treasury_outputs", force: :cascade do |t|
    t.datetime "input_date"
    t.text "description"
    t.decimal "quantity"
    t.bigint "treasury_petty_cash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["treasury_petty_cash_id"], name: "index_treasury_outputs_on_treasury_petty_cash_id"
  end

  create_table "treasury_petty_cashes", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.integer "number"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "authentication_token", limit: 30
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inputs", "items"
  add_foreign_key "inputs", "suppliers"
  add_foreign_key "items", "categories"
  add_foreign_key "line_items", "items"
  add_foreign_key "line_items", "sales"
  add_foreign_key "outputs", "items"
  add_foreign_key "purchases", "suppliers"
  add_foreign_key "sales", "customers"
  add_foreign_key "sales", "invoices"
  add_foreign_key "specification_products", "items"
  add_foreign_key "specification_products", "specification_values"
  add_foreign_key "specification_values", "specifications"
  add_foreign_key "treasury_inputs", "treasury_petty_cashes"
  add_foreign_key "treasury_outputs", "treasury_petty_cashes"
end

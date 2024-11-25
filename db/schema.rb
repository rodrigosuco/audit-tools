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

ActiveRecord::Schema[7.2].define(version: 2024_11_25_030537) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "legal_name"
    t.string "sales_name"
    t.string "cnpj"
    t.string "street"
    t.integer "number"
    t.string "compliment"
    t.string "neighborhood"
    t.string "city"
    t.string "state"
    t.string "country"
    t.text "scope"
    t.string "contact_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "zip"
    t.string "contact_position"
    t.integer "employees_number"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "standard_id", null: false
    t.string "stage"
    t.integer "year"
    t.float "onsite_man_days"
    t.float "off_site_man_days"
    t.float "man_day_rate"
    t.float "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_days"
    t.bigint "proposal_id", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "user_id"
    t.index ["proposal_id"], name: "index_items_on_proposal_id"
    t.index ["standard_id"], name: "index_items_on_standard_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_cost"
    t.string "status"
    t.integer "due_date"
    t.float "discount"
    t.string "discount_type"
    t.bigint "user_id"
    t.index ["company_id"], name: "index_proposals_on_company_id"
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "standards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standards_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "standard_id", null: false
    t.index ["standard_id", "user_id"], name: "index_standards_users_on_standard_id_and_user_id"
    t.index ["user_id", "standard_id"], name: "index_standards_users_on_user_id_and_standard_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "position"
    t.string "phone"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "proposals"
  add_foreign_key "items", "standards"
  add_foreign_key "items", "users"
  add_foreign_key "proposals", "companies"
  add_foreign_key "proposals", "users"
end

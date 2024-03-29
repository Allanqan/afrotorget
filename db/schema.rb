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

ActiveRecord::Schema.define(version: 2022_05_09_195149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adverts", force: :cascade do |t|
    t.text "title"
    t.string "image"
    t.string "video"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_adverts_on_user_id"
  end

  create_table "blogs", force: :cascade do |t|
    t.text "title"
    t.text "image"
    t.text "video"
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_bookmarks_on_company_id"
    t.index ["product_id"], name: "index_bookmarks_on_product_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "size"
    t.text "location"
    t.boolean "favorite"
    t.bigint "user_id", null: false
    t.bigint "company_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_type_id"], name: "index_companies_on_company_type_id"
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "company_types", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_categories", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "photo"
    t.text "location"
    t.integer "price"
    t.boolean "favorite"
    t.bigint "user_id", null: false
    t.bigint "product_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_category_id"], name: "index_products_on_product_category_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "score"
    t.text "description"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_ratings_on_product_id"
  end

  create_table "user_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
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
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "image"
    t.bigint "user_category_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_category_id"], name: "index_users_on_user_category_id"
  end

  add_foreign_key "adverts", "users"
  add_foreign_key "blogs", "users"
  add_foreign_key "bookmarks", "companies"
  add_foreign_key "bookmarks", "products"
  add_foreign_key "companies", "company_types"
  add_foreign_key "companies", "users"
  add_foreign_key "products", "product_categories"
  add_foreign_key "products", "users"
  add_foreign_key "ratings", "products"
  add_foreign_key "users", "user_categories"
end

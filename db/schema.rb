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

ActiveRecord::Schema.define(version: 2019_06_19_181554) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "career"
    t.string "grading_basis"
    t.string "course_components"
    t.string "campus"
    t.string "academic_group"
    t.string "academic_organization"
    t.string "module_code"
    t.float "credit_units"
    t.text "description"
    t.string "term"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term", "module_code"], name: "index_courses_on_term_and_module_code", unique: true
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text "professor_review"
    t.text "module_review"
    t.boolean "is_anonymous", default: false
    t.integer "marking_score"
    t.integer "engagement_score"
    t.integer "fairness_score"
    t.integer "workload_score"
    t.bigint "user_id"
    t.bigint "professor_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["professor_id"], name: "index_reviews_on_professor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "temporary_users", force: :cascade do |t|
    t.string "ip_address"
    t.string "session_token"
    t.string "telegram_id"
    t.string "client_verifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "last_name"
    t.string "first_name"
    t.text "authentication_token"
    t.datetime "authentication_token_created_at"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "links", "users"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "professors"
  add_foreign_key "reviews", "users"
end

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

ActiveRecord::Schema.define(version: 2020_11_08_101003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "fuzzystrmatch"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "actions", id: :serial, force: :cascade do |t|
    t.string "action_type", null: false
    t.string "action_option"
    t.string "target_type"
    t.integer "target_id"
    t.string "user_type"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["action_type", "target_type", "target_id", "user_type", "user_id"], name: "uk_action_target_user", unique: true
    t.index ["target_type", "target_id", "action_type"], name: "index_actions_on_target_type_and_target_id_and_action_type"
    t.index ["user_type", "user_id", "action_type"], name: "index_actions_on_user_type_and_user_id_and_action_type"
  end

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role", default: 1, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.float "latitude"
    t.float "longitude"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.string "app_version"
    t.string "os_version"
    t.string "platform"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.datetime "valid_from"
    t.datetime "expires_on"
    t.string "main_image"
    t.text "additional_images", default: [], array: true
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_direct_link"
    t.string "target_link"
    t.integer "position"
    t.boolean "is_long_duration", default: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "authors"
    t.string "isbn10"
    t.boolean "is_used"
    t.float "price"
    t.text "description"
    t.text "photos"
    t.boolean "is_telegram_contact"
    t.boolean "is_sold", default: false
    t.bigint "course_id"
    t.string "isbn13"
    t.integer "bookmarks_count", default: 0
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.index ["course_id"], name: "index_books_on_course_id"
    t.index ["user_id"], name: "index_books_on_user_id"
    t.index ["uuid"], name: "index_books_on_uuid", unique: true
  end

  create_table "clicks", force: :cascade do |t|
    t.string "target_type"
    t.string "id_or_uuid"
    t.string "caller_id_or_uuid"
    t.jsonb "additional_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "academic_group_abbreviation"
    t.string "module_code_front"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookmarks_count", default: 0
    t.index "lower((name)::text) varchar_pattern_ops", name: "index_on_courses_name"
    t.index ["term", "module_code"], name: "index_courses_on_term_and_module_code", unique: true
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  create_table "professor_courses", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_professor_courses_on_course_id"
    t.index ["professor_id"], name: "index_professor_courses_on_professor_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "bookmarks_count", default: 0
    t.jsonb "additional_data", default: {}
    t.index "lower((name)::text) varchar_pattern_ops", name: "index_on_professors_name"
    t.index ["slug"], name: "index_professors_on_slug", unique: true
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
    t.string "type_of_review"
    t.string "module_code"
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["professor_id"], name: "index_reviews_on_professor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_sessions_on_key", unique: true
    t.index ["user_id"], name: "index_sessions_on_user_id"
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
    t.boolean "verified", default: false
    t.string "email_token"
    t.uuid "uuid", default: -> { "uuid_generate_v4()" }, null: false
    t.string "password_reset_token"
    t.datetime "password_reset_created_at"
    t.integer "password_reset_tries_count", default: 0
    t.integer "password_token_tries_count", default: 0
    t.bigint "telegram_id"
    t.string "telegram_username"
    t.string "telegram_picture"
    t.integer "verification_count", default: 0, null: false
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "vote_type"
    t.string "review_type"
    t.bigint "user_id"
    t.bigint "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_votes_on_review_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "books", "courses"
  add_foreign_key "books", "users"
  add_foreign_key "links", "users"
  add_foreign_key "professor_courses", "courses"
  add_foreign_key "professor_courses", "professors"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "professors"
  add_foreign_key "reviews", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end

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

ActiveRecord::Schema.define(version: 2019_08_21_121708) do

  # These are extensions that must be enabled in order to support this database
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

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
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
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "club_admin_delegates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_admin_delegates_on_club_id"
    t.index ["user_id"], name: "index_club_admin_delegates_on_user_id"
  end

  create_table "club_admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_club_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_club_admins_on_reset_password_token", unique: true
  end

  create_table "club_members", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "club_id"
    t.integer "status"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_club_members_on_club_id"
    t.index ["user_id"], name: "index_club_members_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "display_picture"
    t.text "gallery"
    t.text "description"
    t.text "social_media"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "club_admin_id"
    t.integer "bookmarks_count", default: 0
    t.index ["club_admin_id"], name: "index_clubs_on_club_admin_id"
    t.index ["name"], name: "index_clubs_on_name", unique: true
    t.index ["slug"], name: "index_clubs_on_slug", unique: true
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
    t.index ["term", "module_code"], name: "index_courses_on_term_and_module_code", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "main_image"
    t.text "gallery"
    t.string "color"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "location"
    t.float "price"
    t.boolean "require_rsvp", default: false
    t.datetime "rsvp_by"
    t.bigint "club_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookmarks_count", default: 0
    t.index ["club_id"], name: "index_events_on_club_id"
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
    t.index ["course_id"], name: "index_reviews_on_course_id"
    t.index ["professor_id"], name: "index_reviews_on_professor_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rsvps", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_rsvps_on_event_id"
    t.index ["user_id", "event_id"], name: "index_rsvps_on_user_id_and_event_id", unique: true
    t.index ["user_id"], name: "index_rsvps_on_user_id"
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
    t.string "email"
    t.string "email_verification_token"
    t.boolean "email_verified", default: false
    t.string "login_token"
    t.index ["email"], name: "index_temporary_users_on_email", unique: true
    t.index ["email_verification_token"], name: "index_temporary_users_on_email_verification_token", unique: true
    t.index ["login_token"], name: "index_temporary_users_on_login_token", unique: true
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
    t.boolean "old_system", default: true
    t.boolean "old_system_verified", default: false
    t.string "telegram_email_verification_token"
    t.integer "telegram_id"
    t.index ["authentication_token"], name: "index_users_on_authentication_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["email_token"], name: "index_users_on_email_token", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["telegram_email_verification_token"], name: "index_users_on_telegram_email_verification_token", unique: true
    t.index ["telegram_id"], name: "index_users_on_telegram_id", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "books", "users"
  add_foreign_key "club_admin_delegates", "clubs"
  add_foreign_key "club_admin_delegates", "users"
  add_foreign_key "club_members", "clubs"
  add_foreign_key "club_members", "users"
  add_foreign_key "clubs", "club_admins"
  add_foreign_key "events", "clubs"
  add_foreign_key "links", "users"
  add_foreign_key "professor_courses", "courses"
  add_foreign_key "professor_courses", "professors"
  add_foreign_key "reviews", "courses"
  add_foreign_key "reviews", "professors"
  add_foreign_key "reviews", "users"
  add_foreign_key "rsvps", "events"
  add_foreign_key "rsvps", "users"
  add_foreign_key "sessions", "users"
  add_foreign_key "votes", "reviews"
  add_foreign_key "votes", "users"
end

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

ActiveRecord::Schema.define(version: 20180122155851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.text "dummy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.hstore "name_translations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.hstore "action_word_translations"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.text "text"
    t.integer "commenter_id"
    t.integer "lang"
    t.string "commented_object_type"
    t.integer "commented_object_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commented_object_type", "commented_object_id"], name: "index_comments_on_commented_object_type_and_commented_object_id"
    t.index ["commenter_id"], name: "index_comments_on_commenter_id"
  end

  create_table "levels", id: :serial, force: :cascade do |t|
    t.hstore "name_translations"
    t.integer "value"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["value"], name: "index_levels_on_value", unique: true
  end

  create_table "participations", id: :serial, force: :cascade do |t|
    t.integer "workshop_session_id"
    t.integer "workshop_registration_id"
    t.float "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workshop_registration_id"], name: "index_participations_on_workshop_registration_id"
    t.index ["workshop_session_id"], name: "index_participations_on_workshop_session_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "text"
    t.integer "lang", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :serial, force: :cascade do |t|
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
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "first_name"
    t.string "locale"
    t.string "gender"
    t.string "image"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "nickname"
    t.json "tokens"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.string "street"
    t.string "house_number"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country_alpha2"
    t.float "longitude"
    t.float "latitude"
    t.string "room_number"
    t.string "extra_infomation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshop_registrations", id: :serial, force: :cascade do |t|
    t.integer "workshop_id"
    t.integer "user_id"
    t.integer "booking_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_workshop_registrations_on_booking_id"
    t.index ["user_id"], name: "index_workshop_registrations_on_user_id"
    t.index ["workshop_id"], name: "index_workshop_registrations_on_workshop_id"
  end

  create_table "workshop_sessions", id: :serial, force: :cascade do |t|
    t.hstore "title_translations"
    t.hstore "subtitle_translations"
    t.hstore "description_translations"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "level_id"
    t.string "main_image"
    t.string "more_images", default: [], array: true
    t.integer "tutor_id"
    t.integer "workshop_id"
    t.integer "venue_id"
    t.integer "minimum_participation_count", default: 0
    t.integer "maximum_participation_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["level_id"], name: "index_workshop_sessions_on_level_id"
    t.index ["tutor_id"], name: "index_workshop_sessions_on_tutor_id"
    t.index ["venue_id"], name: "index_workshop_sessions_on_venue_id"
    t.index ["workshop_id"], name: "index_workshop_sessions_on_workshop_id"
  end

  create_table "workshops", id: :serial, force: :cascade do |t|
    t.hstore "title_translations"
    t.hstore "subtitle_translations"
    t.hstore "description_translations"
    t.integer "category_id"
    t.date "offered_on", default: [], array: true
    t.float "fees"
    t.integer "provider_id"
    t.string "main_image"
    t.string "more_images", default: [], array: true
    t.boolean "is_recurring"
    t.integer "recurrence_type"
    t.boolean "is_approved", default: false
    t.integer "minimum_workshop_registration_count", default: 0
    t.integer "maximum_workshop_registration_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "action_word"
    t.bigint "venue_id"
    t.bigint "level_id"
    t.text "full_address"
    t.integer "min_age"
    t.integer "max_age"
    t.datetime "published_at"
    t.index ["category_id"], name: "index_workshops_on_category_id"
    t.index ["level_id"], name: "index_workshops_on_level_id"
    t.index ["provider_id"], name: "index_workshops_on_provider_id"
    t.index ["venue_id"], name: "index_workshops_on_venue_id"
  end

  add_foreign_key "comments", "users", column: "commenter_id"
  add_foreign_key "participations", "workshop_registrations"
  add_foreign_key "participations", "workshop_sessions"
  add_foreign_key "workshop_registrations", "bookings"
  add_foreign_key "workshop_registrations", "users"
  add_foreign_key "workshop_registrations", "workshops"
  add_foreign_key "workshop_sessions", "levels"
  add_foreign_key "workshop_sessions", "users", column: "tutor_id"
  add_foreign_key "workshop_sessions", "venues"
  add_foreign_key "workshop_sessions", "workshops"
  add_foreign_key "workshops", "categories"
  add_foreign_key "workshops", "levels"
  add_foreign_key "workshops", "users", column: "provider_id"
  add_foreign_key "workshops", "venues"
end

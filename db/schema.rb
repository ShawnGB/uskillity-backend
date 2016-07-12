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

ActiveRecord::Schema.define(version: 20160712142236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "categories", force: :cascade do |t|
    t.integer  "parent_id"
    t.hstore   "name_translations"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "text"
    t.integer  "commenter_id"
    t.integer  "lang"
    t.string   "commented_object_type"
    t.integer  "commented_object_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["commented_object_type", "commented_object_id"], name: "index_comments_on_commented_object_type_and_commented_object_id", using: :btree
    t.index ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree
  end

  create_table "levels", force: :cascade do |t|
    t.hstore   "name_translations"
    t.integer  "value"
    t.boolean  "is_active"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["value"], name: "index_levels_on_value", unique: true, using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.float    "value"
    t.integer  "creator_id"
    t.string   "rated_object_type"
    t.integer  "rated_object_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["creator_id"], name: "index_ratings_on_creator_id", using: :btree
    t.index ["rated_object_type", "rated_object_id"], name: "index_ratings_on_rated_object_type_and_rated_object_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "text"
    t.integer  "lang",       null: false
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
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "locale"
    t.string   "gender"
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "venues", force: :cascade do |t|
    t.string   "street"
    t.string   "house_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country_alpha2"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "room_number"
    t.string   "extra_infomation"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "comments", "users", column: "commenter_id"
  add_foreign_key "ratings", "users", column: "creator_id"
end

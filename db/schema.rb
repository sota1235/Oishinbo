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

ActiveRecord::Schema.define(version: 20150813143502) do

  create_table "account_sections", force: :cascade do |t|
    t.integer  "account_id",              null: false
    t.integer  "section_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag", default: 0, null: false
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "email",                     null: false
    t.text     "profile"
    t.string   "password_hash",             null: false
    t.integer  "admin_flag",    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag",   default: 0, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "account_id",                          null: false
    t.integer  "restaurant_id",                       null: false
    t.integer  "food_id",                             null: false
    t.text     "comment"
    t.binary   "photo"
    t.integer  "point",         limit: 5, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag",             default: 0, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "restaurant_id",             null: false
    t.string   "name",                      null: false
    t.integer  "price",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag",   default: 0, null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "account_id",              null: false
    t.integer  "schedule_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag", default: 0, null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "name_kana"
    t.string   "address"
    t.string   "category"
    t.string   "tel"
    t.float    "latitude"
    t.float    "longitube"
    t.string   "pc_url"
    t.string   "mobile_url"
    t.text     "time_detail"
    t.text     "holiday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag", default: 0, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "restaurant_id",             null: false
    t.datetime "date",                      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag",   default: 0, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag", default: 0, null: false
  end

  create_table "wants", force: :cascade do |t|
    t.integer  "account_id",                null: false
    t.integer  "restaurant_id",             null: false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.integer  "delete_flag",   default: 0, null: false
  end

end

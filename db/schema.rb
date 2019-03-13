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

ActiveRecord::Schema.define(version: 2019_03_12_081446) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookinghomes", force: :cascade do |t|
    t.date "booking_day"
    t.integer "total_money"
    t.integer "people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "parent_id", default: 0
    t.bigint "user_id"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_comments_on_home_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.string "cover_image"
    t.string "description"
    t.string "address"
    t.integer "room"
    t.integer "liked", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactives", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "home_id"
    t.integer "interactive_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_interactives_on_home_id"
    t.index ["user_id"], name: "index_interactives_on_user_id"
  end

  create_table "reality_rents", force: :cascade do |t|
    t.integer "reality_day"
    t.integer "total_money"
    t.integer "people"
    t.integer "surcharge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "account_name"
    t.string "avatar"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "comments", "homes"
  add_foreign_key "comments", "users"
  add_foreign_key "interactives", "homes"
  add_foreign_key "interactives", "users"
end

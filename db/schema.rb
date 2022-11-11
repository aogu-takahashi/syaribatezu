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

ActiveRecord::Schema[7.0].define(version: 2022_11_11_054628) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.bigint "mountain_id"
    t.string "name", null: false
    t.integer "days", default: 1, null: false
    t.float "walking_time", default: 0.0, null: false
    t.float "distance", default: 0.0, null: false
    t.float "denivele_plus", default: 0.0, null: false
    t.float "denivele_minus", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_id"], name: "index_courses_on_mountain_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string "name", null: false
    t.integer "energy", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memos", force: :cascade do |t|
    t.integer "temperature", default: 20, null: false
    t.text "description"
    t.integer "done", default: 0, null: false
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date", null: false
    t.index ["course_id"], name: "index_memos_on_course_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "mountain_locations", force: :cascade do |t|
    t.bigint "mountain_id"
    t.bigint "prefecture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_id"], name: "index_mountain_locations_on_mountain_id"
    t.index ["prefecture_id"], name: "index_mountain_locations_on_prefecture_id"
  end

  create_table "mountains", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portable_drinks", force: :cascade do |t|
    t.integer "volume", default: 0, null: false
    t.bigint "memo_id", null: false
    t.bigint "drink_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drink_id"], name: "index_portable_drinks_on_drink_id"
    t.index ["memo_id"], name: "index_portable_drinks_on_memo_id"
  end

  create_table "portable_foods", force: :cascade do |t|
    t.integer "volume", default: 0, null: false
    t.bigint "memo_id", null: false
    t.bigint "ration_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memo_id"], name: "index_portable_foods_on_memo_id"
    t.index ["ration_id"], name: "index_portable_foods_on_ration_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rations", force: :cascade do |t|
    t.string "name", null: false
    t.integer "energy", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_mountains", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mountain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_id"], name: "index_user_mountains_on_mountain_id"
    t.index ["user_id"], name: "index_user_mountains_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "age", default: 20, null: false
    t.integer "sex", default: 0, null: false
    t.integer "height", default: 170, null: false
    t.integer "weight", default: 65, null: false
    t.integer "rucksack_weight", default: 0, null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "memos", "courses"
  add_foreign_key "memos", "users"
  add_foreign_key "mountain_locations", "mountains"
  add_foreign_key "mountain_locations", "prefectures"
  add_foreign_key "portable_drinks", "drinks"
  add_foreign_key "portable_drinks", "memos"
  add_foreign_key "portable_foods", "memos"
  add_foreign_key "portable_foods", "rations"
  add_foreign_key "user_mountains", "mountains"
  add_foreign_key "user_mountains", "users"
end

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

ActiveRecord::Schema.define(version: 2021_08_07_041125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_admin_profiles_on_user_id"
  end

  create_table "child_profiles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_child_profiles_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question", null: false
    t.string "answer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "admin_profile_id"
    t.index ["admin_profile_id"], name: "index_questions_on_admin_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wish_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "child_profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["child_profile_id"], name: "index_wish_lists_on_child_profile_id"
  end

  create_table "wishes", force: :cascade do |t|
    t.string "name"
    t.bigint "wish_list_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["wish_list_id"], name: "index_wishes_on_wish_list_id"
  end

  add_foreign_key "admin_profiles", "users"
  add_foreign_key "child_profiles", "users"
  add_foreign_key "questions", "admin_profiles"
  add_foreign_key "wish_lists", "child_profiles"
  add_foreign_key "wishes", "wish_lists"
end

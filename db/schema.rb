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

ActiveRecord::Schema[7.1].define(version: 2024_01_15_013832) do
  create_table "entities", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_entities_on_user_id"
  end

  create_table "entities_events", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.integer "entities_id", null: false
    t.integer "events_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entities_id"], name: "index_entities_events_on_entities_id"
    t.index ["events_id"], name: "index_entities_events_on_events_id"
    t.index ["user_id"], name: "index_entities_events_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "event_start"
    t.datetime "event_end"
    t.text "story"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "description"
    t.integer "left_id", null: false
    t.integer "right_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["left_id"], name: "index_relationships_on_left_id"
    t.index ["right_id"], name: "index_relationships_on_right_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "privileged", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "entities_events", "entities", column: "entities_id"
  add_foreign_key "entities_events", "events", column: "events_id"
end

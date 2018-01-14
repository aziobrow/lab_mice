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

ActiveRecord::Schema.define(version: 20180114235057) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mice", force: :cascade do |t|
    t.string "original_id"
    t.boolean "trisomic"
    t.float "protein_ug_per_ml"
    t.string "diet"
    t.string "color"
    t.integer "sex"
    t.date "date_of_birth"
    t.date "experiment_start_date"
    t.string "harvest_date"
    t.string "group_number"
    t.float "harvest_brain_temp"
    t.float "weight_in_grams"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mouse_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mouse_id"], name: "index_notes_on_mouse_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "tracked_subjects", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "mouse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mouse_id"], name: "index_tracked_subjects_on_mouse_id"
    t.index ["user_id"], name: "index_tracked_subjects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "uid"
    t.string "token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "notes", "mice"
  add_foreign_key "notes", "users"
  add_foreign_key "tracked_subjects", "mice"
  add_foreign_key "tracked_subjects", "users"
end

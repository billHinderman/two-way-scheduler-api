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

ActiveRecord::Schema.define(version: 2019_10_04_204049) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string "key"
    t.string "title"
    t.boolean "is_confirmed_employer", null: false
    t.boolean "is_confirmed_talent", null: false
    t.integer "status", null: false
    t.integer "length", null: false
    t.datetime "start_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "interview_id"
    t.bigint "user_id"
    t.index ["interview_id"], name: "index_appointments_on_interview_id"
    t.index ["key"], name: "index_appointments_on_key", unique: true
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "key"
    t.json "payload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["key"], name: "index_calendars_on_key", unique: true
    t.index ["user_id"], name: "index_calendars_on_user_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.string "key", null: false
    t.string "slug", null: false
    t.string "title"
    t.datetime "enable_at"
    t.datetime "expire_at"
    t.integer "status", null: false
    t.integer "length", null: false
    t.bigint "requesting_employer_id"
    t.bigint "requesting_talent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_interviews_on_key", unique: true
    t.index ["requesting_employer_id"], name: "index_interviews_on_requesting_employer_id"
    t.index ["requesting_talent_id"], name: "index_interviews_on_requesting_talent_id"
    t.index ["slug"], name: "index_interviews_on_slug", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "nickname"
    t.string "email", null: false
    t.integer "role", null: false
    t.string "key", null: false
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["key"], name: "index_users_on_key", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

end

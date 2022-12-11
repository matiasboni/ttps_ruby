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

ActiveRecord::Schema[7.0].define(version: 2022_12_04_213438) do
  create_table "bussiness_hours", force: :cascade do |t|
    t.integer "day"
    t.time "opening_time"
    t.time "closing_time"
    t.integer "subsidiary_id"
    t.index ["subsidiary_id"], name: "index_bussiness_hours_on_subsidiary_id"
  end

  create_table "bussiness_hours_subsidiaries", id: false, force: :cascade do |t|
    t.integer "subsidiary_id"
    t.integer "bussiness_hour_id"
    t.index ["bussiness_hour_id"], name: "index_bussiness_hours_subsidiaries_on_bussiness_hour_id"
    t.index ["subsidiary_id"], name: "index_bussiness_hours_subsidiaries_on_subsidiary_id"
  end

  create_table "subsidiaries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "date"
    t.text "motive"
    t.boolean "state", default: false
    t.text "result"
    t.integer "subsidiary_id"
    t.integer "client_id"
    t.integer "staff_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_turns_on_client_id"
    t.index ["staff_id"], name: "index_turns_on_staff_id"
    t.index ["subsidiary_id"], name: "index_turns_on_subsidiary_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 2, null: false
    t.integer "subsidiary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["subsidiary_id"], name: "index_users_on_subsidiary_id"
  end

end

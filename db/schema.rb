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

ActiveRecord::Schema.define(version: 2019_09_10_075447) do

  create_table "camera_settings", force: :cascade do |t|
    t.string "status", default: "Off"
    t.string "on_time"
    t.string "on_day"
    t.string "off_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "camera_name"
    t.index ["camera_name"], name: "index_camera_settings_on_camera_name"
    t.index ["user_id"], name: "index_camera_settings_on_user_id"
  end

  create_table "developers", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["token"], name: "index_developers_on_token", unique: true
  end

  create_table "notifications", force: :cascade do |t|
    t.string "extra_data"
    t.integer "frame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "camera_id"
    t.string "picture"
  end

  create_table "securities", force: :cascade do |t|
    t.string "company_name"
    t.string "phone_number"
    t.string "email"
    t.string "telegram"
    t.string "link"
    t.text "extra_info"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "securities_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "security_id", null: false
    t.index ["user_id", "security_id"], name: "index_securities_users_on_user_id_and_security_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "login"
    t.string "name"
    t.string "surname"
    t.string "second_name"
    t.string "iin"
    t.string "email"
    t.string "telegram"
    t.string "city"
    t.string "street"
    t.string "house"
    t.string "apartment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone_number"
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "is_admin"
    t.index ["email"], name: "index_users_on_email"
    t.index ["login"], name: "index_users_on_login"
    t.index ["phone_number"], name: "index_users_on_phone_number"
  end

  create_table "users_securities", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "security_id"
    t.index ["security_id"], name: "index_users_securities_on_security_id"
    t.index ["user_id"], name: "index_users_securities_on_user_id"
  end

end

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

ActiveRecord::Schema.define(version: 20141223205812) do

  create_table "client_profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.string   "zip"
    t.string   "lat"
    t.string   "lng"
    t.integer  "number_of_sessions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "client_profiles", ["user_id"], name: "index_client_profiles_on_user_id", using: :btree

  create_table "gyms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.decimal  "lat",                precision: 10, scale: 0
    t.decimal  "lng",                precision: 10, scale: 0
    t.integer  "two_gym_passes"
    t.integer  "three_gym_passes"
    t.integer  "four_gym_passes"
    t.string   "status"
    t.text     "description"
    t.string   "link"
    t.string   "profile_image"
    t.string   "logo_image"
    t.boolean  "showers"
    t.text     "classes"
    t.text     "reservation_policy"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manager_id"
  end

  add_index "gyms", ["manager_id"], name: "index_gyms_on_manager_id", using: :btree

  create_table "registrations", force: true do |t|
    t.integer  "gym_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "registrations", ["gym_id"], name: "index_registrations_on_gym_id", using: :btree
  add_index "registrations", ["user_id"], name: "index_registrations_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

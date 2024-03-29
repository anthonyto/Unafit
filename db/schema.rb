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

ActiveRecord::Schema.define(version: 20150117224328) do

  create_table "client_profiles", force: true do |t|
    t.string   "phone_number"
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.string   "zip"
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
    t.integer  "number_of_sessions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.boolean  "active",                        default: false
    t.datetime "last_payment"
    t.integer  "number_of_payments",            default: 0
  end

  add_index "client_profiles", ["user_id"], name: "index_client_profiles_on_user_id", using: :btree

  create_table "gyms", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.string   "city"
    t.string   "state"
    t.string   "street"
    t.float    "latitude",           limit: 24
    t.float    "longitude",          limit: 24
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
    t.integer  "user_id"
    t.string   "zip"
  end

  add_index "gyms", ["user_id"], name: "index_gyms_on_user_id", using: :btree

  create_table "pictures", force: true do |t|
    t.string   "file_name"
    t.integer  "gym_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "caption"
  end

  add_index "pictures", ["gym_id"], name: "index_pictures_on_gym_id", using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "gym_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sessions_left"
  end

  add_index "subscriptions", ["gym_id"], name: "index_subscriptions_on_gym_id", using: :btree
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
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
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

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

ActiveRecord::Schema.define(version: 20150213223024) do

  create_table "event_guests", force: true do |t|
    t.integer  "event_id"
    t.integer  "guest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_guests", ["event_id", "guest_id"], name: "index_event_guests_on_event_id_and_guest_id", unique: true
  add_index "event_guests", ["event_id"], name: "index_event_guests_on_event_id"
  add_index "event_guests", ["guest_id"], name: "index_event_guests_on_guest_id"

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.text     "content"
  end

  create_table "questions", force: true do |t|
    t.string   "question"
    t.boolean  "yes_no",     default: true
    t.string   "default",    default: "yes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rsvps", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.integer  "event_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "suburb"
    t.string   "post_code"
    t.integer  "number_of_guests",       default: 2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
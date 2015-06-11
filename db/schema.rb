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

ActiveRecord::Schema.define(version: 20150611035422) do

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "games", force: true do |t|
    t.integer  "current_round"
    t.datetime "next_round"
    t.boolean  "paused"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "control_message"
    t.datetime "pause_time"
    t.integer  "rioters"
    t.boolean  "nuclear_launch",  default: false
  end

  create_table "launchstarts", force: true do |t|
    t.boolean  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nuclear_codes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "codeA"
    t.string   "codeB"
    t.string   "target"
    t.string   "country_flag", default: "flag_"
  end

  create_table "public_relations", force: true do |t|
    t.string   "country"
    t.string   "description"
    t.integer  "pr_amount"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "terror_trackers", force: true do |t|
    t.string   "description"
    t.integer  "amount"
    t.integer  "round"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

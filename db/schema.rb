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

ActiveRecord::Schema.define(version: 20191113174310) do

  create_table "employee_leave_balances", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "leave_type_id", limit: 4
    t.string   "status",        limit: 255
    t.integer  "total",         limit: 4
    t.integer  "leave_availd",  limit: 4
    t.integer  "balance",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "leave_availd_details", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "leave_type_id", limit: 4
    t.date     "from_date"
    t.date     "to_date"
    t.integer  "no_of_days",    limit: 4
    t.string   "status",        limit: 255
    t.string   "reasion",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "leave_types", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "status",      limit: 255
    t.integer  "total_leave", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.boolean  "rolls",                  limit: 1,   default: false
    t.string   "name",                   limit: 255
    t.integer  "role",                   limit: 4
    t.datetime "remember_created_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

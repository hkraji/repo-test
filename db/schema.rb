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

ActiveRecord::Schema.define(version: 20131030115830) do

  create_table "access_rights", force: true do |t|
    t.text     "permission_hash",                 null: false
    t.string   "checksum",                        null: false
    t.boolean  "deleted",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "namespaces", force: true do |t|
    t.string   "name",                            null: false
    t.text     "description"
    t.integer  "access_right_id",                 null: false
    t.integer  "user_id",                         null: false
    t.integer  "user_group_id",                   null: false
    t.boolean  "deleted",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pub_keys", force: true do |t|
    t.text     "value",                      null: false
    t.integer  "user_id",                    null: false
    t.boolean  "deleted",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "repo_modules", force: true do |t|
    t.string   "name",                            null: false
    t.string   "comp_type",                       null: false
    t.integer  "namespace_id",                    null: false
    t.integer  "access_right_id",                 null: false
    t.integer  "user_id",                         null: false
    t.integer  "user_group_id",                   null: false
    t.boolean  "deleted",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_groups", force: true do |t|
    t.string   "name",                        null: false
    t.text     "description"
    t.boolean  "deleted",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                       null: false
    t.string   "email"
    t.string   "first_name",                     null: false
    t.string   "last_name",                      null: false
    t.integer  "max_namespaces", default: 1,     null: false
    t.boolean  "deleted",        default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users_user_groups", force: true do |t|
    t.integer "user_id",                       null: false
    t.integer "user_group_id",                 null: false
    t.boolean "deleted",       default: false, null: false
  end

  add_index "users_user_groups", ["user_id", "user_group_id"], name: "index_users_user_groups_on_user_id_and_user_group_id"

end

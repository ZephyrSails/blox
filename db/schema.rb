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

ActiveRecord::Schema.define(version: 20151208021501) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255,   null: false
    t.string   "subtitle",    limit: 255,   null: false
    t.text     "body",        limit: 65535, null: false
    t.integer  "view_count",  limit: 4
    t.integer  "reply_count", limit: 4
    t.integer  "writer_id",   limit: 4
    t.integer  "writers_id",  limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "type",        limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",       limit: 255, null: false
    t.integer  "writer_id",  limit: 4
    t.integer  "article_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "writers", force: :cascade do |t|
    t.string   "email",              limit: 255,              null: false
    t.string   "name",               limit: 255,              null: false
    t.string   "location",           limit: 255
    t.string   "bio",                limit: 255
    t.string   "website",            limit: 255
    t.boolean  "verfied"
    t.integer  "authority",          limit: 4
    t.string   "encrypted_password", limit: 255, default: "", null: false
    t.string   "current_login_ip",   limit: 255
    t.string   "last_login_ip",      limit: 255
    t.datetime "last_login_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

end

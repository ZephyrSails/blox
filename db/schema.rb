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

ActiveRecord::Schema.define(version: 20151201071303) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "subtitle",    null: false
    t.text     "body",        null: false
    t.integer  "view_count"
    t.integer  "reply_count"
    t.integer  "writer_id"
    t.integer  "writers_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",       null: false
    t.integer  "writer_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", force: :cascade do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

  create_table "writers", force: :cascade do |t|
    t.string   "email",                           null: false
    t.string   "name",                            null: false
    t.string   "location"
    t.string   "bio"
    t.string   "website"
    t.boolean  "verfied"
    t.integer  "authority"
    t.string   "encrypted_password", default: "", null: false
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "last_login_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end

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

ActiveRecord::Schema.define(version: 20141122202437) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: true do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.boolean  "ended"
  end

  create_table "clicks", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "action_type"
    t.integer  "action_id"
    t.integer  "call_id"
  end

  add_index "clicks", ["action_id", "action_type"], name: "index_clicks_on_action_id_and_action_type", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "host"
  end

  add_index "clients", ["host"], name: "index_clients_on_host", using: :btree

  create_table "contents", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.integer  "subtopic_id"
    t.boolean  "native"
    t.string   "original_doc"
    t.string   "summary"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "doc_num"
  end

  add_index "contents", ["doc_num"], name: "index_contents_on_doc_num", using: :btree
  add_index "contents", ["link"], name: "index_contents_on_link", using: :btree

  create_table "docs", force: true do |t|
    t.string   "title"
    t.string   "doc_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "tab_click"
  end

  create_table "favorites", force: true do |t|
    t.integer  "user_id"
    t.integer  "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "primary_topics", force: true do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "searches", force: true do |t|
    t.string   "subject"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secondary_topics", force: true do |t|
    t.string   "name"
    t.integer  "primary_topic_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "subtopics", force: true do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "secondary_topic_id"
  end

  create_table "tabs", force: true do |t|
    t.string   "name"
    t.string   "tab_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: true do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "jive_user_id"
    t.integer  "client_id"
    t.string   "employee_id"
  end

  add_index "users", ["jive_user_id"], name: "index_users_on_jive_user_id", using: :btree

end

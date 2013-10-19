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

ActiveRecord::Schema.define(version: 20131019131716) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_links", force: true do |t|
    t.integer  "mobile_app_id",                      null: false
    t.string   "referal",                            null: false
    t.integer  "clicks_counter",         default: 0, null: false
    t.integer  "unique_visitor_counter", default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_links", ["mobile_app_id"], name: "index_app_links_on_mobile_app_id", using: :btree

  create_table "link_clicks", force: true do |t|
    t.integer  "app_link_id",                       null: false
    t.string   "ip_adress",                         null: false
    t.integer  "occurence_counter", default: 0,     null: false
    t.boolean  "installed",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "link_clicks", ["app_link_id"], name: "index_link_clicks_on_app_link_id", using: :btree

  create_table "mobile_apps", force: true do |t|
    t.string   "name",       null: false
    t.string   "itunes_url", null: false
    t.string   "icon_url",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

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

ActiveRecord::Schema.define(version: 20140305085646) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pongs", force: true do |t|
    t.string   "gist"
    t.string   "dhh_gist"
    t.integer  "votes_count", default: 0
    t.boolean  "accepted",    default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "dhh_score",   default: 0
    t.integer  "user_score",  default: 0
    t.text     "answer"
  end

  add_index "pongs", ["accepted"], name: "index_pongs_on_accepted", using: :btree
  add_index "pongs", ["user_id"], name: "index_pongs_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nickname"
  end

  create_table "votes", force: true do |t|
    t.integer  "pong_id"
    t.boolean  "dhh",        default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["pong_id"], name: "index_votes_on_pong_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end

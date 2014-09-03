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

ActiveRecord::Schema.define(version: 20140903154703) do

  create_table "authors", force: true do |t|
    t.string   "name"
    t.string   "uri_name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["uri_name"], name: "index_authors_on_uri_name", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "story_id"
    t.integer  "author_id"
    t.integer  "orig_id"
    t.text     "body"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["story_id"], name: "index_comments_on_story_id", using: :btree

  create_table "stories", force: true do |t|
    t.integer  "orig_id"
    t.string   "title"
    t.text     "body"
    t.text     "prequel_ids"
    t.text     "sequel_ids"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_url"
    t.string   "photo_link"
    t.string   "photo_author"
    t.string   "photo_title"
    t.datetime "published_at"
    t.text     "cached_tags"
    t.boolean  "is_mature",    default: false
    t.integer  "author_id"
  end

  add_index "stories", ["orig_id"], name: "index_stories_on_orig_id", using: :btree

end

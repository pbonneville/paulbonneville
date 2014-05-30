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

ActiveRecord::Schema.define(version: 20140530040255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "resume_entries", force: true do |t|
    t.string   "title"
    t.string   "organization"
    t.string   "location"
    t.text     "description"
    t.integer  "sortOrder"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "resume_section_id"
    t.string   "timeframe"
  end

  create_table "resume_entries_skill_tags", force: true do |t|
    t.integer "resume_entry_id"
    t.integer "skill_tag_id"
  end

  create_table "resume_sections", force: true do |t|
    t.string   "title"
    t.integer  "sortOrder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_tag_types", force: true do |t|
    t.string   "tagType"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sortOrder"
  end

  create_table "skill_tags", force: true do |t|
    t.string   "tag"
    t.integer  "skill_tag_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skill_tags_resume_entries", force: true do |t|
    t.integer "skill_tag_id"
    t.integer "resume_entry_id"
  end

end

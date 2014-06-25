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

ActiveRecord::Schema.define(version: 20140624204848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_blog_entries", force: true do |t|
    t.string   "title"
    t.string   "excerpt"
    t.text     "body"
    t.boolean  "publish"
    t.datetime "publish_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portfolio_entries", force: true do |t|
    t.string   "title"
    t.integer  "portfolio_platform_id"
    t.string   "role"
    t.text     "overview"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sortOrder"
    t.string   "project_image_file_name"
    t.string   "project_image_content_type"
    t.integer  "project_image_file_size"
    t.datetime "project_image_updated_at"
    t.string   "backgroundColor"
  end

  create_table "portfolio_entries_skill_tags", force: true do |t|
    t.integer "portfolio_entry_id"
    t.integer "skill_tag_id"
  end

  create_table "portfolio_platforms", force: true do |t|
    t.string   "title"
    t.integer  "sortOrder"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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
    t.string   "organizationURL"
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

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved",               default: false, null: false
  end

  add_index "users", ["approved"], name: "index_users_on_approved", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end

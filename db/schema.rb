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

ActiveRecord::Schema.define(version: 20170428043205) do

  create_table "comments", force: :cascade do |t|
    t.integer  "cid"
    t.text     "text"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.datetime "time"
    t.integer  "phone_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issues", force: :cascade do |t|
    t.integer  "iid"
    t.integer  "assigned_id"
    t.boolean  "open"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "pid"
    t.date     "dob"
    t.string   "fname"
    t.string   "lname"
    t.integer  "phone_no"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
    t.integer  "repos"
    t.integer  "followers"
    t.integer  "following"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "repositories", force: :cascade do |t|
    t.integer  "rid"
    t.string   "rname"
    t.string   "type"
    t.integer  "dcount"
    t.integer  "user_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "repo_file_name"
    t.string   "repo_content_type"
    t.integer  "repo_file_size"
    t.datetime "repo_updated_at"
    t.index ["user_id"], name: "index_repositories_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.integer  "sid"
    t.text     "text"
    t.datetime "time"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_searches_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "salt"
    t.string   "encrypted_password"
    t.boolean  "private_purchased"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end

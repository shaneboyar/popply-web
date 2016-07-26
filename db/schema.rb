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

ActiveRecord::Schema.define(version: 20160726183432) do

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "membership_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "contestants", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.text     "bio"
    t.integer  "age"
    t.string   "occupation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "show_id"
  end

  add_index "contestants", ["show_id"], name: "index_contestants_on_show_id"

  create_table "groups", force: :cascade do |t|
    t.integer  "owner_id"
    t.string   "title"
    t.integer  "show_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keys", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "contestant_id"
    t.integer  "week"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "score",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "picks", force: :cascade do |t|
    t.integer  "membership_id"
    t.integer  "contestant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "week"
  end

  add_index "picks", ["contestant_id"], name: "index_picks_on_contestant_id"
  add_index "picks", ["membership_id"], name: "index_picks_on_membership_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "membership_id"
    t.integer  "group_id"
    t.text     "content"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "posts", ["group_id"], name: "index_posts_on_group_id"
  add_index "posts", ["membership_id"], name: "index_posts_on_membership_id"

  create_table "show_weeks", force: :cascade do |t|
    t.integer  "show_id"
    t.integer  "week"
    t.integer  "picklimit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "show_weeks", ["show_id"], name: "index_show_weeks_on_show_id"

  create_table "shows", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_link"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

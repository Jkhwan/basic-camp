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

ActiveRecord::Schema.define(version: 20131205043009) do

  create_table "assets", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file"
  end

  add_index "assets", ["project_id"], name: "index_assets_on_project_id"

  create_table "discussions", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject"
    t.text     "content"
  end

  add_index "discussions", ["project_id"], name: "index_discussions_on_project_id"
  add_index "discussions", ["user_id"], name: "index_discussions_on_user_id"

  create_table "invitations", force: true do |t|
    t.string   "email"
    t.string   "token"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inviter_id"
  end

  add_index "invitations", ["project_id"], name: "index_invitations_on_project_id"

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "discussion_id"
    t.integer  "user_id"
  end

  add_index "messages", ["discussion_id"], name: "index_messages_on_discussion_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "participants", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.integer  "user_id"
  end

  add_index "participants", ["project_id"], name: "index_participants_on_project_id"
  add_index "participants", ["user_id"], name: "index_participants_on_user_id"

  create_table "payments", force: true do |t|
    t.integer  "subscription_id"
    t.integer  "amount"
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["subscription_id"], name: "index_payments_on_subscription_id"

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "user_id"
    t.date     "start_date"
    t.date     "last_payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "todos", force: true do |t|
    t.string   "name"
    t.date     "due_date"
    t.integer  "importance"
    t.boolean  "completed"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "todos", ["project_id"], name: "index_todos_on_project_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "noc"
    t.string   "cc_type"
    t.date     "exp"
    t.string   "street"
    t.string   "province"
    t.string   "postal"
    t.string   "country"
    t.boolean  "paid",            default: false
    t.string   "cc_token"
  end

end

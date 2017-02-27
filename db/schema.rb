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

ActiveRecord::Schema.define(version: 20170227011329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "casts", force: :cascade do |t|
    t.string   "episode"
    t.string   "releasedate"
    t.text     "description"
    t.text     "embedcode"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.text     "shownotes"
    t.string   "slug"
    t.index ["episode"], name: "index_casts_on_episode", unique: true, using: :btree
    t.index ["user_id"], name: "index_casts_on_user_id", using: :btree
  end

  create_table "conversation_users", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_conversation_users_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_conversation_users_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "messages_count",       default: 0
    t.text     "last_message_content"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["messages_count"], name: "index_conversations_on_messages_count", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "activity"
    t.text     "description"
    t.datetime "start_time"
    t.string   "host"
    t.integer  "user_id"
    t.boolean  "official_event", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["user_id"], name: "index_events_on_user_id", using: :btree
  end

  create_table "forum_posts", force: :cascade do |t|
    t.integer  "forum_thread_id"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["forum_thread_id"], name: "index_forum_posts_on_forum_thread_id", using: :btree
    t.index ["user_id"], name: "index_forum_posts_on_user_id", using: :btree
  end

  create_table "forum_threads", force: :cascade do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "slug"
    t.datetime "last_post_created_at"
    t.boolean  "sticky",               default: false
    t.index ["slug"], name: "index_forum_threads_on_slug", unique: true, using: :btree
    t.index ["user_id"], name: "index_forum_threads_on_user_id", using: :btree
  end

  create_table "map_downloads", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.text     "content"
    t.boolean  "read_by_other_participant", default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "actor_id"
    t.datetime "read_at"
    t.string   "action"
    t.integer  "notifiable_id"
    t.string   "notifiable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "revisions", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_revisions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "minecraft_uuid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "whitelist_requests", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.boolean  "agree_rules"
    t.datetime "approved_on"
    t.datetime "denied_on"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "referred_by"
    t.integer  "actor_id"
    t.index ["user_id"], name: "index_whitelist_requests_on_user_id", using: :btree
  end

  add_foreign_key "casts", "users"
  add_foreign_key "events", "users"
  add_foreign_key "forum_posts", "forum_threads"
  add_foreign_key "forum_posts", "users"
  add_foreign_key "forum_threads", "users"
  add_foreign_key "whitelist_requests", "users"
end

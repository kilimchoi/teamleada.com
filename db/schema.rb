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

ActiveRecord::Schema.define(version: 20140520042358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "codes", force: true do |t|
    t.string   "value"
    t.string   "group"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
  end

  create_table "company_projects", force: true do |t|
    t.integer  "project_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employer_applications", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "size"
    t.string   "industry"
    t.string   "custom_industry"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interested_users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leaderboards", force: true do |t|
    t.integer  "project_id"
    t.decimal  "baseline",   precision: 20, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", id: false, force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "previous_lesson_id"
    t.integer  "next_lesson_id"
    t.integer  "project_id"
    t.string   "url"
    t.integer  "lesson_id"
    t.string   "uid",                null: false
  end

  create_table "project_interests", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", id: false, force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.boolean  "enabled"
    t.integer  "number"
    t.boolean  "has_leaderboard",   default: false
    t.text     "short_description"
    t.boolean  "has_submit",        default: false
    t.integer  "cost"
    t.boolean  "paid",              default: false
    t.integer  "uid",                               null: false
  end

  create_table "quizzes", force: true do |t|
    t.string   "quiz_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resumes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_file_name"
    t.string   "resume_file_content_type"
    t.integer  "resume_file_file_size"
    t.datetime "resume_file_updated_at"
  end

  create_table "slides", id: false, force: true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parent_type"
    t.integer  "slide_id"
    t.string   "uid",         null: false
  end

  create_table "step_requirements", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "required_step_id"
    t.integer  "requiree_step_id"
  end

  create_table "step_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "step_id"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
  end

  create_table "steps", id: false, force: true do |t|
    t.string   "lesson_id"
    t.text     "content"
    t.string   "previous_step_id"
    t.string   "next_step_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "url"
    t.integer  "points"
    t.integer  "step_id"
    t.string   "uid",              null: false
  end

  create_table "submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.decimal  "score",      precision: 20, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.string   "item_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "amount"
    t.integer  "stripe_charge_id"
    t.boolean  "charged",          default: false
  end

  create_table "tutoring_slots", force: true do |t|
    t.datetime "session_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_codes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                        default: "", null: false
    t.string   "encrypted_password",           default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "company_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "unconfirmed_email"
    t.datetime "updated_password_at"
    t.string   "who_can_see_profile"
    t.string   "who_can_send_friend_requests"
    t.string   "who_can_contact"
    t.string   "who_can_lookup_using_email"
    t.string   "who_can_lookup_by_name"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

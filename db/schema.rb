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

ActiveRecord::Schema.define(version: 20140925002842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "browsable_users", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chart_metrics", force: true do |t|
    t.integer  "chart_id"
    t.integer  "metric_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", id: false, force: true do |t|
    t.string   "category"
    t.string   "title"
    t.string   "y_axis_label"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",               null: false
    t.date     "default_timeframe"
  end

  create_table "code_submission_contents", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_complete_code", default: false
  end

  create_table "code_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "computer_science"
    t.integer  "statistics"
    t.integer  "curiosity"
    t.integer  "communication"
  end

  create_table "codes", force: true do |t|
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
    t.boolean  "enabled",     default: true
    t.string   "access_type"
  end

  create_table "companies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.boolean  "verified",            default: false
    t.string   "linkedin_company_id"
    t.string   "company_type"
    t.string   "industry"
    t.string   "ticker"
    t.string   "headline"
    t.string   "location"
    t.date     "founded_date"
    t.string   "number_of_employees"
    t.text     "about"
    t.string   "website"
    t.text     "looking_for"
    t.string   "logo_image"
    t.string   "cover_photo_image"
  end

  create_table "company_data_challenge_interests", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_employees", force: true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_interests", force: true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_projects", force: true do |t|
    t.integer  "project_id"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversation_users", force: true do |t|
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.boolean  "unread",          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conversations", force: true do |t|
    t.integer  "starter_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_message_sent_at"
  end

  create_table "days", id: false, force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",        null: false
    t.date     "date"
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

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "university_id"
    t.string   "field_of_study"
    t.string   "degree"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "notes"
    t.text     "activities"
  end

  add_index "enrollments", ["university_id"], name: "index_enrollments_on_university_id", using: :btree
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id", using: :btree

  create_table "features", force: true do |t|
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "file_submission_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_file"
    t.boolean  "required",               default: true
    t.string   "original_filename"
    t.string   "upload_file_tmp"
    t.boolean  "upload_file_processing", default: false
    t.string   "type"
  end

  create_table "file_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_response_submission_contents", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "free_response_submission_evaluation_contents", force: true do |t|
    t.integer  "computer_science"
    t.integer  "statistics"
    t.integer  "curiosity"
    t.integer  "communication"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "requested_at"
    t.datetime "accepted_at"
    t.datetime "declined_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "requested"
  end

  create_table "image_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "impressionable_id"
    t.string   "url"
    t.string   "user_agent"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "interested_users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interview_question_submissions", force: true do |t|
    t.integer  "interview_question_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interview_questions", id: false, force: true do |t|
    t.string   "title"
    t.integer  "difficulty_level"
    t.text     "question"
    t.datetime "posted_at"
    t.integer  "industry"
    t.integer  "question_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",              null: false
  end

  create_table "invites", force: true do |t|
    t.integer  "user_id"
    t.string   "invited_email"
    t.datetime "accepted_at"
    t.integer  "invited_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_experiences", force: true do |t|
    t.integer  "user_id"
    t.text     "summary"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_id"
    t.boolean  "end_date_present"
  end

  add_index "job_experiences", ["job_id"], name: "index_job_experiences_on_job_id", using: :btree
  add_index "job_experiences", ["user_id"], name: "index_job_experiences_on_user_id", using: :btree

  create_table "job_recommendations", force: true do |t|
    t.string   "reviewer_first_name"
    t.string   "reviewer_last_name"
    t.string   "reviewer_linkedin_id"
    t.integer  "reviewee_id"
    t.string   "recommendation_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "position_title"
    t.string   "location"
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree

  create_table "launches", id: false, force: true do |t|
    t.integer  "day_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",        null: false
  end

  create_table "leaderboards", force: true do |t|
    t.integer  "project_id"
    t.decimal  "baseline",   precision: 20, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lesson_statuses", force: true do |t|
    t.string   "lesson_id"
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "completed",  default: false
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
    t.string   "uid",                            null: false
    t.integer  "points",             default: 1
  end

  create_table "messages", force: true do |t|
    t.integer  "user_id"
    t.integer  "rich_content_id"
    t.string   "rich_content_type"
    t.text     "content"
    t.boolean  "is_draft"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "conversation_id"
  end

  create_table "metric_entries", force: true do |t|
    t.integer  "metric_id"
    t.integer  "day_id"
    t.decimal  "value",      precision: 20, scale: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "metrics", id: false, force: true do |t|
    t.string   "model"
    t.string   "title"
    t.string   "method"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",               null: false
    t.string   "collection_method"
  end

  create_table "profile_photos", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.boolean  "photo_processing",   default: false
    t.string   "photo_tmp"
    t.string   "photo"
    t.string   "original_filename"
  end

  create_table "project_interests", force: true do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.decimal  "score",      precision: 20, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_sets", id: false, force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",         null: false
  end

  create_table "project_statuses", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.boolean  "completed",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
  end

  create_table "project_submissions", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.string   "slide_id"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_submissions", ["project_id"], name: "index_project_submissions_on_project_id", using: :btree
  add_index "project_submissions", ["user_id"], name: "index_project_submissions_on_user_id", using: :btree

  create_table "projects", id: false, force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.boolean  "enabled"
    t.integer  "number"
    t.boolean  "has_leaderboard",       default: false
    t.text     "short_description"
    t.integer  "cost"
    t.boolean  "paid",                  default: false
    t.integer  "uid",                                   null: false
    t.string   "difficulty"
    t.text     "company_overview"
    t.string   "category"
    t.boolean  "is_new",                default: false
    t.integer  "deadline"
    t.boolean  "featured",              default: false
    t.boolean  "grants_project_access", default: false
    t.string   "cover_photo"
    t.boolean  "has_content_submit",    default: false
    t.boolean  "has_written_submit",    default: false
    t.integer  "project_set_id"
  end

  create_table "publications", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.date     "publication_date"
    t.string   "publisher"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_publication_id"
  end

  add_index "publications", ["user_id"], name: "index_publications_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "description"
    t.integer  "up_votes",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "asker_id"
    t.text     "voters"
    t.boolean  "hidden",      default: false
    t.text     "title"
  end

  create_table "quiz_submission_contents", force: true do |t|
    t.integer  "user_id"
    t.string   "quiz_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quiz_type"
  end

  add_index "quiz_submission_contents", ["quiz_id"], name: "index_quiz_submission_contents_on_quiz_id", using: :btree
  add_index "quiz_submission_contents", ["user_id"], name: "index_quiz_submission_contents_on_user_id", using: :btree

  create_table "quiz_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.string   "quiz_id"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_id"
    t.string   "type"
    t.text     "multiple_choices"
    t.decimal  "lower_bound",      precision: 10, scale: 5
    t.decimal  "upper_bound",      precision: 10, scale: 5
    t.string   "slide_id"
    t.text     "question"
  end

  create_table "resumes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "resume_file_file_name"
    t.string   "resume_file_content_type"
    t.integer  "resume_file_file_size"
    t.datetime "resume_file_updated_at"
    t.string   "resume_file"
    t.boolean  "resume_file_processing",   default: false
    t.string   "resume_file_tmp"
    t.string   "original_filename"
  end

  create_table "skills", force: true do |t|
    t.string   "name"
    t.string   "linkedin_skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "slides_link_submission_contents", force: true do |t|
    t.text     "content"
    t.string   "link_type"
    t.integer  "project_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slides_link_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "step_requirements", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "required_step_id"
    t.integer  "requiree_step_id"
  end

  create_table "step_statuses", force: true do |t|
    t.integer  "user_id"
    t.string   "step_id"
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
    t.integer  "step_id"
    t.string   "uid",                          null: false
    t.integer  "points",           default: 1
  end

  create_table "stories", force: true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "data"
    t.integer  "action_object_id"
    t.string   "action_object_type"
  end

  create_table "story_notifications", force: true do |t|
    t.integer  "story_id"
    t.integer  "notified_id"
    t.string   "notified_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submission_contexts", id: false, force: true do |t|
    t.text     "description"
    t.integer  "submission_context_id"
    t.string   "slide_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid",                                  null: false
    t.string   "title"
    t.string   "submission_type"
    t.integer  "project_id"
    t.boolean  "required",              default: true
    t.string   "url"
  end

  create_table "submission_evaluations", force: true do |t|
    t.integer  "reviewer_id"
    t.integer  "reviewee_id"
    t.integer  "project_id"
    t.integer  "project_submission_id"
    t.text     "body"
    t.boolean  "visible"
    t.integer  "content_id"
    t.string   "content_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscribers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subscriptions", force: true do |t|
    t.integer  "subscriber_id"
    t.string   "subscriber_type"
    t.integer  "subscribable_id"
    t.string   "subscribable_type"
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

  create_table "universities", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.boolean  "verified",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "linkedin_school_id"
  end

  create_table "user_actions", id: false, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "uid",        null: false
  end

  create_table "user_codes", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "code_id"
  end

  create_table "user_interactions", force: true do |t|
    t.integer  "company_id"
    t.integer  "interactor_id"
    t.integer  "interactee_id"
    t.boolean  "favorited",          default: false
    t.datetime "favorited_at"
    t.boolean  "contacted",          default: false
    t.datetime "first_contacted_at"
    t.boolean  "hired",              default: false
    t.datetime "hired_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_preferences", force: true do |t|
    t.integer  "user_id"
    t.string   "who_can_see_profile"
    t.string   "who_can_send_friend_requests"
    t.string   "who_can_contact"
    t.string   "who_can_lookup_using_email"
    t.string   "who_can_lookup_by_name"
    t.string   "who_can_see_resume"
    t.boolean  "wants_email_about_new_projects", default: true
    t.boolean  "wants_email_from_recruiters",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_profiles", force: true do |t|
    t.integer  "user_id"
    t.boolean  "looking_for_opportunities", default: true
    t.string   "location"
    t.text     "bio"
    t.string   "phone"
    t.string   "headline"
    t.string   "industry"
    t.date     "date_of_birth"
    t.text     "interests"
    t.integer  "job_bookmarks_count"
    t.string   "country_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_skills", force: true do |t|
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_skills", ["skill_id"], name: "index_user_skills_on_skill_id", using: :btree
  add_index "user_skills", ["user_id"], name: "index_user_skills_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                      default: "",    null: false
    t.string   "encrypted_password",         default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",              default: 0,     null: false
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "unconfirmed_email"
    t.datetime "updated_password_at"
    t.string   "linkedin_id"
    t.string   "name"
    t.string   "nickname"
    t.string   "linkedin_profile_image_url", default: ""
    t.string   "public_profile_url"
    t.boolean  "has_project_access",         default: false
    t.datetime "linkedin_confirmed_at"
    t.datetime "linkedin_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "video_link_submission_contents", force: true do |t|
    t.text     "content"
    t.string   "link_type"
    t.integer  "project_submission_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "video_link_submission_evaluation_contents", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120727101713) do

  create_table "forms", :force => true do |t|
    t.string   "name"
    t.integer  "form_teacher_id"
    t.integer  "no_of_students"
    t.integer  "form_leader_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punishments", :force => true do |t|
    t.text     "description"
    t.string   "status"
    t.date     "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "mathematics"
    t.integer  "english"
    t.integer  "chichewa"
    t.integer  "physical_science"
    t.integer  "biology"
    t.integer  "computer_studies"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "initial"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "position"
    t.integer  "form_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url",     :limit => 300
    t.integer  "punishmentId"
  end

  create_table "teachers", :force => true do |t|
    t.string   "first_name"
    t.string   "initial"
    t.string   "surname"
    t.date     "date_of_birth"
    t.string   "marital_status"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login_name"
    t.string   "login_password"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

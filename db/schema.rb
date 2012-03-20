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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120316104758) do

  create_table "comments", :force => true do |t|
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time_log_id"
  end

  create_table "time_logs", :force => true do |t|
    t.date     "date"
    t.time     "in"
    t.time     "out"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "leave_duration"
    t.string   "leave_type"
  end

  add_index "time_logs", ["date", "user_id"], :name => "index_time_logs_on_date_and_user_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "email"
    t.string   "api_key"
  end

end

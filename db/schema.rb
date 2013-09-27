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

ActiveRecord::Schema.define(:version => 20130927025258) do

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "meishiki_plrs", :force => true do |t|
    t.integer  "meishiki_id"
    t.string   "type"
    t.integer  "tenkan_id"
    t.integer  "chishi_id"
    t.integer  "zoukan_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "meishikis", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "person_id"
  end

  create_table "people", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.datetime "birthday"
    t.boolean  "meikyu"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "person_jobs", :force => true do |t|
    t.integer  "person_id"
    t.integer  "job_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sekkis", :force => true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "hour"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

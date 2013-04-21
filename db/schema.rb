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

ActiveRecord::Schema.define(:version => 20130420155616) do

  create_table "gogyos", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "angle"
  end

  create_table "hentsuseis", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "category"
    t.integer  "inyou"
    t.integer  "point"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "houns", :force => true do |t|
    t.string   "name"
    t.integer  "code"
    t.integer  "point"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "angle"
  end

  create_table "jikkans", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.integer  "inyou"
    t.float    "point"
    t.float    "point_day"
    t.integer  "gogyo_id"
    t.integer  "shi_teiou"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "junishi_gogyos", :force => true do |t|
    t.integer  "junishi_term_id"
    t.integer  "gogyo_id"
    t.float    "point"
    t.float    "point_month"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "junishi_terms", :force => true do |t|
    t.integer  "shi_id"
    t.integer  "term_start"
    t.integer  "term_end"
    t.integer  "zoukan_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "junishis", :force => true do |t|
    t.integer  "code"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "angle"
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
    t.string   "name"
    t.string   "sex"
    t.datetime "birthday"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "meikyu",     :default => false
  end

  create_table "sekkis", :force => true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "day"
    t.integer  "hour"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tentokus", :force => true do |t|
    t.integer  "shi_id"
    t.string   "type"
    t.integer  "tentoku"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end

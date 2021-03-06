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

ActiveRecord::Schema.define(version: 20130817052147) do

  create_table "consumers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.string   "image_code"
    t.decimal  "price",         precision: 6, scale: 2
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meals", force: true do |t|
    t.string   "consumer_name"
    t.integer  "consumer_id"
    t.string   "dish_image_code"
    t.string   "dish_name"
    t.integer  "dish_id"
    t.decimal  "price",                 precision: 6, scale: 2
    t.datetime "meal_date"
    t.string   "restaurant_name"
    t.string   "restaurant_image_code"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "image_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

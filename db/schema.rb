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

ActiveRecord::Schema.define(version: 20160904130604) do

  create_table "weather_dailies", force: :cascade do |t|
    t.integer  "weather_monthly_id"
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "time"
    t.string   "weather"
    t.string   "wdir"
    t.string   "wave"
    t.string   "wvdr"
    t.string   "wvpr"
    t.string   "ocean_temp"
    t.string   "temp"
    t.string   "wdsd"
    t.string   "wdlv"
    t.string   "humd"
    t.string   "pres"
    t.string   "rain"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end

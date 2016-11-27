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

ActiveRecord::Schema.define(version: 20161127142643) do

  create_table "boats", force: :cascade do |t|
    t.string   "name"
    t.float    "fuelConsumption"
    t.float    "fuel_now"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "diaries", force: :cascade do |t|
    t.text     "item"
    t.integer  "ocean_inspect_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["ocean_inspect_id"], name: "index_diaries_on_ocean_inspect_id"
  end

  create_table "mail_lists", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ocean_inspects", force: :cascade do |t|
    t.string   "s_time"
    t.string   "e_time"
    t.integer  "boat_id"
    t.string   "leader"
    t.string   "location"
    t.string   "crew"
    t.string   "gas"
    t.string   "oil"
    t.string   "distance"
    t.string   "captain"
    t.string   "work_items"
    t.string   "note"
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "date"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "pics"
    t.string   "wday"
    t.string   "gas_consumption"
    t.string   "map"
  end

  create_table "staffs", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "role"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "id_number"
  end

  create_table "transportationcrews", force: :cascade do |t|
    t.integer  "staff_id"
    t.string   "direction"
    t.string   "status"
    t.integer  "transportation_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["transportation_id"], name: "index_transportationcrews_on_transportation_id"
  end

  create_table "transportations", force: :cascade do |t|
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "date"
    t.string   "concat"
  end

  create_table "usefuls", force: :cascade do |t|
    t.string   "name"
    t.string   "catalog"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "weather_monthlies", force: :cascade do |t|
    t.string   "year"
    t.string   "month"
    t.string   "day"
    t.string   "weather"
    t.string   "temp"
    t.string   "t_min"
    t.string   "t_max"
    t.string   "wave"
    t.string   "rain"
    t.string   "rain_hour"
    t.string   "sun_rate"
    t.string   "sun_hour"
    t.string   "wdir"
    t.string   "wdsd"
    t.string   "wdlv"
    t.string   "wd_max"
    t.string   "humd"
    t.string   "pres"
    t.string   "visb"
    t.string   "status"
    t.string   "tide"
    t.string   "ocean_temp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

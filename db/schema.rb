# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_05_143046) do

  create_table "carraces", force: :cascade do |t|
    t.integer "car_id"
    t.integer "race_id"
  end

  create_table "cars", force: :cascade do |t|
    t.string "name"
    t.string "color"
    t.integer "shell_id"
    t.integer "engine_id"
    t.integer "tire_id"
    t.integer "user_id"
  end

  create_table "engines", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "engine_type"
    t.integer "acceleration"
    t.integer "speed"
    t.integer "handling"
    t.integer "weight"
    t.integer "reliability"
    t.integer "cost"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "weather"
    t.integer "car_id"
  end

  create_table "races", force: :cascade do |t|
    t.integer "location_id"
    t.integer "car_id"
    t.boolean "win"
  end

  create_table "shells", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "shell_type"
    t.integer "acceleration"
    t.integer "speed"
    t.integer "handling"
    t.integer "weight"
    t.integer "reliability"
    t.integer "cost"
  end

  create_table "tires", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "tire_type"
    t.integer "acceleration"
    t.integer "speed"
    t.integer "handling"
    t.integer "weight"
    t.integer "reliability"
    t.integer "cost"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "cash"
  end

end

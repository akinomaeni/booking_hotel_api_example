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

ActiveRecord::Schema.define(version: 20180123062620) do

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "room_id", null: false
    t.date "first_night_on", null: false
    t.date "last_night_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_bookings_on_room_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_stocks", force: :cascade do |t|
    t.integer "room_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id", "date"], name: "index_room_stocks_on_room_id_and_date", unique: true
    t.index ["room_id"], name: "index_room_stocks_on_room_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name", null: false
    t.integer "hotel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_room_types_on_hotel_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name", null: false
    t.integer "room_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

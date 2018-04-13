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

ActiveRecord::Schema.define(version: 20180413014632) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "total_price", limit: 24
    t.integer "total_ticket"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_bills_on_deleted_at"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "booked_seats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "no_of_seat"
    t.integer "bill_id"
    t.integer "schedule_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "number_of_seats"
    t.datetime "deleted_at"
    t.bigint "type_of_bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_buses_on_deleted_at"
    t.index ["type_of_bus_id"], name: "index_buses_on_type_of_bus_id"
  end

  create_table "intervals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "pick_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_pick_addresses_on_address_id"
  end

  create_table "roads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "route_pick_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "route_id"
    t.bigint "pick_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time_from_address"
    t.index ["pick_address_id"], name: "index_route_pick_addresses_on_pick_address_id"
    t.index ["route_id"], name: "index_route_pick_addresses_on_route_id"
  end

  create_table "routes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "origin_id"
    t.bigint "destination_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "road_id"
    t.index ["deleted_at"], name: "index_routes_on_deleted_at"
    t.index ["destination_id"], name: "index_routes_on_destination_id"
    t.index ["origin_id"], name: "index_routes_on_origin_id"
    t.index ["road_id"], name: "index_routes_on_road_id"
  end

  create_table "schedules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "price", limit: 24
    t.string "time_start"
    t.integer "time_spent"
    t.datetime "deleted_at"
    t.bigint "bus_id"
    t.bigint "route_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "interval_id"
    t.date "date"
    t.integer "start_station_id"
    t.integer "final_station_id"
    t.index ["bus_id"], name: "index_schedules_on_bus_id"
    t.index ["deleted_at"], name: "index_schedules_on_deleted_at"
    t.index ["route_id"], name: "index_schedules_on_route_id"
  end

  create_table "seats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "number"
    t.bigint "type_of_seat_id"
    t.bigint "type_of_bus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_of_bus_id"], name: "index_seats_on_type_of_bus_id"
    t.index ["type_of_seat_id"], name: "index_seats_on_type_of_seat_id"
  end

  create_table "type_of_buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_of_seats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "ticket_price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "phone_number"
    t.boolean "admin"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

  add_foreign_key "route_pick_addresses", "pick_addresses"
  add_foreign_key "route_pick_addresses", "routes"
end

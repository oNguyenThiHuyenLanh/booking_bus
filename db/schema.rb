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

ActiveRecord::Schema.define(version: 20180504074050) do

  create_table "active_seat_coordinates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "column"
    t.integer "row"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_bus_id"
    t.bigint "type_of_seat_id"
    t.integer "floor"
    t.index ["model_bus_id"], name: "index_active_seat_coordinates_on_model_bus_id"
    t.index ["type_of_seat_id"], name: "index_active_seat_coordinates_on_type_of_seat_id"
  end

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "total_price", limit: 24
    t.integer "total_ticket"
    t.bigint "user_id"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "schedule_id"
    t.index ["deleted_at"], name: "index_bills_on_deleted_at"
    t.index ["schedule_id"], name: "index_bills_on_schedule_id"
    t.index ["user_id"], name: "index_bills_on_user_id"
  end

  create_table "booked_seats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "no_of_seat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "bill_id"
    t.index ["bill_id"], name: "index_booked_seats_on_bill_id"
  end

  create_table "buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "number_of_seats"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_bus_id"
    t.index ["deleted_at"], name: "index_buses_on_deleted_at"
    t.index ["model_bus_id"], name: "index_buses_on_model_bus_id"
  end

  create_table "intervals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "model_buses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "amount_of_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_floors"
    t.integer "number_of_rows"
    t.integer "number_of_columns"
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
    t.bigint "interval_id"
    t.date "date"
    t.integer "start_station_id"
    t.integer "final_station_id"
    t.index ["bus_id"], name: "index_schedules_on_bus_id"
    t.index ["deleted_at"], name: "index_schedules_on_deleted_at"
    t.index ["interval_id"], name: "fk_rails_02ef17220c"
    t.index ["route_id"], name: "index_schedules_on_route_id"
  end

  create_table "type_of_seats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.float "bonus_price", limit: 24
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "phone_number"
    t.boolean "admin"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_seat_coordinates", "model_buses"
  add_foreign_key "active_seat_coordinates", "type_of_seats"
  add_foreign_key "bills", "schedules"
  add_foreign_key "bills", "users"
  add_foreign_key "booked_seats", "bills"
  add_foreign_key "buses", "model_buses"
  add_foreign_key "route_pick_addresses", "pick_addresses"
  add_foreign_key "route_pick_addresses", "routes"
  add_foreign_key "routes", "addresses", column: "destination_id"
  add_foreign_key "routes", "addresses", column: "origin_id"
  add_foreign_key "routes", "roads"
  add_foreign_key "schedules", "buses"
  add_foreign_key "schedules", "intervals"
  add_foreign_key "schedules", "routes"
end

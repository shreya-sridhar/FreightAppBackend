# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_11_062406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "description"
    t.bigint "ride_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ride_id"], name: "index_items_on_ride_id"
  end

  create_table "rides", force: :cascade do |t|
    t.string "pickup_location"
    t.string "drop_location"
    t.float "pickup_lat"
    t.float "pickup_lng"
    t.float "drop_lat"
    t.float "drop_lng"
    t.float "estimated_bill"
    t.float "actual_bill"
    t.datetime "pickup_time"
    t.float "discount"
    t.string "vehicle_type"
    t.string "status"
    t.bigint "driver_id"
    t.bigint "customer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_rides_on_customer_id"
    t.index ["driver_id"], name: "index_rides_on_driver_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "Description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "email"
    t.text "wallet"
    t.float "driver_star_rating"
    t.float "customer_star_rating"
    t.string "status"
    t.boolean "is_driver"
    t.string "vehicle_type"
    t.string "vehicle_number"
    t.string "password_digest"
    t.string "latitude"
    t.string "longitude"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "items", "rides"
  add_foreign_key "rides", "users", column: "customer_id"
  add_foreign_key "rides", "users", column: "driver_id"
end

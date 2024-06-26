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

ActiveRecord::Schema[7.1].define(version: 2024_04_17_194803) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "van_id", null: false
    t.bigint "person_id", null: false
    t.string "drivers_license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_drivers_on_company_id"
    t.index ["person_id"], name: "index_drivers_on_person_id"
    t.index ["van_id"], name: "index_drivers_on_van_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.string "cpf"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_people_on_company_id"
  end

  create_table "students", force: :cascade do |t|
    t.boolean "checkin"
    t.bigint "van_id", null: false
    t.string "home_address"
    t.string "destination_address"
    t.bigint "person_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_students_on_person_id"
    t.index ["van_id"], name: "index_students_on_van_id"
  end

  create_table "vans", force: :cascade do |t|
    t.string "license_plate"
    t.string "color"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_vans_on_company_id"
  end

  add_foreign_key "drivers", "companies"
  add_foreign_key "drivers", "people"
  add_foreign_key "drivers", "vans"
  add_foreign_key "people", "companies"
  add_foreign_key "students", "people"
  add_foreign_key "students", "vans"
  add_foreign_key "vans", "companies"
end

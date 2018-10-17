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

ActiveRecord::Schema.define(version: 20181017203813) do

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.boolean "opioid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.integer "strength"
    t.string "strength_unit"
    t.string "form"
    t.integer "drug_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescribers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescription_histories", force: :cascade do |t|
    t.integer "prescriber_id"
    t.integer "hospital_id"
    t.integer "medication_id"
    t.integer "prescription_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_prescription_histories_on_hospital_id"
    t.index ["medication_id"], name: "index_prescription_histories_on_medication_id"
    t.index ["prescriber_id"], name: "index_prescription_histories_on_prescriber_id"
    t.index ["prescription_id"], name: "index_prescription_histories_on_prescription_id"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.integer "frequency_per_day"
    t.integer "days_supply"
    t.integer "disease_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disease_id"], name: "index_prescriptions_on_disease_id"
  end

end

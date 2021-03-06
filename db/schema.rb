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

ActiveRecord::Schema.define(version: 2019_03_26_213419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "documents", force: :cascade do |t|
    t.string "number"
    t.string "document_type"
    t.string "country"
    t.date "valid_from"
    t.date "valid_until"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "face_file_name"
    t.string "face_content_type"
    t.integer "face_file_size"
    t.datetime "face_updated_at"
    t.string "document_front_file_name"
    t.string "document_front_content_type"
    t.integer "document_front_file_size"
    t.datetime "document_front_updated_at"
    t.string "document_back_file_name"
    t.string "document_back_content_type"
    t.integer "document_back_file_size"
    t.datetime "document_back_updated_at"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_photos_on_document_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.date "pickup_date"
    t.string "pickup_location"
    t.date "dropoff_date"
    t.string "dropoff_location"
    t.bigint "user_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_rentals_on_user_id"
    t.index ["vehicle_id"], name: "index_rentals_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "gender"
    t.string "id_number"
    t.date "date_of_birth"
    t.string "citizenship"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "reg_number"
    t.boolean "available_indicator"
    t.string "make"
    t.string "model"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verification_sessions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "status"
    t.bigint "user_id"
    t.bigint "document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_verification_sessions_on_document_id"
    t.index ["user_id"], name: "index_verification_sessions_on_user_id"
  end

  add_foreign_key "documents", "users"
  add_foreign_key "photos", "documents"
  add_foreign_key "rentals", "users"
  add_foreign_key "verification_sessions", "documents"
  add_foreign_key "verification_sessions", "users"
end

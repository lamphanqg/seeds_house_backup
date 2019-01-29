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

ActiveRecord::Schema.define(version: 2019_01_29_130651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companionships", id: false, force: :cascade do |t|
    t.bigint "species_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id", "species_id"], name: "index_companionships_on_friend_id_and_species_id", unique: true
    t.index ["species_id", "friend_id"], name: "index_companionships_on_species_id_and_friend_id", unique: true
  end

  create_table "plant_seasons", force: :cascade do |t|
    t.bit "sow_months", limit: 36
    t.bit "plant_months", limit: 36
    t.bit "harvest_months", limit: 36
    t.bigint "species_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["species_id"], name: "index_plant_seasons_on_species_id"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "planted_number"
    t.date "sowed_at"
    t.date "planted_at"
    t.bigint "species_id"
    t.bigint "ridges_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ridges_id"], name: "index_plants_on_ridges_id"
    t.index ["species_id"], name: "index_plants_on_species_id"
  end

  create_table "ridges", force: :cascade do |t|
    t.integer "area"
    t.date "started_at"
    t.date "ended_at"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ridges_on_user_id"
  end

  create_table "species", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "family"
  end

  create_table "users", force: :cascade do |t|
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

end

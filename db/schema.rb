# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150809030551) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "neighborhood"
    t.string   "map_url"
    t.text     "address"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "description"
    t.string   "registration_url"
    t.string   "location_name"
    t.datetime "registration_deadline"
    t.string   "program_type"
    t.string   "logo_url"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "online_address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.boolean  "is_online"
    t.string   "hide_reason"
    t.boolean  "hide"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.integer  "price_level"
    t.integer  "min_age"
    t.integer  "max_age"
    t.text     "extra_data"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "organizer_id"
    t.integer  "topic_id"
  end

  add_index "opportunities", ["organizer_id"], name: "index_opportunities_on_organizer_id", using: :btree
  add_index "opportunities", ["topic_id"], name: "index_opportunities_on_topic_id", using: :btree

  create_table "opportunity_instances", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.text     "description"
    t.string   "registration_url"
    t.string   "location_name"
    t.datetime "registration_deadline"
    t.string   "program_type"
    t.string   "logo_url"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "online_address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "state"
    t.boolean  "is_online"
    t.string   "hide_reason"
    t.boolean  "hide"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_phone"
    t.integer  "price_level"
    t.integer  "min_age"
    t.integer  "max_age"
    t.text     "extra_data"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "opportunity_id"
    t.integer  "location_id"
    t.boolean  "ongoing"
    t.integer  "price"
    t.string   "url"
    t.string   "external_url"
    t.boolean  "listed"
    t.integer  "topic_id"
    t.text     "short_description"
    t.string   "neighborhood"
    t.integer  "duration"
    t.integer  "difficulty"
  end

  add_index "opportunity_instances", ["difficulty"], name: "index_opportunity_instances_on_difficulty", using: :btree
  add_index "opportunity_instances", ["duration"], name: "index_opportunity_instances_on_duration", using: :btree
  add_index "opportunity_instances", ["location_id"], name: "index_opportunity_instances_on_location_id", using: :btree
  add_index "opportunity_instances", ["opportunity_id"], name: "index_opportunity_instances_on_opportunity_id", using: :btree
  add_index "opportunity_instances", ["topic_id"], name: "index_opportunity_instances_on_topic_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "logo_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "topic_id"
  end

  add_index "organizers", ["topic_id"], name: "index_organizers_on_topic_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.string   "short_name"
    t.string   "child_of_topic"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "opportunities", "topics"
  add_foreign_key "opportunity_instances", "locations"
  add_foreign_key "opportunity_instances", "topics"
  add_foreign_key "organizers", "topics"
end

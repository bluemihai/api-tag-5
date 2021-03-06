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

ActiveRecord::Schema.define(version: 20160314044347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_challenges", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "challenge_id"
    t.boolean  "active",       default: true
    t.string   "comments"
    t.datetime "starting"
    t.datetime "ending"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "aktions", force: :cascade do |t|
    t.datetime "timeslot"
    t.string   "focus"
    t.integer  "player_id"
    t.integer  "verb_id"
    t.integer  "project_id"
    t.integer  "flow"
    t.text     "flow_notes"
    t.integer  "value"
    t.text     "value_notes"
    t.integer  "visible_to"
    t.integer  "status"
    t.integer  "intensity"
    t.text     "how_it_went"
    t.string   "time_zone"
    t.integer  "location_id"
    t.integer  "role_id"
    t.text     "properties"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "team_id"
    t.boolean  "completed",               default: false
    t.date     "planned_date"
    t.integer  "planned_sequence_number"
    t.boolean  "planned",                 default: false
    t.datetime "started_at"
    t.datetime "stopped_at"
  end

  create_table "challenges", force: :cascade do |t|
    t.boolean  "daily"
    t.boolean  "weekly"
    t.integer  "item_type"
    t.integer  "operation_type"
    t.integer  "greater_than"
    t.integer  "less_than"
    t.boolean  "available"
    t.integer  "creator_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "comments"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "accepter_id"
    t.boolean  "accepted",     default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "insights", force: :cascade do |t|
    t.string   "text"
    t.string   "category"
    t.integer  "player_id"
    t.integer  "aktion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interruptions", force: :cascade do |t|
    t.boolean  "internal"
    t.boolean  "recovered"
    t.integer  "aktion_id"
    t.string   "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.integer  "role"
    t.string   "email"
    t.boolean  "fictional",         default: false
    t.string   "current_time_zone", default: "Pacific Time (US & Canada)"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.text     "preferences"
    t.string   "api_key"
  end

  create_table "project_memberships", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "player_id"
    t.boolean  "active",     default: true
    t.boolean  "owner"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.boolean  "active"
    t.boolean  "commitment"
    t.integer  "visible_to"
    t.string   "ancestry"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.integer  "parent_id"
    t.integer  "creator_id"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "player_id"
    t.boolean  "active",     default: true
    t.boolean  "primary"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
    t.integer  "parent_id"
    t.string   "short"
    t.integer  "external_id"
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "team_id"
    t.boolean  "active",      default: true
    t.boolean  "admin",       default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "api_key"
    t.integer  "external_id"
    t.string   "color"
  end

  create_table "teams", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.string   "url"
    t.string   "logo_url"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "short"
    t.string   "default_color", default: "#FFFFFF"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "role"
    t.string   "email"
    t.boolean  "fictional",         default: false
    t.string   "current_time_zone", default: "Pacific Time (US & Canada)"
  end

  create_table "verbs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "intensity"
    t.integer  "creator_id"
    t.string   "examples"
    t.integer  "level"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end

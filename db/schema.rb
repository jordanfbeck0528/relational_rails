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


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hockey_teams", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "rank"
    t.boolean "original_franchise"
    t.integer "stanley_cups"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.boolean "attended_college"
    t.integer "years_played"
    t.bigint "hockey_team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["hockey_team_id"], name: "index_players_on_hockey_team_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.integer "days_in_school_year"
    t.boolean "accepts_financial_aid", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.boolean "needs_financial_aid"
    t.bigint "school_id"
    t.integer "school_days_completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  add_foreign_key "players", "hockey_teams"
  add_foreign_key "students", "schools"
end

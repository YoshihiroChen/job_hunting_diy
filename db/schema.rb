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

ActiveRecord::Schema.define(version: 2025_05_03_075939) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "job_roles", force: :cascade do |t|
    t.string "industry"
    t.string "role"
    t.string "literature_ok"
    t.text "traits"
    t.text "note"
    t.text "extraversion_text"
    t.text "rational_text"
    t.text "decisive_text"
    t.text "creative_text"
    t.text "plan_text"
    t.text "leader_text"
    t.text "realistic_text"
    t.text "disciplined_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end

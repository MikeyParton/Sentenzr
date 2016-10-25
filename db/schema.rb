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

ActiveRecord::Schema.define(version: 20161025032349) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complements", force: :cascade do |t|
    t.string   "word"
    t.string   "pronoun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "definitions", force: :cascade do |t|
    t.text     "entry"
    t.text     "example"
    t.integer  "definable_id"
    t.string   "definable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "sentences", force: :cascade do |t|
    t.string   "tense"
    t.string   "structure"
    t.integer  "subject_id"
    t.integer  "verb_id"
    t.integer  "complement_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "tense_modifier"
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "word"
    t.string   "pronoun"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "translations", force: :cascade do |t|
    t.text     "entry"
    t.text     "explanation"
    t.integer  "language"
    t.integer  "translatable_id"
    t.string   "translatable_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "verbs", force: :cascade do |t|
    t.string   "word"
    t.string   "present_simple"
    t.string   "continuous"
    t.string   "past_simple"
    t.string   "past_participle"
    t.string   "kind"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end

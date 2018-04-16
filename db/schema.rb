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

ActiveRecord::Schema.define(version: 20180416075735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "website_url"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gt_metrix_tests", force: :cascade do |t|
    t.bigint "company_id"
    t.integer "page_load_time"
    t.integer "pagespeed_score"
    t.integer "yslow_score"
    t.integer "fully_loaded_time"
    t.string "report_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.index ["company_id"], name: "index_gt_metrix_tests_on_company_id"
  end

  create_table "test_logs", force: :cascade do |t|
    t.bigint "company_id"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_test_logs_on_company_id"
  end

  create_table "testing_jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "test_id"
    t.index ["company_id"], name: "index_testing_jobs_on_company_id"
  end

  add_foreign_key "gt_metrix_tests", "companies"
  add_foreign_key "test_logs", "companies"
  add_foreign_key "testing_jobs", "companies"
end

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

ActiveRecord::Schema[7.1].define(version: 2024_05_11_102014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blacklists", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "website_id", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blacklists_on_user_id"
    t.index ["website_id"], name: "index_blacklists_on_website_id"
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "website_id", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_logs_on_user_id"
    t.index ["website_id"], name: "index_logs_on_website_id"
  end

  create_table "notfications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "website_id", null: false
    t.integer "duration"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notfications_on_user_id"
    t.index ["website_id"], name: "index_notfications_on_website_id"
  end

  create_table "summaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "website_id", null: false
    t.datetime "Notiftime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_summaries_on_user_id"
    t.index ["website_id"], name: "index_summaries_on_website_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "websites", force: :cascade do |t|
    t.string "url"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blacklists", "users"
  add_foreign_key "blacklists", "websites"
  add_foreign_key "logs", "users"
  add_foreign_key "logs", "websites"
  add_foreign_key "notfications", "users"
  add_foreign_key "notfications", "websites"
  add_foreign_key "summaries", "users"
  add_foreign_key "summaries", "websites"
end

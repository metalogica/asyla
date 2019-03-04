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

ActiveRecord::Schema.define(version: 2019_03_04_184737) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dependencies", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "depends_on_task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["depends_on_task_id"], name: "index_dependencies_on_depends_on_task_id"
    t.index ["task_id"], name: "index_dependencies_on_task_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "name"
    t.boolean "completed"
    t.bigint "category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_goals_on_category_id"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "records", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "attachment"
    t.bigint "task_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["task_id"], name: "index_records_on_task_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "details"
    t.boolean "completed"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.bigint "goal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "deadline"
    t.datetime "start"
    t.datetime "end"
    t.index ["goal_id"], name: "index_tasks_on_goal_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.string "nationality"
    t.string "language"
    t.string "address"
    t.string "avatar"
    t.boolean "admin"
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "dependencies", "tasks"
  add_foreign_key "dependencies", "tasks", column: "depends_on_task_id"
  add_foreign_key "goals", "categories"
  add_foreign_key "goals", "users"
  add_foreign_key "records", "tasks"
  add_foreign_key "records", "users"
  add_foreign_key "tasks", "goals"
  add_foreign_key "tasks", "users"
end

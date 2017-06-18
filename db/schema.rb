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

ActiveRecord::Schema.define(version: 20170618111757) do

  create_table "account_term_msts", force: :cascade do |t|
    t.integer "year"
    t.integer "month"
    t.date "start_date"
    t.date "end_date"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "message"
    t.integer "user_id"
    t.integer "security"
    t.string "link"
    t.string "service"
    t.integer "service_id"
    t.boolean "already_read"
    t.boolean "delete_flg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_user"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pay_item_details", force: :cascade do |t|
    t.integer "_id"
    t.integer "pay_item_id"
    t.string "key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pay_items", force: :cascade do |t|
    t.integer "_id"
    t.string "code"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "_id"
    t.integer "zaim_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

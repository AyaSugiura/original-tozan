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

ActiveRecord::Schema.define(version: 20180717054736) do

  create_table "galleries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "image"
    t.string   "comment"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_galleries_on_manager_id", using: :btree
  end

  create_table "information", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content"
    t.integer  "manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_information_on_manager_id", using: :btree
  end

  create_table "managers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "loginid"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "mountains", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "area"
    t.string   "climbing_date"
    t.string   "height"
    t.string   "time"
    t.string   "distance"
    t.string   "height_difference"
    t.integer  "view"
    t.integer  "recommend"
    t.integer  "fatigue"
    t.integer  "manager_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.text     "comment",           limit: 65535
    t.string   "route"
    t.index ["manager_id"], name: "index_mountains_on_manager_id", using: :btree
  end

  create_table "photos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image"
    t.string   "comment"
    t.integer  "mountain_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mountain_id"], name: "index_photos_on_mountain_id", using: :btree
  end

  add_foreign_key "galleries", "managers"
  add_foreign_key "information", "managers"
  add_foreign_key "mountains", "managers"
  add_foreign_key "photos", "mountains"
end

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

ActiveRecord::Schema.define(version: 20150828210837) do

  create_table "arguments", force: :cascade do |t|
    t.text     "statement"
    t.integer  "validity",   limit: 8, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "arguments", ["slug"], name: "index_arguments_on_slug", unique: true

  create_table "bitcoin_addresses", force: :cascade do |t|
    t.string   "bitcoin_address", limit: 255
    t.integer  "balance",         limit: 8,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "signatures", force: :cascade do |t|
    t.integer  "argument_id"
    t.boolean  "negation",                       default: false
    t.string   "signature",          limit: 255
    t.integer  "bitcoin_address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "signatures", ["argument_id", "bitcoin_address_id"], name: "index_signatures_on_argument_id_and_bitcoin_address_id"
  add_index "signatures", ["argument_id"], name: "index_signatures_on_argument_id"
  add_index "signatures", ["bitcoin_address_id"], name: "index_signatures_on_bitcoin_address_id"

end

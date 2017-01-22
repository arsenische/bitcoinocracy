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

ActiveRecord::Schema.define(version: 20161119193533) do

  create_table "arguments", force: :cascade do |t|
    t.text     "statement"
    t.integer  "validity",   limit: 8, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "pros_sum",   limit: 8, default: 0
    t.integer  "cons_sum",   limit: 8, default: 0
    t.integer  "all_sum",    limit: 8, default: 0
    t.integer  "min_sum",    limit: 8, default: 0
    t.string   "aasm_state",           default: "visible"
  end

  add_index "arguments", ["slug"], name: "index_arguments_on_slug", unique: true
  add_index "arguments", ["statement"], name: "index_arguments_on_statement", unique: true

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index"
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index"
  add_index "audits", ["created_at"], name: "index_audits_on_created_at"
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid"
  add_index "audits", ["user_id", "user_type"], name: "user_index"

  create_table "bitcoin_addresses", force: :cascade do |t|
    t.string   "bitcoin_address"
    t.integer  "balance",         limit: 8, default: 0
    t.datetime "updated_at"
  end

  add_index "bitcoin_addresses", ["bitcoin_address"], name: "index_bitcoin_addresses_on_bitcoin_address", unique: true

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

  create_table "signatures", id: false, force: :cascade do |t|
    t.integer "argument_id"
    t.boolean "negation",           default: false
    t.string  "signature",                          null: false
    t.integer "bitcoin_address_id"
  end

  add_index "signatures", ["argument_id", "bitcoin_address_id", "negation"], name: "unique_signature", unique: true
  add_index "signatures", ["argument_id", "bitcoin_address_id"], name: "index_signatures_on_argument_id_and_bitcoin_address_id"
  add_index "signatures", ["argument_id"], name: "index_signatures_on_argument_id"
  add_index "signatures", ["bitcoin_address_id"], name: "index_signatures_on_bitcoin_address_id"
  add_index "signatures", ["signature"], name: "unique_signature_primary", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

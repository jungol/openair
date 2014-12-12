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

ActiveRecord::Schema.define(version: 20141212144841) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "abstract"
    t.integer  "publication_id"
    t.integer  "first_page"
    t.integer  "last_page"
  end

  add_index "articles", ["publication_id"], name: "index_articles_on_publication_id"

  create_table "authors", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "citations", force: true do |t|
    t.integer  "citing_id"
    t.integer  "cited_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "citations", ["cited_id"], name: "index_citations_on_cited_id"
  add_index "citations", ["citing_id", "cited_id"], name: "index_citations_on_citing_id_and_cited_id", unique: true
  add_index "citations", ["citing_id"], name: "index_citations_on_citing_id"

  create_table "copies", force: true do |t|
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edits", force: true do |t|
    t.integer  "author_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "journals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "publications", force: true do |t|
    t.integer  "issue"
    t.integer  "year"
    t.integer  "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "journal_id"
  end

  add_index "publications", ["journal_id"], name: "index_publications_on_journal_id"

  create_table "sections", force: true do |t|
    t.string   "heading"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.text     "content"
  end

  add_index "sections", ["article_id"], name: "index_sections_on_article_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "box"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

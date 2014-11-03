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

ActiveRecord::Schema.define(version: 20141103222200) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "abstract"
  end

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

  create_table "published_articles", force: true do |t|
    t.integer  "author_id"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "publication_id"
  end

  add_index "published_articles", ["article_id"], name: "index_published_articles_on_article_id"
  add_index "published_articles", ["author_id", "article_id"], name: "index_published_articles_on_author_id_and_article_id", unique: true
  add_index "published_articles", ["author_id"], name: "index_published_articles_on_author_id"
  add_index "published_articles", ["publication_id"], name: "index_published_articles_on_publication_id"

  create_table "sections", force: true do |t|
    t.string   "heading"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.text     "content"
  end

  add_index "sections", ["article_id"], name: "index_sections_on_article_id"

end

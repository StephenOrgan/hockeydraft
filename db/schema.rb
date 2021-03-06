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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130418045458) do

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "commissioner_id"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "lr_forwards"
    t.integer  "lr_defensemen"
    t.integer  "lr_goalies"
    t.string   "season"
  end

  create_table "picks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "league_id"
  end

  create_table "players", :force => true do |t|
    t.string   "name"
    t.integer  "player_id"
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "points"
    t.string   "position"
    t.string   "string"
    t.integer  "shutouts"
    t.integer  "wins"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "team"
    t.integer  "gp"
    t.integer  "gwg"
    t.integer  "ot"
    t.integer  "losses"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "team_id"
    t.string   "integer"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "player_id"
    t.integer  "league_id"
    t.integer  "draftrank"
    t.integer  "user_id"
    t.string   "status"
    t.string   "direction"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "team_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end

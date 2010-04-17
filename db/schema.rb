# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100416205750) do

  create_table "cidrs", :force => true do |t|
    t.string   "cidr",                         :null => false
    t.string   "name",                         :null => false
    t.text     "comments",     :default => "", :null => false
    t.integer  "proxy",        :default => 0,  :null => false
    t.integer  "lock_version", :default => 0,  :null => false
    t.integer  "position",     :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ip_addresses", :force => true do |t|
    t.string   "ip_address",                     :null => false
    t.string   "name",         :default => "",   :null => false
    t.text     "comments",     :default => "",   :null => false
    t.integer  "cidr_id",                        :null => false
    t.integer  "ip_hex",                         :null => false
    t.integer  "lock_version", :default => 0,    :null => false
    t.boolean  "free",         :default => true, :null => false
    t.boolean  "usable",       :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

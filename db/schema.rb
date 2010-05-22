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

ActiveRecord::Schema.define(:version => 20100421112520) do

  create_table "assignments", :force => true do |t|
    t.integer  "host_id",       :null => false
    t.integer  "ip_address_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cidrs", :force => true do |t|
    t.string   "cidr",                         :null => false
    t.string   "name",                         :null => false
    t.text     "comments",     :default => "", :null => false
    t.string   "proxy",        :default => "", :null => false
    t.integer  "lock_version", :default => 0,  :null => false
    t.integer  "position",     :default => 0,  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cidrs", ["position"], :name => "index_cidrs_on_position"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "host_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hosts", :force => true do |t|
    t.string   "name",                         :null => false
    t.text     "comments",     :default => "", :null => false
    t.integer  "host_type_id",                 :null => false
    t.integer  "lock_version", :default => 0,  :null => false
    t.boolean  "eol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ip_addresses", :force => true do |t|
    t.string   "ip_address",                                  :null => false
    t.string   "name",                      :default => "",   :null => false
    t.text     "comments",                  :default => "",   :null => false
    t.integer  "cidr_id",                                     :null => false
    t.integer  "host_id"
    t.integer  "ip_hex",       :limit => 8,                   :null => false
    t.integer  "lock_version",              :default => 0,    :null => false
    t.boolean  "free",                      :default => true, :null => false
    t.boolean  "usable",                    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ip_addresses", ["cidr_id", "free", "usable"], :name => "index_ip_addresses_on_cidr_id_and_free_and_usable"
  add_index "ip_addresses", ["cidr_id"], :name => "index_ip_addresses_on_cidr_id"
  add_index "ip_addresses", ["ip_address", "cidr_id"], :name => "index_ip_addresses_on_ip_address_and_cidr_id"
  add_index "ip_addresses", ["ip_hex", "cidr_id"], :name => "index_ip_addresses_on_ip_hex_and_cidr_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "persistence_token"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "verifications", :force => true do |t|
    t.integer  "ip_address_id",  :null => false
    t.string   "lookup"
    t.string   "reverse_lookup"
    t.boolean  "ping"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

class CreateIpAddresses < ActiveRecord::Migration
  def self.up
    create_table :ip_addresses do |t|
      t.string  :ip_address,    :null => false
      t.string  :name,          :null => false, :default => ""
      t.text    :comments,      :null => false, :default => ""
      t.integer :cidr_id,       :null => false
      t.integer :host_id,       :null => true
      t.integer :ip_hex,        :null => false, :limit => 8
      t.integer :lock_version,  :null => false, :default => 0
      t.boolean :free,          :null => false, :default => true
      t.boolean :usable,        :null => false, :default => true
      t.timestamps
    end
    add_index :ip_addresses, :cidr_id
    add_index :ip_addresses, [:ip_hex, :cidr_id]
    add_index :ip_addresses, [:ip_address, :cidr_id]
    add_index :ip_addresses, [:cidr_id, :free, :usable]
  end
  
  def self.down
    remove_index :ip_addresses, :cidr_id
    remove_index :ip_addresses, [:ip_hex, :cidr_id]
    remove_index :ip_addresses, [:ip_address, :cidr_id]
    remove_index :ip_addresses, [:cidr_id, :free, :usable]
    drop_table :ip_addresses
  end
end

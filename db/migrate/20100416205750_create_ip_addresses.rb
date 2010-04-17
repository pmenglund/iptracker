class CreateIpAddresses < ActiveRecord::Migration
  def self.up
    create_table :ip_addresses do |t|
      t.string  :ip_address,    :null => false
      t.string  :name,          :null => false, :default => ""
      t.text    :comments,      :null => false, :default => ""
      t.integer :cidr_id,       :null => false
      t.integer :ip_hex,        :null => false
      t.integer :lock_version,  :null => false, :default => 0
      t.boolean :free,          :null => false, :default => true
      t.boolean :usable,        :null => false, :default => true
      t.timestamps
    end
  end
  
  def self.down
    drop_table :ip_addresses
  end
end

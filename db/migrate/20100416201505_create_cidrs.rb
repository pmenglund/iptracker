class CreateCidrs < ActiveRecord::Migration
  def self.up
    create_table :cidrs do |t|
      t.string  :cidr,          :null => false
      t.string  :name,          :null => false
      t.text    :comments,      :null => false, :default => ""
      t.string  :proxy,         :null => false, :default => ""
      t.integer :lock_version,  :null => false, :default => 0
      t.integer :position,      :null => false, :default => 0
      t.timestamps
    end
    add_index :cidrs, :position
  end
  
  def self.down
    remove_index :cidrs, :position
    drop_table :cidrs
  end
end

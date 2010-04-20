class CreateHosts < ActiveRecord::Migration
  def self.up
    create_table :hosts do |t|
      t.string  :name,          :null => false
      t.text    :comments,      :null => false, :default => ""
      t.integer :host_type_id,  :null => false
      t.integer :lock_version,  :null => false, :default => 0
      t.boolean :eol
      t.timestamps
    end
  end
  
  def self.down
    drop_table :hosts
  end
end

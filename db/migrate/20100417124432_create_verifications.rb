class CreateVerifications < ActiveRecord::Migration
  def self.up
    create_table :verifications do |t|
      t.integer :ip_address_id,   :null => false
      t.string  :lookup,          :null => false
      t.string  :reverse_lookup,  :null => false
      t.boolean :ping,            :null => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :verifications
  end
end

class CreateVerifications < ActiveRecord::Migration
  def self.up
    create_table :verifications do |t|
      t.integer :ip_address_id,   :null => false
      t.string  :lookup
      t.string  :reverse_lookup
      t.boolean :ping
      t.timestamps
    end
  end
  
  def self.down
    drop_table :verifications
  end
end

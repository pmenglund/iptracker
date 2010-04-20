class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.integer :host_id,       :null => false
      t.integer :ip_address_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :assignments
  end
end

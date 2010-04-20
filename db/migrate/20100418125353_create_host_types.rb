class CreateHostTypes < ActiveRecord::Migration
  def self.up
    create_table :host_types do |t|
      t.string :name
      t.timestamps
    end
    HostType.new(:name => 'Unknown').save
  end
  
  def self.down
    drop_table :host_types
  end
end

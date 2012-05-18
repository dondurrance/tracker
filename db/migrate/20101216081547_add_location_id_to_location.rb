class AddLocationIdToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :location_id, :integer
  end

  def self.down
    remove_column :locations, :location_id
  end
end

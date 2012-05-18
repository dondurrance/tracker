class AddRoomsToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :room_id, :integer
  end

  def self.down
    remove_column :locations, :room_id
  end
end

class AddRoomidToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :room_id, :integer
  end

  def self.down
    remove_column :items, :room_id
  end
end

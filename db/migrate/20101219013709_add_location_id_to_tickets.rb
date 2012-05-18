class AddLocationIdToTickets < ActiveRecord::Migration
  def self.up
     add_column :tickets, :location_id, :integer
  end

  def self.down
    remove_column :tickets, :location_id
  end
end

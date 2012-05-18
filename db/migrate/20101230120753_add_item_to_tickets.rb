class AddItemToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :item_id, :integer
  end

  def self.down
    remove_column :tickets, :item_id
  end
end

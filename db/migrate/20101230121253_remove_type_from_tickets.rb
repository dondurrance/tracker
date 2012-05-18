class RemoveTypeFromTickets < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :type
  end

  def self.down
    add_column :tickets, :type, :string
  end
end

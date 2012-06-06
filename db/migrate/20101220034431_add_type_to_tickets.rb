class AddTypeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :type, :string
  end

  def self.down
    remove_column :tickets, :type
  end
end

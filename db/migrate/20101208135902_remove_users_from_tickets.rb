class RemoveUsersFromTickets < ActiveRecord::Migration
  def self.up
    remove_column :tickets, :user_id
  end

  def self.down
    add_column :tickets, :user_id, :integer
  end
end

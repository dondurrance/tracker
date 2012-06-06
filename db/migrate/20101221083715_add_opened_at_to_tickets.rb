class AddOpenedAtToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :opened_at, :datetime
    add_column :tickets, :closed_at, :datetime
  end

  def self.down
    remove_column :tickets, :closed_at
    remove_column :tickets, :opened_at
  end
end

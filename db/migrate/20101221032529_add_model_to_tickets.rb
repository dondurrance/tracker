class AddModelToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :model_id, :integer
  end

  def self.down
    remove_column :tickets, :model_id
  end
end

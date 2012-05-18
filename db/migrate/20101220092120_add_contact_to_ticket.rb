class AddContactToTicket < ActiveRecord::Migration
  def self.up
    add_column :tickets, :contact_id, :integer
  end

  def self.down
    remove_column :tickets, :contact_id
  end
end

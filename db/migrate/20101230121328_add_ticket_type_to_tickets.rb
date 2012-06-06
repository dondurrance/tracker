class AddTicketTypeToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :ticket_type, :string
  end

  def self.down
    remove_column :tickets, :ticket_type
  end
end

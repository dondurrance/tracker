class AddClientTicketNumberToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :client_ticket_number, :string
  end

  def self.down
    remove_column :tickets, :client_ticket_number
  end
end

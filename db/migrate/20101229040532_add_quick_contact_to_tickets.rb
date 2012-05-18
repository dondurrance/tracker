class AddQuickContactToTickets < ActiveRecord::Migration
  def self.up
    add_column :tickets, :quick_contact_name, :string
    add_column :tickets, :quick_contact_telephone, :string
  end

  def self.down
    remove_column :tickets, :quick_contact_telephone
    remove_column :tickets, :quick_contact_name
  end
end

class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :description
      t.string :status
      t.integer :location_id
      t.integer :room_id
      t.integer :user_id
      t.datetime :opened_at
      t.datetime :closed_at
      t.string :quick_contact_name
      t.string :quick_contact_telephone
      t.string :ticket_type
      t.string :client_ticket_number

      t.timestamps
    end
  end
end

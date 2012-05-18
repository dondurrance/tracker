class ContactsRooms < ActiveRecord::Migration
  def self.up
    create_table :contacts_rooms, :id => false do |t|
      t.references :contact
      t.references :room
    end
  end

  def self.down
    drop_table :contacts_rooms
  end
end

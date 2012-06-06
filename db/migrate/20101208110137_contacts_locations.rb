class ContactsLocations < ActiveRecord::Migration
  def self.up
    create_table :contacts_locations, :id => false do |t|
      t.references :contact
      t.references :location
    end 
  end

  def self.down
    drop_table :contacts_locations
  end
end

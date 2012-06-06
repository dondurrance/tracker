class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :user_id
      t.string :subject
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end

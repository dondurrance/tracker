class AddBackdateToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :backdate, :datetime
  end

  def self.down
    remove_column :notes, :backdate
  end
end

class Room < ActiveRecord::Base
  belongs_to :location
  has_many :tickets
  has_many :items
  has_and_belongs_to_many :contacts
  self.include_root_in_json = false
end

class Room < ActiveRecord::Base
  belongs_to :location
  has_many :tickets
  has_many :items
  self.include_root_in_json = false
end

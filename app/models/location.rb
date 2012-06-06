class Location < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_many :rooms
  has_many :tickets
end

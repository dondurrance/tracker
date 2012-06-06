class Location < ActiveRecord::Base
  has_many :rooms
  has_many :tickets
end

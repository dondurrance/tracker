# This model exists for future expansion as an inventory tracking system
class Manufacturer < ActiveRecord::Base
  has_many :models
end

# This model exists for future expansion as an inventory tracking system
class Model < ActiveRecord::Base
  belongs_to :manufacturer
  has_many :items
end

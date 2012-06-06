class Item < ActiveRecord::Base
  belongs_to :model
  belongs_to :room
  has_many :tickets
  validates :serial_number, :uniqueness => true,
                            :presence => true
                            

  def manufacturer
    self.model.manufacturer
  end

  def name
    self.manufacturer.name + " " + self.model.name
  end

end

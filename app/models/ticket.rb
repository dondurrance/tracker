class Ticket < ActiveRecord::Base
  
  belongs_to :location
  belongs_to :room
  belongs_to :user
  belongs_to :contact
  has_many :notes
  belongs_to :item
 
  validates :room, :presence => true
  validates :subject, :presence => true
  

  def self.possible_statuses?
    ["Open", "Closed", "Pending"]
  end

  def self.possible_types?
    ["Repair", "Integration", "Service"]
  end

  def location
    if self.room then room.location else location end
  end
  
  def opened_at?
    if self.opened_at then self.opened_at else self.created_at end
  end

  before_destroy :prevent_cross_editing
  before_update :prevent_cross_editing

  def prevent_cross_editing
    self.errors.add(:base, "You cannot delete someone else's ticket!") and return false if User.current_user != self.user
  end

end
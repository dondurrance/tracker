class Ticket < ActiveRecord::Base
  before_create :set_defaults
  before_update :set_closed_at

  belongs_to :location
  belongs_to :room
  belongs_to :user
  
  validates :room_id, :presence => true
  validates :subject, :presence => true

  def self.possible_statuses
    ["Open", "Closed", "Pending"]
  end

  def self.possible_types
     ["Repair", "Integration", "Service"]
  end



  private 

  def set_defaults
    if self.opened_at.blank? then
      self.opened_at = Time.now
    end
    if self.ticket_type.blank? then
      self.ticket_type = "Repair"
    end
    if self.status.blank? then
      self.status = "Open"
    end
    if self.location_id.blank? then
      self.location = self.room.location
    end
  end

  def set_closed_at
    if self.status == "Closed" && self.closed_at.blank? then
      self.closed_at = Time.now
    end
  end
end

class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation, :username, :first_name, :last_name
  has_many :tickets
  has_and_belongs_to_many :roles

  validates_length_of :username, :within => 3..40
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password

  def can_write_tickets?
    self.roles.each do |role|
      if role.can_write? then return true end
    end
    false
  end


end

class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  def self.roles_with_write_access
    ['Admin', 'Technician']
  end

  def can_write?
    Role.roles_with_write_access.include?(self.name)
  end

end

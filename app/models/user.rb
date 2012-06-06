class User < ActiveRecord::Base
  cattr_accessor :current_user
  has_many :tickets
  has_and_belongs_to_many :roles
  has_many :notes

  require 'digest/sha1'

  validates_length_of :login, :within => 3..40
  validates_presence_of :login, :hashed_password, :password_confirmation, :salt
  validates_uniqueness_of :login

  validates :password, :confirmation => true, :length => { :in => 5..40 }

  attr_protected :id, :salt, :hashed_password

  attr_accessor :password, :password_confirmation, :role


  def self.random_string(len)
    #generate a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def password=(pass)
    self.salt = User.generate_salt if !self.salt?
    self.hashed_password = User.encrypt(pass, self.salt)
    #next line is required for password validations
    @password = pass
  end

  def self.generate_salt
    User.random_string(10)
  end

  def self.encrypt(pass, salt)
    Digest::SHA1.hexdigest(pass+salt)
  end

  def self.authenticate(username, pass)
    u=find(:first, :conditions=>["login = ?", username])
    return nil if u.nil?
    return u if User.encrypt(pass, u.salt)==u.hashed_password
    nil
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def has_role?(role)
    self.roles.include?(role)
  end

  def can_write_tickets?
    self.roles.each do |role|
      if role.can_write? then return true end
    end
    false
  end

end


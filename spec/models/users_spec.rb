require 'spec_helper'


describe User do
  before (:each) do 
    @valid_attributes = {
      :login => "login",
      :password => "password",
      :password_confirmation => "password"
    }
  end

  it "validates that password and password_confirmation are the same" do
    user = User.new(@valid_attributes.except(:password_confirmation))
    user.should_not be_valid
  end

  it "should create an instance given valid attributes" do
    User.create!(@valid_attributes).should be_valid
  end
  
  it "should require a login name" do
    User.new(:login => "").should_not be_valid
  end

end

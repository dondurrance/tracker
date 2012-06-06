require 'spec_helper'

describe User do
  before (:each) do
    @valid_attributes = {
      :username => "username",
      :password => "password",
      :password_confirmation => "password"
    }
  end

  it "should create an instance given valid attributes" do
    User.create!(@valid_attributes).should be_valid
  end

  it "should require a username" do
    User.new(:username => "").should_not be_valid
  end

end


require 'spec_helper'

describe "Tickets" do
  describe "GET /tickets" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get tickets_path
      response.status.should be(200)
    end
  end
end

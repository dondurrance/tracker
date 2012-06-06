require 'spec_helper'

describe "tickets/show" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :subject => "Subject",
      :description => "MyText",
      :status => "Status",
      :location_id => 1,
      :room_id => 2,
      :user_id => 3,
      :quick_contact_name => "Quick Contact Name",
      :quick_contact_telephone => "Quick Contact Telephone",
      :ticket_type => "Ticket Type",
      :client_ticket_number => "Client Ticket Number"
    ))
    @ticket.location = assign(:location, stub_model(Location, 
      :name => "Location"
    ))
    @ticket.room = assign(:room, stub_model(Room, 
      :name => "Room"
    ))
    @ticket.user = assign(:user, stub_model(User, 
      :username => "Username"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
    rendered.should match(/Status/)
    rendered.should match(/Location/)
    rendered.should match(/Room/)
    rendered.should match(/Username/)
    rendered.should match(/Quick Contact Name/)
    rendered.should match(/Quick Contact Telephone/)
    rendered.should match(/Ticket Type/)
    rendered.should match(/Client Ticket Number/)
  end
end

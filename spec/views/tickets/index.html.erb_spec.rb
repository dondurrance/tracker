require 'spec_helper'

describe "tickets/index" do
  before(:each) do
    @filter = Hash.new
    stub_current_user
    assign(:tickets, [
      stub_model(Ticket,
        :id => 1,
        :subject => "Subject",
        :status => "Status",
        :opened_at => "1",
        :quick_contact_name => "Quick Contact Name",
        :quick_contact_telephone => "Quick Contact Telephone",
        :ticket_type => "Ticket Type",
        :client_ticket_number => "Client Ticket Number"
      ),
      stub_model(Ticket,
        :id => 1,
        :subject => "Subject",
        :status => "Status",
        :opened_at => "1",
        :quick_contact_name => "Quick Contact Name",
        :quick_contact_telephone => "Quick Contact Telephone",
        :ticket_type => "Ticket Type",
        :client_ticket_number => "Client Ticket Number"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "000001".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "Ticket Type".to_s, :count => 2
  end
end

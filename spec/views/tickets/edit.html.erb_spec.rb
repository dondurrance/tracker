require 'spec_helper'

describe "tickets/edit" do
  before(:each) do
    @ticket = assign(:ticket, stub_model(Ticket,
      :subject => "MyString",
      :description => "MyText",
      :status => "MyString",
      :location_id => 1,
      :room_id => 1,
      :user_id => 1,
      :quick_contact_name => "MyString",
      :quick_contact_telephone => "MyString",
      :ticket_type => "MyString",
      :client_ticket_number => "MyString"
    ))
  end

  it "renders the edit ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path(@ticket), :method => "post" do
      assert_select "input#ticket_subject", :name => "ticket[subject]"
      assert_select "textarea#ticket_description", :name => "ticket[description]"
      assert_select "select#ticket_status", :name => "ticket[status]"
      assert_select "select#ticket_location_id", :name => "ticket[location_id]"
      assert_select "select#ticket_room_id", :name => "ticket[room_id]"
      assert_select "input#ticket_quick_contact_name", :name => "ticket[quick_contact_name]"
      assert_select "input#ticket_quick_contact_telephone", :name => "ticket[quick_contact_telephone]"
      assert_select "select#ticket_ticket_type", :name => "ticket[ticket_type]"
      assert_select "input#ticket_client_ticket_number", :name => "ticket[client_ticket_number]"
    end
  end
end

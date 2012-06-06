require "spec_helper"

describe TicketsController do
  describe "routing" do

    it "routes to #index" do
      get("/tickets").should route_to("tickets#index")
    end

    it "routes to #new" do
      get("/tickets/new").should route_to("tickets#new")
    end

    it "routes to #show" do
      get("/tickets/1").should route_to("tickets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tickets/1/edit").should route_to("tickets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tickets").should route_to("tickets#create")
    end

    it "routes to #update" do
      put("/tickets/1").should route_to("tickets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tickets/1").should route_to("tickets#destroy", :id => "1")
    end

  end
end

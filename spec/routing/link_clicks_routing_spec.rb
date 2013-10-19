require "spec_helper"

describe LinkClicksController do
  describe "routing" do

    it "routes to #index" do
      get("/link_clicks").should route_to("link_clicks#index")
    end

    it "routes to #new" do
      get("/link_clicks/new").should route_to("link_clicks#new")
    end

    it "routes to #show" do
      get("/link_clicks/1").should route_to("link_clicks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/link_clicks/1/edit").should route_to("link_clicks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/link_clicks").should route_to("link_clicks#create")
    end

    it "routes to #update" do
      put("/link_clicks/1").should route_to("link_clicks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/link_clicks/1").should route_to("link_clicks#destroy", :id => "1")
    end

  end
end

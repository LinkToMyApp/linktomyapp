require "spec_helper"

describe MobileAppsController do
  describe "routing" do

    it "routes to #index" do
      get("/mobile_apps").should route_to("mobile_apps#index")
    end

    it "routes to #new" do
      get("/mobile_apps/new").should route_to("mobile_apps#new")
    end

    it "routes to #show" do
      get("/mobile_apps/1").should route_to("mobile_apps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mobile_apps/1/edit").should route_to("mobile_apps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mobile_apps").should route_to("mobile_apps#create")
    end

    it "routes to #update" do
      put("/mobile_apps/1").should route_to("mobile_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mobile_apps/1").should route_to("mobile_apps#destroy", :id => "1")
    end

  end
end

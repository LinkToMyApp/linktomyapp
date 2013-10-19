require "spec_helper"

describe AppLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/app_links").should route_to("app_links#index")
    end

    it "routes to #new" do
      get("/app_links/new").should route_to("app_links#new")
    end

    it "routes to #show" do
      get("/app_links/1").should route_to("app_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/app_links/1/edit").should route_to("app_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/app_links").should route_to("app_links#create")
    end

    it "routes to #update" do
      put("/app_links/1").should route_to("app_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/app_links/1").should route_to("app_links#destroy", :id => "1")
    end

  end
end

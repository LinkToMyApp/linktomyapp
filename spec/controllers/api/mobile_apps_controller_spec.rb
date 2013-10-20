require 'spec_helper'

describe Api::MobileAppsController do
	describe "show" do
		it "renders mobile app" do
			mobile_app = FactoryGirl.create(:mobile_app, :name => "toto", :itunes_url => "itunes_url", :icon_url => "icon_url")

			get :show, {:id => mobile_app.to_param}, :format => :json

			resp = JSON.parse(response.body)
			resp["name"].should eq("toto")
			resp["itunes_url"].should eq("itunes_url")
			resp["icon_url"].should eq("icon_url")
		end
	end
end

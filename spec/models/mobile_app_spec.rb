require 'spec_helper'

describe MobileApp do
	describe "create" do
		it "has many app links" do
			mobile_app = FactoryGirl.create(:mobile_app)
			app_links = FactoryGirl.create_list(:app_link, 2)
			
			mobile_app.app_links = app_links
			mobile_app.save!

			MobileApp.find(mobile_app.id).app_links.should =~ app_links
		end
	end
	describe "destroy" do
		it "destroys app links" do
			mobile_app = FactoryGirl.create(:mobile_app, :app_links => FactoryGirl.create_list(:app_link, 2))
			
			mobile_app.destroy!

			AppLink.count.should == 0
		end
	end
end

require 'spec_helper'

describe MobileApp do
	describe "create" do
		it "has one app link" do
			mobile_app = FactoryGirl.create(:mobile_app)
			app_link = FactoryGirl.create(:app_link)
			
			mobile_app.app_link = app_link
			mobile_app.save!

			MobileApp.find(mobile_app.id).app_link.should == app_link
		end
	end
	describe "destroy" do
		it "destroys app links" do
			mobile_app = FactoryGirl.create(:mobile_app, :app_link => FactoryGirl.create(:app_link))
			
			mobile_app.destroy!

			AppLink.count.should == 0
		end
	end
end

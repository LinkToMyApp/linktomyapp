require 'spec_helper'

describe AppLink do
  	describe "create" do
		it "has many app links" do
			app_link = FactoryGirl.create(:app_link)
			link_clicks = FactoryGirl.create_list(:link_click, 2)
			
			app_link.link_clicks = link_clicks
			app_link.save!

			AppLink.find(app_link.id).link_clicks.should =~ link_clicks
		end
	end
	describe "destroy" do
		it "destroys app links" do
			app_link = FactoryGirl.create(:app_link, :link_clicks => FactoryGirl.create_list(:link_click, 2))
			
			app_link.destroy!

			LinkClick.count.should == 0
		end
	end
end

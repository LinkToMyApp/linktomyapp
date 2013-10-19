require 'spec_helper'

describe AppLink do
  	describe "create" do
		it "has many app links" do
			app_link = FactoryGirl.create(:app_link)
			link_clicks = FactoryGirl.create_list(:link_click, 2, :app_link => app_link)

			AppLink.find(app_link.id).link_clicks.should =~ link_clicks
		end

		it "counts link clicks" do
			app_link = FactoryGirl.create(:app_link, :link_clicks => FactoryGirl.create_list(:link_click, 2))

			app_link.reload.link_clicks.count.should == 2
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

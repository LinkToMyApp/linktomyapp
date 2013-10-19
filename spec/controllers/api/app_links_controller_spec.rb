require 'spec_helper'

describe Api::AppLinksController do
	describe "index" do
		it "renders all app_links" do
			FactoryGirl.create(:app_link, :referal => "toto", :link_clicks_count => 2, :installs_count => 1)
			FactoryGirl.create(:app_link, :referal => "titi", :link_clicks_count => 3, :installs_count => 4)

			get :index, :format => :json

			resp = JSON.parse(response.body)
			resp[0]["referal"].should eq("toto")
			resp[0]["link_clicks_count"].should eq(2)
			resp[0]["installs_count"].should eq(1)

			resp[1]["referal"].should eq("titi")
			resp[1]["link_clicks_count"].should eq(3)
			resp[1]["installs_count"].should eq(4)
		end
	end

	describe "clicks" do
		it "returns all clicks by date" do
			app_link = FactoryGirl.create(:app_link, :referal => "toto", :link_clicks_count => 1, :installs_count => 1)
			FactoryGirl.create(:link_click, :app_link => app_link, :created_at => Date.parse("02/01/2013"))

			app_link2 = FactoryGirl.create(:app_link, :referal => "titi", :link_clicks_count => 2, :installs_count => 2)
			FactoryGirl.create(:link_click, :app_link => app_link2, :created_at => Date.parse("02/01/2013"))
			FactoryGirl.create(:link_click, :app_link => app_link2, :created_at => Date.parse("03/01/2013"))

			app_link3 = FactoryGirl.create(:app_link, :referal => "tata", :link_clicks_count => 2, :installs_count => 2)
			FactoryGirl.create(:link_click, :app_link => app_link3, :created_at => Date.parse("02/01/2013"))
			FactoryGirl.create(:link_click, :app_link => app_link3, :created_at => Date.parse("01/01/2013"))

			get :clicks, :format => :json

			resp = JSON.parse(response.body)

			resp["2013-01-01"].count.should == 1
			res1 = resp["2013-01-01"][0]
			res1["referal"].should eq("tata")
			res1["link_clicks_count"].should eq(1)

			resp["2013-01-02"].count.should == 3
			res2 = resp["2013-01-02"][0]
			res2["referal"].should eq("toto")
			res2["link_clicks_count"].should eq(1)
			res3 = resp["2013-01-02"][1]
			res3["referal"].should eq("tata")
			res3["link_clicks_count"].should eq(1)
			res4 = resp["2013-01-02"][2]
			res4["referal"].should eq("titi")
			res4["link_clicks_count"].should eq(1)

			resp["2013-01-03"].count.should == 1
			res5 = resp["2013-01-03"][0]
			res5["referal"].should eq("titi")
			res5["link_clicks_count"].should eq(1)
		end
	end
end

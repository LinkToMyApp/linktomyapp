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

		let(:create_links) do 
			app_link = FactoryGirl.create(:app_link, :referal => "toto", :link_clicks_count => 1, :installs_count => 1)
			FactoryGirl.create(:link_click, :app_link => app_link, :created_at => Date.parse("02/01/2013"))

			app_link2 = FactoryGirl.create(:app_link, :referal => "titi", :link_clicks_count => 2, :installs_count => 2)
			FactoryGirl.create(:link_click, :app_link => app_link2, :created_at => Date.parse("02/01/2013"))
			FactoryGirl.create(:link_click, :app_link => app_link2, :created_at => Date.parse("03/01/2013"))

			app_link3 = FactoryGirl.create(:app_link, :referal => "tata", :link_clicks_count => 2, :installs_count => 2)
			FactoryGirl.create(:link_click, :app_link => app_link3, :created_at => Date.parse("02/01/2013"))
			FactoryGirl.create(:link_click, :app_link => app_link3, :created_at => Date.parse("01/01/2013"))
		end

		context "with referals in params" do
			it "returns all clicks by date" do				
				create_links

				get :clicks, :referals => ["toto", "titi", "tata"], :format => :json

				resp = JSON.parse(response.body)
				resp.keys.count.should == 3

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

			it "returns only selected referals clicks by date" do				
				create_links

				get :clicks, :referals => ["toto"], :format => :json

				resp = JSON.parse(response.body)

				resp.keys.count.should == 1
				resp["2013-01-02"].count.should == 1
				res2 = resp["2013-01-02"][0]
				res2["referal"].should eq("toto")
				res2["link_clicks_count"].should eq(1)
			end
		end	
		

		context "without referals in params" do
			it "returns no clicks" do
				create_links

				get :clicks, :referals => [], :format => :json

				resp = JSON.parse(response.body)
				resp.should eq({})
			end
		end
	end

	describe "app_installed" do
		before(:each) do
			@ip_adress = "1.1.1.1"
			@controller.request.stubs(:remote_ip).returns(@ip_adress)
		end

		let(:mobile_app) { FactoryGirl.create(:mobile_app, :id => 12, :callback_url => @callback_url) }

		let(:app_link) { FactoryGirl.create(:app_link, :mobile_app => mobile_app, :referal => "a_referal") }

		context "link was clicked" do
			context "same IP address" do
				it "returns link click id" do
					FactoryGirl.create(:link_click, :id => 123, :installed => false, :ip_adress => @ip_adress, :app_link => app_link)

					post :app_installed, :app_id => mobile_app.id, :udid => "a_udid", :format => :json

					resp = JSON.parse(response.body)
					resp["link_click_id"].should eq(123)
				end

				it "updates link click status" do
					#stub_request(:any, @callback_url)
					link_click = FactoryGirl.create(:link_click, :id => 123, :installed => false, :ip_adress => @ip_adress, :app_link => app_link)

					post :app_installed, :app_id => mobile_app.id, :udid => "a_udid", :format => :json

					link_click.reload.installed.should == true
				end
			end

			context "different IP address" do
				it "returns random unique id" do
					SecureRandom.stubs(:hex).returns(321)
					FactoryGirl.create(:link_click, :id => 123, :installed => false, :ip_adress => "2.2.2.2", :app_link => app_link)

					post :app_installed, :app_id => mobile_app.id, :udid => "a_udid", :format => :json

					resp = JSON.parse(response.body)
					resp["link_click_id"].should eq(321)
				end

				it "doesn't update the link click status" do
					link_click = FactoryGirl.create(:link_click, :id => 123, :installed => false, :ip_adress => "2.2.2.2", :app_link => app_link)

					post :app_installed, :app_id => mobile_app.id, :udid => "a_udid", :format => :json

					link_click.reload.installed.should == false
				end
			end
		end

		context "link was not clicked" do
			it "returns random unique id" do
				SecureRandom.stubs(:hex).returns(321)

				post :app_installed, :app_id => mobile_app.id, :udid => "a_udid", :format => :json

				resp = JSON.parse(response.body)
				resp["link_click_id"].should eq(321)
			end
		end
	end


	describe "event" do
		before(:each) do
			@callback_url = "http://linktomyapp.herokuapp.com/"
		end

		let(:mobile_app) { FactoryGirl.create(:mobile_app, :id => 12, :callback_url => @callback_url) }

		let(:app_link) { FactoryGirl.create(:app_link, :mobile_app => mobile_app, :referal => "a_referal") }

		context "link_click exist" do
			context "has a callback_url" do
				it "sends app_installed to callback url" do
					stub_request(:post, "http://linktomyapp.herokuapp.com/").to_return(:body => "abc")

					link_click = FactoryGirl.create(:link_click, :id => 123, :installed => false, :app_link => app_link)

					post :event, :app_id => mobile_app.id, :id => link_click.id, :event => "an_event", :format => :json

					WebMock.should have_requested(:post, @callback_url).with(:body => {:event => "an_event", :referal => "a_referal"}).once
				end
			end
			context "dont have a callback_url" do
				it "ignores callback" do
					mobile_app.update_attributes(:callback_url => nil)

					link_click = FactoryGirl.create(:link_click, :id => 123, :installed => false, :app_link => app_link)

					post :app_installed, :app_id => mobile_app.id, :id => link_click.id, :event => "an_event", :format => :json
				end
			end
		end

		
	end
end

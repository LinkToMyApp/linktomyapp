require 'spec_helper'

describe "MobileApps" do
  describe "GET /mobile_apps" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get mobile_apps_path
      response.status.should be(200)
    end
  end
end

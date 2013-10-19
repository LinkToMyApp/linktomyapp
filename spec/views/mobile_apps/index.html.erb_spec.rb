require 'spec_helper'

describe "mobile_apps/index" do
  before(:each) do
    assign(:mobile_apps, [
      stub_model(MobileApp,
        :name => "",
        :itunes_url => "",
        :icon_url => "Icon Url"
      ),
      stub_model(MobileApp,
        :name => "",
        :itunes_url => "",
        :icon_url => "Icon Url"
      )
    ])
  end

  it "renders a list of mobile_apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Icon Url".to_s, :count => 2
  end
end

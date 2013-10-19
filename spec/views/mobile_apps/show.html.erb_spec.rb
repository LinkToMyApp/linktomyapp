require 'spec_helper'

describe "mobile_apps/show" do
  before(:each) do
    @mobile_app = assign(:mobile_app, stub_model(MobileApp,
      :name => "",
      :itunes_url => "",
      :icon_url => "Icon Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Icon Url/)
  end
end

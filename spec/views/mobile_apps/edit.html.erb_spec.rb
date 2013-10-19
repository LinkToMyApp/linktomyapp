require 'spec_helper'

describe "mobile_apps/edit" do
  before(:each) do
    @mobile_app = assign(:mobile_app, stub_model(MobileApp,
      :name => "",
      :itunes_url => "",
      :icon_url => "MyString"
    ))
  end

  it "renders the edit mobile_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mobile_app_path(@mobile_app), "post" do
      assert_select "input#mobile_app_name[name=?]", "mobile_app[name]"
      assert_select "input#mobile_app_itunes_url[name=?]", "mobile_app[itunes_url]"
      assert_select "input#mobile_app_icon_url[name=?]", "mobile_app[icon_url]"
    end
  end
end

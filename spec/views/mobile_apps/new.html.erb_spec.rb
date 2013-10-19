require 'spec_helper'

describe "mobile_apps/new" do
  before(:each) do
    assign(:mobile_app, stub_model(MobileApp,
      :name => "",
      :itunes_url => "",
      :icon_url => "MyString"
    ).as_new_record)
  end

  it "renders new mobile_app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mobile_apps_path, "post" do
      assert_select "input#mobile_app_name[name=?]", "mobile_app[name]"
      assert_select "input#mobile_app_itunes_url[name=?]", "mobile_app[itunes_url]"
      assert_select "input#mobile_app_icon_url[name=?]", "mobile_app[icon_url]"
    end
  end
end

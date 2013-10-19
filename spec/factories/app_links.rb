# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_link do
    mobile_app_id 1
    referal "MyString"
    link_clicks_count 0
    unique_visitor_counter 0
  end
end

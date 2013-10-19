# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :app_link do
    mobile_app_id 1
    referal "MyString"
    clicks_counter 1
    unique_visitor_counter 1
  end
end

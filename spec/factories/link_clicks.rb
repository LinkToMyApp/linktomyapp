# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :link_click do
    app_link_id 1
    ip_adress "MyString"
    occurence_counter 1
    installed false
  end
end

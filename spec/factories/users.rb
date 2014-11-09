# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    screen_name "MyString"
    full_name "MyString"
    email "MyString"
    description "MyString"
    url "MyText"
  end
end

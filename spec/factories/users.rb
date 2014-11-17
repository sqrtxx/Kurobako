require 'faker'

FactoryGirl.define do
  factory :person, class: :user do
    screen_name Faker::Internet.user_name
    full_name Faker::Name.name
    email Faker::Internet.email
    description Faker::Lorem.sentence(3)
    url Faker::Internet.url
    password 'password'
    password_confirmation 'password'
  end
end

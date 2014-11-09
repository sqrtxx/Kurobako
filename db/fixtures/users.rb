# -*- coding: utf-8 -*-

require 'faker'
Faker::Config.locale = 'en'

(1..20).each do |i|
  User.seed do |u|
    u.screen_name = Faker::Internet.user_name
    u.full_name = Faker::Name.name
    u.email = Faker::Internet.email
    u.description = Faker::Lorem.sentence(3)
    u.url = Faker::Internet.url
  end
end

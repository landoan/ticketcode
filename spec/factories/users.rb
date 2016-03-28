require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password 'password'
    f.password_confirmation 'password'
  end

end

# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    uid { Faker::Internet.uuid }
    token { Faker::Alphanumeric.alpha(number: 15) }
    email { Faker::Internet.unique.safe_email }
    full_name { Faker::Name }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    image { Faker::Internet.url }
  end
end

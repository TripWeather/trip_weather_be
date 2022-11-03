# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    location { Faker::Address.full_address }
  end
end

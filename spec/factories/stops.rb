# frozen_string_literal: true

FactoryBot.define do
  factory :stop do

    trait :start do
      type_of_stop { 0 }
    end

    trait :end do
      type_of_stop { 2 }
    end

    factory :start_stop, traits: [:start]
    factory :end_stop, traits: [:end]

    association :trip
    association :address
  end
end

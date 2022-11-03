# frozen_string_literal: true

FactoryBot.define do
  factory :stop do
    type_of_stop { 'extra' }

    trait :start do
      type_of_stop { 'start' }
    end

    trait :end do
      type_of_stop { 'end' }
    end

    factory :start_stop, traits: [:start]
    factory :end_stop, traits: [:end]

    association :trip
    association :address
  end
end

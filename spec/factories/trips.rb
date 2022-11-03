# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    uid { Faker::Number.number(digits: 10).to_s }
    name { Faker::Movies::StarWars.planet }
    departure_date { Faker::Time.forward(days: 5, period: :morning) }
  end
end

def trip_initialize_has_many(uid = Faker::Number.number(digits: 10).to_s, stops_count = 1)
  FactoryBot.create(:trip, uid: uid) do |trip|
    FactoryBot.create(:start_stop, trip: trip)
    FactoryBot.create_list(:stop, stops_count, trip: trip)
    FactoryBot.create(:end_stop, trip: trip)
  end
end

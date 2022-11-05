# frozen_string_literal: true

class TripSerializer
  include JSONAPI::Serializer
  attributes :uid, :name, :departure_date, :arrival_date

  link :self do |object|
    "https://trip-weather-2022.herokuapp.com/api/v1/#{object.uid}/trips/#{object.id}"
  end

  has_many :stops, links: {
    related: lambda { |object|
      "https://trip-weather-2022.herokuapp.com/api/v1/106758666395730546327/trips/#{object.id}/stops/"
    }
  }
end

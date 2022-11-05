class TripSerializer
  include JSONAPI::Serializer
  attributes :uid, :name, :departure_date, :arrival_date

  link :self do |object|
    "https://trip-weather-2022.herokuapp.com/api/v1/#{object.uid}/trips/#{object.id}"
  end
end

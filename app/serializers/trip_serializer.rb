class TripSerializer
  include JSONAPI::Serializer
  attributes :uid, :name, :departure_date, :arrival_date
end

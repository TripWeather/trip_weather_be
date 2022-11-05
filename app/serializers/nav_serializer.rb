class NavSerializer
  include JSONAPI::Serializer
  attributes :turn_by_turn_directions, :total_trip_time, :total_distance, :has_toll_road
end

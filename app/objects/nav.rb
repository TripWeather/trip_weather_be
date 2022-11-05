class Nav 
  attr_reader :turn_by_turn_directions, :total_trip_time, :fuel_used, :total_distance, :has_toll_road

  def initialize(nav_hash)
    @turn_by_turn_directions = nav_hash[:directions]
    @total_trip_time = nav_hash[:details][:realTime]
    @fuel_used = nav_hash[:details][:fuelUsed]
    @total_distance = nav_hash[:details][:distance]
    @has_toll_road = nav_hash[:details][:hasTollRoad]
  end
end
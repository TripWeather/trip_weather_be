# frozen_string_literal: true

class Nav
  attr_reader :turn_by_turn_directions, :total_trip_time, :total_distance, :has_toll_road, :id

  def initialize(nav_hash)
    @id = 1
    @turn_by_turn_directions = nav_hash[:directions]
    @total_trip_time = nav_hash[:details][:realTime]
    @total_distance = nav_hash[:details][:distance]
    @has_toll_road = nav_hash[:details][:hasTollRoad]
  end
end

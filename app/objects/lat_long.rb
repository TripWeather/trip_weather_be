# frozen_string_literal: true

class LatLong
  attr_reader :latitude, :longitude

  def initialize(response_return)
    @latitude = response_return[:lat]
    @longitude = response_return[:lng]
  end
end

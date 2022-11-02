class LatLong 
  attr_reader :latitude, :longitude

  def initialize(response_return)
    @latitude = response_return[:latitude]
    @longitude = response_return[:longitude]
  end
end
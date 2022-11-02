class LatLongService

  def self.connection
    Faraday.new(
        url: 'http://api.positionstack.com/v1/',
        params: {access_key: ENV['LAT_LONG_API']}
      )

  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.address_to_coord(address)
    response = connection.get("forward?query=#{address}")
    parse(response)
# require 'pry'; binding.pry
  end
  
end
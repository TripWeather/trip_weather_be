# frozen_string_literal: true

class LatLongService
  def self.connection
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: { key: ENV['NAV_API'] }
    )
  end

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.address_to_coord(address)
    address = address.gsub(",", "")
    response = connection.get("/geocoding/v1/address?location=#{address}")
    parse(response)
  end
end

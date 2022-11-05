class NavService

  def self.parse(api_data)
    JSON.parse(api_data.body, symbolize_names: true)
  end

  def self.route_directions(start_address, end_address)
    response = connection.get("/directions/v2/route?from=#{start_address}&to=#{end_address}")
    parse(response)
  end

  private

  def self.connection
    Faraday.new(
      url: 'http://www.mapquestapi.com',
      params: {key: ENV['NAV_API']}
      )
  end
end
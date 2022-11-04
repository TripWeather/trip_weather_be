class NavService

  # def self.connection
  #   Faraday.new(
  #       url: 'http://www.mapquestapi.com/directions/v2/',
  #       params: {key: ENV['NAV_API']})
  # end

  # def self.parse(api_data)
  #   JSON.parse(api_data.body, symbolize_names: true)
  # end

  # def self.nav_info(start_address, end_address)
  #   response = connection.get("?route&from=#{start_address}&to=#{end_address}")
  #   require 'pry'; binding.pry
  #   parse(response)
  # end


  def self.route_directions(start_location, final_location)
    response = conn.get("/directions/v2/route?from=#{start_location}&to=#{final_location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://www.mapquestapi.com/") do |f|
      f.params['key'] = ENV['NAV_API']
    end
  end
end
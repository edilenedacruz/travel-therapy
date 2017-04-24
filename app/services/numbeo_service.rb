class NumbeoService
  attr_reader :connection, :key

  def initialize
    @key = ENV['NUMBEO_API_KEY']
    @connection = Faraday.new("https://www.numbeo.com/api/")
  end

  def get_all_cities_info
    parse(connection.get("cities?api_key=#{@key}"))["cities"]
  end

  def get_current_prices(city_id)
    parse(connection.get("city_prices?api_key=#{@key}&city_id=#{city_id}"))["prices"]
  end

  def get_city_name(city_id)
    parse(connection.get("city_prices?api_key=#{@key}&city_id=#{city_id}"))["name"]
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end

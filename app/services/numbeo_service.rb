class NumbeoService
  attr_reader :connection, :key

  def initialize
    @key = ENV['NUMBEO_API_KEY']
    @connection = Faraday.new("https://www.numbeo.com/api/")
  end

  def get_all_cities_info
    parse(connection.get("cities?api_key=#{@key}"))["cities"]
  end

  # def get_city_by_name(city)
  #   result = parse(connection.get("cities?api_key=#{@key}"))["cities"]
  #   wanted = []
  #   result.each do |record|
  #     if record["city"] == city
  #       wanted << record
  #     end
  #   end
  #   wanted
  #   # binding.pry
  # end

  def get_current_prices(city)
    parse(connection.get("city_prices?api_key=#{@key}&query=#{city}"))
  end

  private

  def parse(response)
    JSON.parse(response.body, symbolize_name: true)
  end
end

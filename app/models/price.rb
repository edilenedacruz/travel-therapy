class Price
  attr_reader :name, :prices
  def initialize(attributes)
    @name = attributes["item_name"]
    @prices = attributes["average_price"]
  end

  def self.get_prices(city)
    NumbeoService.new.get_current_prices(city).map do |city|
      Price.new(city)
    end
  end
end

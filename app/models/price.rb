class Price
  attr_reader :name, :average_price
  def initialize(attributes)
    @name = attributes["item_name"]
    @average_price = attributes["average_price"]
  end

  def self.get_prices(city_id)
    NumbeoService.new.get_current_prices(city_id).map do |item|
      Price.new(item)
    end
  end
end

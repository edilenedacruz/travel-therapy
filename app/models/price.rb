# class Price < OpenStruct
#
#   def self.get_prices(city)
#     format_city = if city.include?(",")
#       city.split(",").first
#     else
#       city
#     end
#     NumbeoService.new.get_current_prices(format_city).map do |city|
#       binding.pry
#       Price.new(city)
#     end
#   end
# end

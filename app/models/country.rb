class Country < ApplicationRecord
  validates :city_id, :country, :latitude, :longitude, :city, presence: true

  def self.populate_countries_table
    NumbeoService.new.get_all_cities_info.map do |city|
      Country.create(country: city["country"], city: city["city"], latitude: city["latitude"], longitude: city["longitude"], city_id: city["city_id"])
    end
  end
end

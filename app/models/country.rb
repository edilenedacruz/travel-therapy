class Country < ApplicationRecord
  validates :country_id, :country, :latitude, :longitude, :city, presence: true
end

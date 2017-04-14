class Country < ApplicationRecord
  validates :country_id, :country, :latitute, :longitude, :city, presence: true
end

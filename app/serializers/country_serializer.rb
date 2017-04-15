class CountrySerializer < ActiveModel::Serializer
  attributes :id, :city_id, :country, :city
end

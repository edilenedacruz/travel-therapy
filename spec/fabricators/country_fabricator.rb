Fabricator(:country) do
  city_id Faker::Number.number(4)
  country    Faker::Address.country
  city       Faker::Address.city
  latitude   Faker::Address.latitude
  longitude  Faker::Address.longitude
end

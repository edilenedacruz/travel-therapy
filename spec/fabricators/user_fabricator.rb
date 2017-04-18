Fabricator(:user) do
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name }
  username   { Faker::Internet.user_name}
  avatar     { Faker::Avatar.image }
  email      { Faker::Internet.email }
  password   "password"
end

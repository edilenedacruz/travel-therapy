require 'rails_helper'

RSpec.describe "Countries API" do
  it "sends a list of all countries" do
    countries = Fabricate.times(50, :country)

    get '/api/v1/countries'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json.count).to eq(50)
  end

  it "display an specific record" do
    country = Fabricate(:country)
    id = country.id

    get "/api/v1/countries/#{id}"

    json_country = JSON.parse(response.body)

    expect(response).to be_success
    expect(response.status).to eq(200)
    expect(json_country["city"]).to eq(country.city)
  end

  it "creates a record" do
    country_params = { city_id: "1234", country: "Brazil", latitude: "87.30961655026263", longitude: "154.96619654464786", city: "Fernando de Noronha"}

    post '/api/v1/countries', params: { country: country_params }

    country = Country.last

    expect(response).to be_success
    expect(response.status).to eq(200)
    expect(country.city).to eq(country_params[:city])
  end

  it "updates a record" do
    id = Fabricate(:country, city: "Denver").id
    country_params = { city: "Keystone" }

    put "/api/v1/countries/#{id}", params: { country: country_params}

    country = Country.find_by(id: id)

    expect(response).to be_success
    expect(country.city).to eq("Keystone")
    expect(country.city).to_not eq("Denver")
  end

  it "destroys a record" do
    country = Fabricate(:country)

    expect(Country.count).to eq(1)

    delete "/api/v1/countries/#{country.id}"

    expect(response).to be_success
    expect(Country.count).to eq(0)
    expect{Country.find(country[:id])}.to raise_error(ActiveRecord::RecordNotFound)
  end
end

require 'rails_helper'

RSpec.describe NumbeoService do
  attr_reader :numbeo
  before(:each) do
    @numbeo = NumbeoService.new
  end

  it "can get access cities info" do

    populate = @numbeo.get_all_cities_info

    expect(populate.count).to eq(2918)
  end

  it "can get current prices in a city" do

    city = "Denver"

    populate = @numbeo.get_current_prices(city)

    expect(populate["name"]).to eq("Denver, CO, United States")
    expect(populate["currency"]).to eq("USD")
    expect(populate["prices"].class).to eq(Array)
  end
end

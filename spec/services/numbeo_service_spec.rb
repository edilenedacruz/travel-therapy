require 'rails_helper'

RSpec.describe NumbeoService do
  attr_reader :numbeo
  before(:each) do
    @numbeo = NumbeoService.new
  end

  it "can get access cities info" do

    populate = @numbeo.get_all_cities_info

    expect(populate.count).to eq(2966)
  end

  it "can get current prices in a city" do

    city = "3412"

    populate = @numbeo.get_current_prices(city)

    expect(populate.first["item_name"]).to eq("Meal, Inexpensive Restaurant, Restaurants")
    expect(populate.count).to eq(55)
    expect(populate.class).to eq(Array)
  end
end

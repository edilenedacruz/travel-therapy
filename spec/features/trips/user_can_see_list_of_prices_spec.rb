require 'rails_helper'

RSpec.feature "Prices" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = @user.trips.create(city: "Durango", departure_date: "05/01/2017", return_date: "05/10/2017")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end
    describe "at a trip show page" do
    it "user sees list of prices of items" do

      visit "/trips/#{@trip.id}"

      save_and_open_page

      expect(page).to have_content("Average cost of things in #{@trip.city}")
    end
  end
end

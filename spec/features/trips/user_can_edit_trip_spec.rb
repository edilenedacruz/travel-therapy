require 'rails_helper'

RSpec.feature "trip update" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = Fabricate(:trip)
    @user.trips << @trip
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can sees button to edit trip at dashboard" do

    visit "/#{@user.slug}"

    within(".trips-table") do
      click_link "Edit"
    end
    
    expect(current_path).to eq(edit_trip_path(@trip))
    expect(page).to have_content("Changed your mind to where?")
    expect(page).to have_content("Departure date")
    expect(page).to have_content("Return date")
  end

  it "can change trip info" do

    visit edit_trip_path(@trip)

    fill_in "trip[city]", with: "Sedona,AZ"
    fill_in "trip[departure_date]", with: "05/05/2017"
    fill_in "trip[return_date]", with: "06/15/2017"

    click_button "Update trip"

    expect(page).to have_content("Sedona,AZ")
    expect(page).to_not have_content("#{@trip.city}")
  end
end

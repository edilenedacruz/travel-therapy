require 'rails_helper'

RSpec.feature "Trip planner" do
  before(:each) do
    @user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user sees options to plan trip" do

    visit user_path(@user)

    click_link "Plan an adventure"

    expect(current_path).to eq(new_trip_path)
  end

  it "has an option to enter departure date" do

    visit new_trip_path

    fill_in "Departure date", with: "05/01/2017"
    fill_in "Return date", with: "05/01/2017"
    fill_in "City", with: "Sedona,AZ"
    click_button "Add new trip"

    expect(page).to have_content("Departure date")
    expect(page).to have_content("Return date")
  end
end

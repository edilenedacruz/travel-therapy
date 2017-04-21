require 'rails_helper'

RSpec.feature "User sees option to plan" do
  attr_reader :user
  before(:each) do
    @user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user sees link to plan a trip" do

    visit user_path(user)

    expect(page).to have_content("Plan an adventure")
  end

  it "sees search field where they can enter destination name" do

    visit new_trip_path

    expect(page).to have_button("Add new trip")
  end

  it "sees an option to select departure date" do

    visit new_trip_path

    expect(page).to have_content("Departure date")
  end

  it "sees an option to select return date" do

    visit new_trip_path

    expect(page).to have_content("Return date")
  end

  it "sees an option to select city" do

    visit new_trip_path

    expect(page).to have_content("City")
  end
end

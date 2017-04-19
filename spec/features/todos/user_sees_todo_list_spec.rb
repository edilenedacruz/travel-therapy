require 'rails_helper'

RSpec.feature "To do" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = Fabricate(:trip)
    @user.trips << @trip
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user sees option to add an activity" do

    visit "/trips/#{@trip.id}"

    expect(page).to have_content("Activities")
  end

  it "if actvity section is empty user can add an activity" do

    visit "/trips/#{@trip.id}"

    expect(page).to have_link("Add an activity")

    click_link "Add an activity"

    expect(current_path).to eq(new_trip_todo_path(@trip))
    expect(page).to have_button("Add activity")
  end

  it "can create an activity" do
    visit "/trips/#{@trip.id}"

    click_link "Add an activity"

    fill_in "todo[title]", with: "Go scuba diving"

    click_button "Add activity"


    expect(current_path).to eq(trip_path(@trip))
  end

  it "can edit an activity" do

    visit "/trips/"
  end

end

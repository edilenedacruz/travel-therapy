require 'rails_helper'

RSpec.feature "To do" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = @user.trips.create(city: "12357", departure_date: "05/01/2017", return_date: "05/10/2017")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "user sees option to add an activity" do

    visit "/trips/#{@trip.id}"

    expect(page).to have_content("Planned activities")
  end

  it "if actvity section is empty user can add an activity" do

    visit "/trips/#{@trip.id}"

    within(:css, "div#trip-link") do
    expect(page).to have_content("Add an activity")
  end

    click_link "Add an activity"

    expect(current_path).to eq(new_trip_todo_path(@trip))
    expect(page).to have_button("Add an activity")
  end

  it "can create an activity" do
    visit "/trips/#{@trip.id}"

    within(:css, "div#trip-link") do
    click_link "Add an activity"
  end

    fill_in "Fun stuff", with: "Go scuba diving"

    click_button "Add an activity"

    expect(current_path).to eq(trip_path(@trip))
  end
end

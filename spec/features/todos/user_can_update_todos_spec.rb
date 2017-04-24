require 'rails_helper'

RSpec.feature "To do" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = @user.trips.create(city: "12357", departure_date: "05/01/2017", return_date: "05/10/2017")
    @todo = @trip.todos.create(title: "Have fun")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can edit an activity" do

    visit "/trips/#{@trip.id}"

    expect(page).to have_link("Edit")

    click_link "Edit"

    expect(current_path).to eq(edit_trip_todo_path(@trip, @todo))

    fill_in "Fun stuff", with: "RVing life"

    click_button("Update")

    expect(current_path).to eq(trip_path(@trip))
  end
end

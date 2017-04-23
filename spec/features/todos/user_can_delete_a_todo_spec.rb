require 'rails_helper'

RSpec.feature "Delete an activity" do
  before(:each) do
    @user = Fabricate(:user)
    @trip = @user.trips.create(city: "Durango", departure_date: "05/01/2017", return_date: "05/10/2017")
    @todo = @trip.todos.create(title: "Have fun")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can delete an activity" do

    visit "/trips/#{@trip.id}"
    expect(@trip.todos.count).to eq(1)

    click_link("Delete")

    expect(@trip.todos.count).to eq(0)
  end
end

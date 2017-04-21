require "rails_helper"

RSpec.feature "delete trip" do
  before(:each) do
    @user = Fabricate(:user)
    @trips = Fabricate.times(2, :trip)
    @user.trips << @trips
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can delete a trip" do

    visit "/users/#{@user.id}"

    within(".trips-table") do
      first(:link, "Delete").click
    end

    expect(@user.trips.count).to eq(1)
  end

end

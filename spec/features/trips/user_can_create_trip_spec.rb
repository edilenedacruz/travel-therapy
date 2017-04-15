require 'rails_helper'

RSpec.feature "Trip planner" do
  it "user sees options to plan trip" do
    user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit username_path(user)

    click_link "Plan an adventure"

    expect(current_path).to eq(new_trip_path)
  end
end

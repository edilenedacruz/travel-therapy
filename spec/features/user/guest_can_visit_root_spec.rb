require 'rails_helper'

RSpec.describe "As a guest" do
  it "can visit the home page" do

    visit '/'

    expect(page).to have_content("Travel Therapy")
  end
end

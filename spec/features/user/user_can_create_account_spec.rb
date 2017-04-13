require 'rails_helper'

RSpec.feature "Guest can create account" do
  it "can complete account creation process and see dashboard" do

    visit '/signup'

    fill_in "user[first_name]", with: "Haukea"
    fill_in "user[last_name]", with: "Manal"
    fill_in "user[username]", with: "kanani"
    fill_in "user[avatar]", with: "https://s-media-cache-ak0.pinimg.com/736x/1d/5d/47/1d5d47e0e076048c70215594d7eef40d.jpg"
    fill_in "user[email]", with: "email@email.com"
    fill_in "user[city]", with: "Honolulu"
    fill_in "user[state]", with: "HI"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_button "Create your account"

    expect(current_path).to eq("/kanani")
  end
end

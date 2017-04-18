require 'rails_helper'

RSpec.feature "User can edit their info" do
  before(:each) do
    @user = Fabricate(:user, first_name: "Grace", last_name: "Hopper", username: "hopper", email: "hopper@email.com")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
  end

  it "can change all fields" do

    visit "/#{@user.slug}"

    click_link "Edit your profile"

    expect(current_path).to eq("/#{@user.slug}/edit")

    fill_in "user[first_name]", with: "Jennifer"
    fill_in "user[last_name]", with: "Pahlka"
    fill_in "user[password]", with: "password"
    fill_in "user[username]", with: "pahlka"
    fill_in "user[email]", with: "jenn@email.com"
    fill_in "user[password]", with: "password"

    click_button "Update"

    expect(page).to have_content("Jennifer")
    expect(page).to_not have_content("Grace")
    expect(page).to have_content("Pahlka")
    expect(page).to_not have_content("Hopper")
    expect(page).to have_content("Pahlka")
    expect(page).to_not have_content("Hopper")
    expect(page).to have_content("pahlka")
    expect(page).to_not have_content("hopper")
  end
end

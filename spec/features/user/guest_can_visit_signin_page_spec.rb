require 'rails_helper'

RSpec.feature "Guest can visit sign in page" do
  it "can visit sign in page" do

    visit '/'

    click_link("Sign In")
    expect(current_path).to eq(login_path)
  end

  it "can click link to sign up for an account" do

    visit '/login'

    click_link "Create an account"

    expect(current_path).to eq(signup_path)
    expect(page).to have_content("First name")
    expect(page).to have_content("Last name")
    expect(page).to have_content("Username")
    expect(page).to have_content("Profile photo url")
    expect(page).to have_content("Email")
    expect(page).to have_content("Password")
    expect(page).to have_content("Password confirmation")
    expect(page).to have_button("Create your account")
  end
end

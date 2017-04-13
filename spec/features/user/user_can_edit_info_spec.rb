require 'rails_helper'

RSpec.feature "Registered user" do
  it "can see edit link at dashboard" do
    user = Fabricate(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/#{user.slug}"

    expect(page).to have_link("Edit your profile")

    click_link "Edit your profile"
    expect(current_path).to eq(username_edit_path(user.slug))
  end
end

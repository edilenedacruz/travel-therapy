require 'rails_helper'

RSpec.describe User, type: :model do
  context "uniqueness" do
    it { should validate_uniqueness_of(:username) }
  end

  context "has secure password" do
    it { should have_secure_password }
  end

  context "validations" do
    it "should be valid with all attributes" do
      user = Fabricate(:user)

      expect(user).to be_valid
    end

    it "should be invalid without first name" do
      user = User.new(last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", city: "Alexandria", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without last name" do
      user = User.new(first_name: "Rick", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", city: "Alexandria", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without avatar" do
      user = User.new(first_name: "Rick", last_name: "Grimes", email: "grimes@example.com", city: "Alexandria", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without email" do
      user = User.new(first_name: "Rick", last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", city: "Alexandria", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without city" do
      user = User.new(first_name: "Rick", last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without state" do
      user = User.new(first_name: "Rick", last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", city: "Alexandria", password: "password", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid without password" do
      user = User.new(first_name: "Rick", last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", city: "Alexandria", state: "WA", username: "grimes")

      expect(user).to be_invalid
    end

    it "should be invalid if username is not unique" do
      user_1 = Fabricate(:user, username: "grimes")
      user = User.new(first_name: "Rick", last_name: "Grimes", avatar: "http://static3.businessinsider.com/image/507a44866bb3f77e5f000000-960/the-walking-dead-rick-grimes.jpg", email: "grimes@example.com", city: "Alexandria", state: "WA", password: "password", username: "grimes")

      expect(user).to be_invalid
    end
  end
end

require 'rails_helper'

RSpec.describe Country, type: :model do
  context "validations" do
    it { should validate_presence_of(:country_id) }
    it { should validate_presence_of(:country) }
    it { should validate_presence_of(:latitude) }
    it { should validate_presence_of(:longitude) }
    it { should validate_presence_of(:city) }
  end
end

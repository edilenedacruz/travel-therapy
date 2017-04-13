class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :avatar, :email, :city, :state, :password, presence: true
  validates :username, presence: true, uniqueness: true

  before_validation :generate_slug

  private

  def generate_slug
    self.slug = username.parameterize
  end
end

class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :avatar, :password, presence: true
  validates :username, presence: true, uniqueness: true

  before_validation :generate_slug

  has_many :trips

  private

  def generate_slug
    self.slug = username.parameterize
  end

  def self.from_omniauth(auth_hash)
    binding.pry
    user = User.find_or_create_by(uid: auth_hash['uid'])
    user.first_name = auth_hash['info']['first_name']
    user.last_name = auth_hash['info']['last_name']
    user.avatar = auth_hash['info']['image']
    user.oauth_token = auth_hash["credentials"]["token"]
    user.password = auth_hash["info"]["name"]
    user.username = auth_hash["info"]["first_name"]
    user.provider = auth_hash['provider']
    user.save!
    user
   end
end

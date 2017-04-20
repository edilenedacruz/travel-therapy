class Trip < ApplicationRecord
  validates :city, :departure_date, :return_date, presence: true
  belongs_to :user
  has_many :todos, dependent: :destroy
end

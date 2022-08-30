class Mountain < ApplicationRecord
  has_many :user_mountains, dependent: :destroy
  has_many :users, through: :user_mountains
  has_many :mountain_locations, dependent: :destroy
  has_many :prefectures, through: :mountain_locations
  has_many :courses, dependent: :destroy

  validates :name, presence: true
end

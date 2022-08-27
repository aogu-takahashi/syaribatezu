class Mountain < ApplicationRecord
  has_many :user_mountains
  has_many :users, through: :user_mountains
  has_many :mountain_locations
  has_many :locations, through: :user_mountains
  has_many :courses, dependent: :destroy
end

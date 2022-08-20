class Prefecture < ApplicationRecord
  has_many :mountain_locations
  has_many :mountains, through: :mountain_locations

  validates :name, presence: true, uniqueness: { scope: :name }
end

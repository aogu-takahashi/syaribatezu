class Ration < ApplicationRecord
  has_many :portable_foods, dependent: :destroy
  has_many :memos, through: :portable_foods

  validates :name, presence: true, length: { maximum: 50 }
  validates :energy, presence: true
end

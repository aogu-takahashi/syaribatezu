class Drink < ApplicationRecord
  has_many :portable_drinks, dependent: :destroy
  has_many :memos, through: :portable_drinks

  validates :name, presence: true, length: { maximum: 50 }
  validates :energy, presence: true
end

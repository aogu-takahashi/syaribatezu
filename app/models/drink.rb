class Drink < ApplicationRecord
  has_many :portable_drinks, dependent: :destroy
  has_many :memos, through: :portable_drinks

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :energy
  end
end

class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :portable_foods, dependent: :destroy
  has_many :rations, through: :portable_foods
  has_many :portable_drinks, dependent: :destroy
  has_many :drinks, through: :portable_drinks

  with_options presence: true do
    validates :user_id
    validates :course_id
    validates :date
    validates :temperature
  end

  enum done: { not_done: 0, done: 1 }
end

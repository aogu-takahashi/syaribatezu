class Memo < ApplicationRecord
  belongs_to :user
  belongs_to :course

  has_many :portable_foods, dependent: :destroy
  has_many :rations, through: :portable_foods
  has_many :portable_drinks, dependent: :destroy
  has_many :drinks, through: :portable_drinks

  validates :user_id, presence: true
  validates :course_id, presence: true
  validates :date, presence: true
  validates :temperature, presence: true

  enum done: { not_done: 0, done: 1 }
end

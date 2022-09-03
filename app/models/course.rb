class Course < ApplicationRecord
  belongs_to :mountain

  has_many :memos, dependent: :destroy

  validates :mountain_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :days, presence: true
  validates :walking_time, presence: true
  validates :distance, presence: true
  validates :denivele_plus, presence: true
  validates :denivele_minus, presence: true
end

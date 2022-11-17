class Course < ApplicationRecord
  belongs_to :mountain
  belongs_to :user

  has_many :memos, dependent: :destroy

  with_options presence: true do
    validates :mountain_id
    validates :user_id
    validates :name, length: { maximum: 50 }
    validates :days
    validates :walking_time
    validates :distance
    validates :denivele_plus
    validates :denivele_minus
  end
end

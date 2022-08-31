class UserMountain < ApplicationRecord
  belongs_to :user
  belongs_to :mountain

  validates :user_id, presence: true
  validates :mountain_id, presence: true
end

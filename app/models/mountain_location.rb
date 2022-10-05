class MountainLocation < ApplicationRecord
  belongs_to :mountain
  belongs_to :prefecture

  # validates :mountain_id, presence: true
  # validates :prefecture_id, presence: true
end

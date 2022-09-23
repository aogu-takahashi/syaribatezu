class MountainLocation < ApplicationRecord
  belongs_to :mountain
  belongs_to :prefecture

  with_options presence: true do
    validates :mountain_id
    validates :prefecture_id
  end
end

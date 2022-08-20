class MountainLocation < ApplicationRecord
  belongs_to :mountain
  belongs_to :prefecture
end

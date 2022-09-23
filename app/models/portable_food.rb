class PortableFood < ApplicationRecord
  belongs_to :memo
  belongs_to :ration

  validates :memo_id, presence: true
  validates :ration_id, presence: true
  validates :volume, presence: true
end

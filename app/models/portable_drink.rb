class PortableDrink < ApplicationRecord
  belongs_to :memo
  belongs_to :drink

  validates :memo_id, presence: true
  validates :drink_id, presence: true
  validates :volume, presence: true
end

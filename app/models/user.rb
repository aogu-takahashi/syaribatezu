class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :user_mountains, dependent: :destroy
  has_many :mountains, through: :user_mountains
  has_many :memos, dependent: :destroy

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :email, uniqueness: true
    validates :age
    validates :height
    validates :weight
    validates :rucksack_weight
  end
  
  enum sex: { man: 0, woman: 1 }
  enum role: { general: 0, admin: 1 }

  def own?(object)
    id == object.user_id
  end
end

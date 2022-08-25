class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :user_mountains, dependent: :destroy
  has_many :mountains, through: :user_mountains

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :age, presence: true
  validates :height, presence: true
  validates :weight, presence: true
  validates :rucksack_weight, presence: true
  
  enum sex: { man: 0, woman: 1 }
  enum role: { general: 0, admin: 1 }

end

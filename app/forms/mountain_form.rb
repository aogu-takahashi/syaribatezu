class MountainForm
  include ActiveModel::Model

  attr_accessor :name, :mountain_id, :prefecture_id, :user_id

  with_options presence: true do
    validates :name, length: { maximum: 20}
    validates :mountain_id
    validates :prefecture_id
    validates :user_id
  end

  def save
    mountain = Mountain.create(name: name)
    MountainLocation.create(mountain_id: mountain.id, prefecture_id: prefecture_id)
    UserMountain.create(user_id: user_id, mountain_id: mountain.id)
  end
end
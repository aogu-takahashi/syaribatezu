require 'rails_helper'

RSpec.describe MountainLocation, type: :model do
  # let(:mountain_location) { FactoryBot.create(:mountain_location) }
  before do
    mountain = Mountain.create(name: "test", id: 1)
    prefecture = Prefecture.create(name: "test", id: 1)
    @mountain_location = MountainLocation.create(mountain_id: 1, prefecture_id: 1)
  end

  it "必須事項があれば有効な状態であること" do
    expect(@mountain_location).to be_valid
  end

  it "mountain_idがなければ無効" do
    @mountain_location.mountain_id = nil
    @mountain_location.valid?
  end

  it "prefecture_idがなければ無効" do
    @mountain_location.prefecture_id = nil
    @mountain_location.valid?
  end
end

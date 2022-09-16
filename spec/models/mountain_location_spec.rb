require 'rails_helper'

RSpec.describe MountainLocation, type: :model do
  let(:mountain_location) { FactoryBot.create(:mountain_location) }

  it "必須事項があれば有効な状態であること" do
    expect(mountain_location).to be_valid
  end

  it "mountain_idがなければ無効" do
    mountain_location.mountain_id = nil
    mountain_location.valid?
    expect(mountain_location.errors[:mountain_id]).to include("を入力してください")
  end

  it "prefecture_idがなければ無効" do
    mountain_location.prefecture_id = nil
    mountain_location.valid?
    expect(mountain_location.errors[:prefecture_id]).to include("を入力してください")
  end
end

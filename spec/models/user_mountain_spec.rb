require 'rails_helper'

RSpec.describe UserMountain, type: :model do
  let(:user_mountain) { FactoryBot.create(:user_mountain) }

  it "必須事項があれば有効な状態であること" do
    expect(user_mountain).to be_valid
  end

  it "user_idがなければ無効" do
    user_mountain.user_id = nil
    user_mountain.valid?
    expect(user_mountain.errors[:user_id]).to include("を入力してください")
  end

  it "mountain_idがなければ無効" do
    user_mountain.mountain_id = nil
    user_mountain.valid?
    expect(user_mountain.errors[:mountain_id]).to include("を入力してください")
  end
end

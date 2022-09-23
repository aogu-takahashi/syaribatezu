require 'rails_helper'

RSpec.describe Mountain, type: :model do
  it "必須事項があれば有効な状態であること" do
    expect(FactoryBot.build(:mountain)).to be_valid
  end

  it "名前がなければ無効" do
    mountain = Mountain.new(name: nil)
    mountain.valid?
    expect(mountain.errors[:name]).to include("を入力してください")
  end
end

require 'rails_helper'

RSpec.describe Prefecture, type: :model do
  it "必須事項があれば有効な状態であること" do
    expect(FactoryBot.create(:prefecture)).to be_valid
  end

  it "名前がなければ無効" do
    prefecture = FactoryBot.build(:prefecture, name: nil)
    prefecture.valid?
    expect(prefecture.errors[:name]).to include("を入力してください")
  end
end

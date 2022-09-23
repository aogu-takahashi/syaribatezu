require 'rails_helper'

RSpec.describe PortableDrink, type: :model do
  let(:portable_drink) { FactoryBot.create(:portable_drink) }

  it "必須事項があれば有効な状態であること" do
    expect(portable_drink).to be_valid
  end

  it "memo_idがなければ無効" do
    portable_drink.memo_id = nil
    portable_drink.valid?
    expect(portable_drink.errors[:memo_id]).to include("を入力してください")
  end

  it "drink_idがなければ無効" do
    portable_drink.drink_id = nil
    portable_drink.valid?
    expect(portable_drink.errors[:drink_id]).to include("を入力してください")
  end
end

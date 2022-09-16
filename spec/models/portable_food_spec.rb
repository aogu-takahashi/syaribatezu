require 'rails_helper'

RSpec.describe PortableFood, type: :model do
  let(:portable_food) { FactoryBot.create(:portable_food) }

  it "必須事項があれば有効な状態であること" do
    expect(portable_food).to be_valid
  end

  it "memo_idがなければ無効" do
    portable_food.memo_id = nil
    portable_food.valid?
    expect(portable_food.errors[:memo_id]).to include("を入力してください")
  end

  it "ration_idがなければ無効" do
    portable_food.ration_id = nil
    portable_food.valid?
    expect(portable_food.errors[:ration_id]).to include("を入力してください")
  end
end

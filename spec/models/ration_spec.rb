require 'rails_helper'

RSpec.describe Ration, type: :model do
  let(:ration) { FactoryBot.create(:ration) }

  it "必須事項があれば有効な状態であること" do
    expect(ration).to be_valid
  end

  it "名前がなければ無効" do
    ration.name = nil
    ration.valid?
    expect(ration.errors[:name]).to include("を入力してください")
  end

  it "名前が50文字以内であること" do
    ration.name = "a" * 51
    ration.valid?
    expect(ration.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "エネルギーがなければ無効" do
    ration.energy = nil
    ration.valid?
    expect(ration.errors[:energy]).to include("を入力してください")
  end
end

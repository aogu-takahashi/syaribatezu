require 'rails_helper'

RSpec.describe Drink, type: :model do
  let(:drink) { FactoryBot.create(:drink) }

  it "必須事項があれば有効な状態であること" do
    expect(drink).to be_valid
  end

  it "名前がなければ無効" do
    drink.name = nil
    drink.valid?
    expect(drink.errors[:name]).to include("を入力してください")
  end

  it "名前が50文字以内であること" do
    drink.name = "a" * 51
    drink.valid?
    expect(drink.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "エネルギーがなければ無効" do
    drink.energy = nil
    drink.valid?
    expect(drink.errors[:energy]).to include("を入力してください")
  end
end

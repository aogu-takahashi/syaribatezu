require 'rails_helper'

RSpec.describe Memo, type: :model do
  let(:memo) { FactoryBot.create(:memo) }

  it "必須事項があれば有効な状態であること" do
    expect(memo).to be_valid
  end

  it "日付がなければ無効" do
    memo.date = nil
    memo.valid?
    expect(memo.errors[:date]).to include("を入力してください")
  end

  it "気温がなければ無効" do
    memo.temperature = nil
    memo.valid?
    expect(memo.errors[:temperature]).to include("を入力してください")
  end

  it "user_idがなければ無効" do
    memo.user_id = nil
    memo.valid?
    expect(memo.errors[:user_id]).to include("を入力してください")
  end

  it "course_idがなければ無効" do
    memo.course_id = nil
    memo.valid?
    expect(memo.errors[:course_id]).to include("を入力してください")
  end
end

require 'rails_helper'

RSpec.describe Course, type: :model do
  it "必須事項があれば有効な状態であること" do
    expect(FactoryBot.create(:course)).to be_valid
  end

  it "名前がなければ無効" do
    course = FactoryBot.build(:course, name: nil)
    course.valid?
    expect(course.errors[:name]).to include("を入力してください")
  end

  it "名前が50文字以内であること" do
    course = FactoryBot.build(:course, name: "a" * 51)
    course.valid?
    expect(course.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "日数がなければ無効" do
    course = FactoryBot.build(:course, days: nil)
    course.valid?
    expect(course.errors[:days]).to include("を入力してください")
  end

  it "歩行時間がなければ無効" do
    course = FactoryBot.build(:course, walking_time: nil)
    course.valid?
    expect(course.errors[:walking_time]).to include("を入力してください")
  end

  it "距離がなければ無効" do
    course = FactoryBot.build(:course, distance: nil)
    course.valid?
    expect(course.errors[:distance]).to include("を入力してください")
  end

  it "上りの累積標高差がなければ無効" do
    course = FactoryBot.build(:course, denivele_plus: nil)
    course.valid?
    expect(course.errors[:denivele_plus]).to include("を入力してください")
  end

  it "下りの累積標高差がなければ無効" do
    course = FactoryBot.build(:course, denivele_minus: nil)
    course.valid?
    expect(course.errors[:denivele_minus]).to include("を入力してください")
  end
end

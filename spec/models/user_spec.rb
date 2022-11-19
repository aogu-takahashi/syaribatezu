require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  it "必須事項があれば有効な状態であること" do
    expect(user).to be_valid
  end

  describe "名前のバリデーション" do
    it "名前がなければ無効な状態であること" do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "名前が50文字以内であること" do
      user.name = "a" * 51
      user.valid?
      expect(user.errors[:name]).to include("は50文字以内で入力してください")
    end
  end

  describe "メールアドレスのバリデーション" do
    it "メールアドレスがなければ無効な状態であること" do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したメールアドレスなら無効な状態であること" do
      other_user = FactoryBot.create(:user, email: "test@email.com")
      user.email = "test@email.com"
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end

  describe "パスワードのバリデーション" do
    it "パスワードがなければ無効な状態であること" do
      user.password = nil
      user.valid?
      expect(user.errors[:password]).to include("は3文字以上で入力してください")
    end

    it "パスワードが3文字以上であること" do
      user.password = "a" * 2
      user.valid?
      expect(user.errors[:password]).to include("は3文字以上で入力してください")
    end
  end

  it "年齢がなければ無効な状態であること" do
    user.age = nil
    user.valid?
    expect(user.errors[:age]).to include("を入力してください")
  end

  it "性別がなければ無効な状態であること" do
    user.sex = nil
    user.valid?
  end

  it "身長がなければ無効な状態であること" do
    user.height = nil
    user.valid?
    expect(user.errors[:height]).to include("を入力してください")
  end

  it "体重がなければ無効な状態であること" do
    user.weight = nil
    user.valid?
    expect(user.errors[:weight]).to include("を入力してください")
  end
end

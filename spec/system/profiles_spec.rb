require 'rails_helper'

RSpec.describe "Profiles", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  describe "プロフィールの編集" do
    before do
      login_as(user)
    end

    describe "正常にプロフィールが編集される" do
      it "プロフィールが編集される" do
        visit edit_profile_path(user)
        fill_in "user[name]", with: "山田太郎"
        fill_in "user[email]", with: "edit@email.com"
        fill_in "user_age", with: "55"
        select "女性", from: "user_sex"
        fill_in "user_height", with: "160"
        fill_in "user_weight", with: "50"
        click_on "更新する"
        expect(page).to have_content "登山者情報を更新しました"
      end
    end

    describe "プロフィールの編集に失敗する" do
      context "メールアドレスに問題がある" do
        it "メールアドレスが未入力" do
          visit edit_profile_path(user)
          fill_in "user_email", with: ""
          click_on "更新する"
          expect(page).to have_content "メールアドレスを入力してください"
        end

        it "登録済メールアドレスを使用" do
          other_user = FactoryBot.create(:user)
          visit edit_profile_path(user)
          fill_in "user_email", with: other_user.email
          click_on "更新する"
          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end

      context "未入力の項目がある" do
        it "名前が未入力" do
          visit edit_profile_path(user)
          fill_in "user_name", with: ""
          click_on "更新する"
          expect(page).to have_content "ユーザー名を入力してください"
        end

        it "年齢が未入力" do
          visit edit_profile_path(user)
          fill_in "user_age", with: ""
          click_on "更新する"
          expect(page).to have_content "年齢を入力してください"
        end

        it "身長が未入力" do
          visit edit_profile_path(user)
          fill_in "user_height", with: ""
          click_on "更新する"
          expect(page).to have_content "身長を入力してください"
        end

        it "体重が未入力" do
          visit edit_profile_path(user)
          fill_in "user_weight", with: ""
          click_on "更新する"
          expect(page).to have_content "体重を入力してください"
        end
      end
    end
  end
end

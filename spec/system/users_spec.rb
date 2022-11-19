require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  describe "ログイン前" do
    describe "ユーザー登録" do
      context "フォームの入力値が正常" do
        it "ユーザー登録が成功する" do
          visit new_user_path
          fill_in "user_name", with: "テストユーザー"
          fill_in "user_email", with: "test@email.com"
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          fill_in "user_age", with: 20
          select "男性", from: "user_sex"
          fill_in "user_height", with: 170
          fill_in "user_weight", with: 60
          click_button "登録"
          expect(page).to have_content "ユーザーを作成しました"
        end
      end

      context "メールアドレスが未入力" do
        it "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "user_name", with: "テストユーザー"
          fill_in "user_email", with: ""
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          fill_in "user_age", with: 20
          select "男性", from: "user_sex"
          fill_in "user_height", with: 170
          fill_in "user_weight", with: 60
          click_button "登録"
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end

      context "登録済メールアドレスを使用" do
        it "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "user_name", with: "テストユーザー"
          fill_in "user_email", with: user.email
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          fill_in "user_age", with: 20
          select "男性", from: "user_sex"
          fill_in "user_height", with: 170
          fill_in "user_weight", with: 60
          click_button "登録"
          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end

      context "ユーザー名が未入力" do
        it "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "user_name", with: ""
          fill_in "user_email", with: "test@email.com"
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          fill_in "user_age", with: 20
          select "男性", from: "user_sex"
          fill_in "user_height", with: 170
          fill_in "user_weight", with: 60
          click_button "登録"
          expect(page).to have_content "ユーザー名を入力してください"
        end
      end

      context "パスワードが未入力" do
        fit "ユーザー登録が失敗する" do
          visit new_user_path
          fill_in "user_name", with: "テストユーザー"
          fill_in "user_email", with: "test@email.com"
          fill_in "user_password", with: ""
          fill_in "user_password_confirmation", with: "password"
          fill_in "user_age", with: 20
          select "男性", from: "user_sex"
          fill_in "user_height", with: 170
          fill_in "user_weight", with: 60
          click_button "登録"
          expect(page).to have_content "パスワードは3文字以上で入力してください"
        end
      end
    end
  end
end

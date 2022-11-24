require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  include LoginSupport

  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }

  describe "ログイン前" do
    describe "フォームの入力値が正常" do
      it "ログインが成功する" do
        visit login_path
        fill_in "email", with: user.email
        fill_in "password", with: "password"
        click_button "ログイン"
        expect(page).to have_content "ログインしました"
      end
    end

    describe "フォームが未入力" do
      describe "メールアドレスが未入力" do
        it "ログインが失敗する" do
          visit login_path
          fill_in "email", with: ""
          fill_in "password", with: "password"
          click_button "ログイン"
          expect(page).to have_content "ログインに失敗しました"
        end
      end

      describe "パスワードが未入力" do
        it "ログインが失敗する" do
          visit login_path
          fill_in "email", with: user.email
          fill_in "password", with: ""
          click_button "ログイン"
          expect(page).to have_content "ログインに失敗しました"
        end
      end
    end

    describe "フォームの入力値が異常" do
      describe "存在しないメールアドレスを使用" do
        it "ログインが失敗する" do
          visit login_path
          fill_in "email", with: "null@email.com"
          fill_in "password", with: "password"
          click_button "ログイン"
          expect(page).to have_content "ログインに失敗しました"
        end
      end

      describe "パスワードが間違っている" do
        it "ログインが失敗する" do
          visit login_path
          fill_in "email", with: user.email
          fill_in "password", with: "wrong_password"
          click_button "ログイン"
          expect(page).to have_content "ログインに失敗しました"
        end
      end
    end
  end

  describe "ログイン後" do
    before do
      login_as(user)
    end

    it "ログアウトが成功する" do
      visit root_path
      click_on "ログアウト"
      expect(page).to have_content "ログアウトしました"
    end
  end
end

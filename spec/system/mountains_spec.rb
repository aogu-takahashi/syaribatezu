require 'rails_helper'

RSpec.describe "Mountains", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:mountain) { FactoryBot.create(:mountain) }
  let(:prefecture) { FactoryBot.create(:prefecture) }
  let(:user_mountain) { FactoryBot.create(:user_mountain, user: user, mountain: mountain) }

  describe "山の作成" do
    before do
      login_as(user)
    end

    describe "正常に山が作成される" do
      it "山が作成される" do
        prefecture.save
        visit new_mountain_path
        fill_in "mountain[name]", with: "山"
        # select prefecture.name, match: :first
        check "mountain_prefecture_ids_#{prefecture.id}"
        click_on "登録"
        expect(page).to have_content "山情報を作成しました"
        expect(Mountain.count).to eq 1
      end
    end

    describe "山の作成に失敗する" do
      describe "山名が入力されていない" do
        it "山が作成されない" do
          visit new_mountain_path
          click_on "登録"
          expect(page).to have_content "山名を入力してください"
          expect(Mountain.count).to eq 0
        end
      end
    end
  end

  describe "山の編集" do
    before do
      login_as(user)
    end

    describe "正常に山が編集される" do
      it "山が編集される" do
        mountain.save
        user_mountain.save
        visit edit_mountain_path(mountain)
        fill_in "mountain[name]", with: "山"
        click_on "登録"
        expect(page).to have_content "山情報を更新しました"
        expect(Mountain.count).to eq 1
      end
    end

    describe "山の編集に失敗する" do
      describe "山名が入力されていない" do
        it "山が編集されない" do
          mountain.save
          user_mountain.save
          visit edit_mountain_path(mountain)
          fill_in "mountain[name]", with: ""
          click_on "登録"
          expect(page).to have_content "山名を入力してください"
          expect(Mountain.count).to eq 1
        end
      end
    end
  end

  describe "山の削除" do
    before do
      login_as(user)
    end

    describe "正常に山が削除される" do
      it "山が削除される" do
        mountain.save
        user_mountain.save
        visit mountain_path(mountain)
        click_on "山の削除"
        expect(page).to have_content "山情報を削除しました"
        expect(Mountain.count).to eq 0
      end
    end
  end
end

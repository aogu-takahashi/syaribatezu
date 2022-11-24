require 'rails_helper'

RSpec.describe "Memos", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:mountain) { FactoryBot.create(:mountain) }

  describe "メモの作成" do
    before do
      login_as(user)
    end

    describe "正常にメモが作成される" do
      it "メモが作成される" do
        mountain.save
        visit new_memo_path
        select mountain.name, match: :first
        select mountain.courses.first.name, match: :first
        fill_in "memo[date]", with: "2020-01-01"
        fill_in "memo[temperature]", with: "1"
        click_on "登録"
        expect(page).to have_content "メモを作成しました"
        expect(Memo.count).to eq 1
      end
    end

    describe "メモの作成に失敗する" do
      describe "山が選択されていない" do
        it "メモが作成されない" do
          mountain.save
          visit new_memo_path
          fill_in "memo[date]", with: "2020-01-01"
          fill_in "memo[temperature]", with: "1"
          click_on "登録"
          expect(page).to have_content "コースを入力してください"
          expect(Memo.count).to eq 0
        end
      end

      describe "コースが選択されていない" do
        it "メモが作成されない" do
          mountain.save
          visit new_memo_path
          select mountain.name, match: :first
          fill_in "memo[date]", with: "2020-01-01"
          fill_in "memo[temperature]", with: "1"
          click_on "登録"
          expect(page).to have_content "コースを入力してください"
          expect(Memo.count).to eq 0
        end
      end

      describe "日付が入力されていない" do
        it "メモが作成されない" do
          mountain.save
          visit new_memo_path
          select mountain.name, match: :first
          select mountain.courses.first.name, match: :first
          fill_in "memo[temperature]", with: "1"
          click_on "登録"
          expect(page).to have_content "登山日を入力してください"
          expect(Memo.count).to eq 0
        end
      end

      describe "気温が入力されていない" do
        it "メモが作成されない" do
          mountain.save
          visit new_memo_path
          select mountain.name, match: :first
          select mountain.courses.first.name, match: :first
          fill_in "memo[date]", with: "2020-01-01"
          click_on "登録"
          expect(page).to have_content "気温を入力してください"
          expect(Memo.count).to eq 0
        end
      end
    end

    describe "メモの編集" do
      let(:memo) { FactoryBot.create(:memo, user: user) }

      describe "正常にコースが編集される" do
        it "コースが編集される" do
          memo.save
          visit edit_memo_path(memo)
          fill_in "memo[temperature]", with: "2"
          click_on "登録"
          expect(page).to have_content "メモを更新しました"
          expect(Memo.count).to eq 1
        end
      end

      describe "メモの編集に失敗する" do
        describe "気温が入力されていない" do
          it "メモが更新されない" do
            memo.save
            visit edit_memo_path(memo)
            fill_in "memo[temperature]", with: ""
            click_on "登録"
            expect(page).to have_content "気温を入力してください"
            expect(Memo.count).to eq 1
          end
        end

        describe "日にちが入力されていない" do
          it "メモが更新されない" do
            memo.save
            visit edit_memo_path(memo)
            fill_in "memo[date]", with: ""
            click_on "登録"
            expect(page).to have_content "登山日を入力してください"
            expect(Memo.count).to eq 1
          end
        end

        describe "他のユーザーのメモを編集しようとする" do
          let(:other_user) { FactoryBot.create(:user) }
          let(:other_memo) { FactoryBot.create(:memo, user: other_user) }

          it "メモが更新されない" do
            other_memo.save
            visit edit_memo_path(other_memo)
            expect(page).to have_content "メモが見つかりません"
          end
        end
      end
    end
  end

  describe "メモの削除" do
    before do
      login_as(user)
    end

    let(:memo) { FactoryBot.create(:memo, user: user) }

    describe "正常にメモが削除される" do
      it "メモが削除される" do
        memo.save
        visit memo_path(memo)
        click_on "メモの削除"
        expect(page).to have_content "メモを削除しました"
        expect(Memo.count).to eq 0
      end
    end
  end
end

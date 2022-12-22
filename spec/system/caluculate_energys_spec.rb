require 'rails_helper'

RSpec.describe "CaluculateEnergys", type: :system do
  include LoginSupport 

  before do
    driven_by(:rack_test)
  end

  let(:user) { FactoryBot.create(:user) }
  let(:prefecture) { FactoryBot.create(:prefecture) }
  let(:mountain) { FactoryBot.create(:mountain) }
  let(:drink) { FactoryBot.create(:drink) }

  describe "エネルギー計算" do
    describe "都道府県の表示" do
      it "登録されている都道府県が表示される" do
        prefecture.save
        login_as(user)
        visit prefectures_path
        expect(page).to have_content prefecture.name
      end
    end

    describe "コースの選択" do
      it "選択された都道府県の山が表示される" do
        mountain.save
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        expect(page).to have_xpath("//option[text()='#{mountain.name}']")
      end

      it "選択された山のコースが表示される" do
        mountain.save
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        select mountain.name, match: :first
        expect(page).to have_xpath("//option[@value='#{mountain.courses.first.id}']")
      end
    end

    describe "ユーザーデータの入力" do
      it "ユーザーデータの登録データが表示される" do
        mountain.save
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        select mountain.name, match: :first
        select mountain.courses.first.name, match: :first
        click_on "次へ"
        expect(page).to have_xpath("//input[@id='user_age'][@value='#{user.age}']")
        expect(page).to have_content "男性"
        expect(page).to have_xpath("//input[@id='user_height'][@value='#{user.height}']")
        expect(page).to have_xpath("//input[@id='user_weight'][@value='#{user.weight}']")
        expect(page).to have_xpath("//input[@id='user_rucksack_weight'][@value='#{user.rucksack_weight}']")
      end
    end

    describe "計算結果" do
      it "計算結果が表示される①" do
        mountain.save
        drink.save
        choco = Ration.create(id: 1, name: "板チョコレート", energy: 280)
        choco.save
        yokan = Ration.create(id: 2, name: "よかん", energy: 170)
        yokan.save
        dry_fruit = Ration.create(id: 3, name: "ドライフルーツ", energy: 100)
        dry_fruit.save
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        select mountain.name, match: :first
        select mountain.courses.first.name, match: :first
        click_on "次へ"
        click_on "次へ"
        click_button "計算する"
        expect(page).to have_content "1038"
        expect(page).to have_content "1800"
        expect(page).to have_content "1000"
        expect(page).to have_content "1枚"
        expect(page).to have_content "1本"
        expect(page).to have_content "1袋"
      end

      it "計算結果が表示される②" do
        mountain.save
        drink.save
        choco = Ration.create(id: 1, name: "板チョコレート", energy: 280)
        choco.save
        yokan = Ration.create(id: 2, name: "よかん", energy: 170)
        yokan.save
        dry_fruit = Ration.create(id: 3, name: "ドライフルーツ", energy: 100)
        dry_fruit.save
        user.update(weight: 80)
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        select mountain.name, match: :first
        select mountain.courses.first.name, match: :first
        click_on "次へ"
        click_on "次へ"
        click_button "計算する"
        expect(page).to have_content "1099"
        expect(page).to have_content "1920"
        expect(page).to have_content "1900"
        expect(page).to have_content "1枚"
        expect(page).to have_content "1本"
        expect(page).to have_content "2袋"
      end

      it "計算結果が保存される" do
        mountain.save
        drink.save
        choco = Ration.create(id: 1, name: "板チョコレート", energy: 280)
        choco.save
        yokan = Ration.create(id: 2, name: "よかん", energy: 170)
        yokan.save
        dry_fruit = Ration.create(id: 3, name: "ドライフルーツ", energy: 100)
        dry_fruit.save
        login_as(user)
        visit prefectures_path
        click_link mountain.prefectures.first.name
        select mountain.name, match: :first
        select mountain.courses.first.name, match: :first
        click_on "次へ"
        click_on "次へ"
        click_button "計算する"
        click_button "保存する"
        expect(Memo.count).to eq 1
      end
    end
  end
end

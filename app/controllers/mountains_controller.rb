class MountainsController < ApplicationController
  skip_before_action :require_login, only: [:narrowed_index]

  def index
    @hokkaido_tohoku_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["北海道", "青森", "岩手", "宮城", "秋田", "山形", "福島"]}).order(:id)
    @kanto_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["茨城", "栃木", "群馬", "埼玉", "千葉", "東京", "神奈川"]}).order(:id)
    @chubu_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["新潟", "富山", "石川", "福井", "山梨", "長野", "岐阜", "静岡", "愛知"]}).order(:id)
    @kinki_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["三重", "滋賀", "京都", "大阪", "兵庫", "奈良", "和歌山"]}).order(:id)
    @chugoku_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["鳥取", "島根", "岡山", "広島", "山口"]}).order(:id)
    @shikoku_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["徳島", "香川", "愛媛", "高知"]}).order(:id)
    @kyushu_okinawa_mountains = Mountain.includes(:prefectures).where(prefectures: {name: ["福岡", "佐賀", "長崎", "熊本", "大分", "宮崎", "鹿児島", "沖縄"]}).order(:id)
  end

  def narrowed_index
    prefecture = Prefecture.find(params[:prefecture_id])
    @mountains = prefecture.mountains
  end

  def new
    @mountain = Mountain.new
    @mountain.mountain_locations.build
  end

  def create
    @mountain = Mountain.new(mountain_params)

    if @mountain.save
      user_mountain = UserMountain.new(user_mountain_params)
      user_mountain.save
      redirect_to mountains_path, success: "山情報を作成しました"
    else
      flash.now[:notice] = "山情報の作成に失敗しました"
      render :new
    end
  end

  def show
    set_mountain
    @courses = @mountain.courses.all.order(created_at: :desc)
  end

  def destroy
    set_mountain
    @mountain.destroy!
    redirect_to mountains_path, success: "山情報を削除しました"
  end

  def edit
    set_mountain
  end

  def update
    set_mountain
    if @mountain.update(mountain_params)
      redirect_to mountain_path(@mountain), success: "山情報を更新しました"
    else
      flash.now[:notice] = "山情報の更新に失敗しました"
      render :edit
    end
  end

  private

  def mountain_params
    params.require(:mountain).permit(:name, :mountain_id, prefecture_ids: [] )
  end

  def user_mountain_params
    { user_id: current_user.id, mountain_id: @mountain.id}
  end

  def set_mountain
    @mountain = Mountain.find(params[:id])
  end
end

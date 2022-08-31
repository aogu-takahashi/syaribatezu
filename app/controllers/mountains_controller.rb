class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
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
      redirect_to mountains_path, notice: "山情報を作成しました"
    else
      flash.now[:notice] = "山情報の作成に失敗しました"
      render :new
    end
  end

  def show
    @mountain = Mountain.find(params[:id])
    @courses = @mountain.courses.all.order(created_at: :desc)
  end

  def destroy
    mountain = Mountain.find(params[:id])
    mountain.destroy!
    redirect_to mountains_path, notice: "山情報を削除しました"
  end

  def edit
    @mountain = Mountain.find(params[:id])
  end

  def update
    @mountain = Mountain.find(params[:id])
    if @mountain.update(mountain_params)
      redirect_to mountains_path, notice: "山情報を更新しました"
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
end

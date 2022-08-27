class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def new
    @mountain = MountainForm.new
  end

  def create
    @mountain = MountainForm.new(mountain_params)
    if @mountain.save
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

  private

  def mountain_params
    params.require(:mountain_form)
      .permit(:name, :mountain_id, :prefecture_id)
      .merge(user_id: current_user.id)
  end
end

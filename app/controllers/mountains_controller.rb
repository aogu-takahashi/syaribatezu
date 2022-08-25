class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  def new
    @mountain = Mountain.new
  end

  def create
    @mountain = current_user.mountains.build(mountain_params)
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
    params.require(:mountain).permit(:name)
  end
end

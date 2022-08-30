class MountainsController < ApplicationController
  def index
    @mountains = Mountain.all
  end

  # def new
  #   @mountain = MountainForm.new
  # end

  def new
    @mountain = Mountain.new
    @mountain.mountain_locations.build
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

  # def create
  #   @mountain = MountainForm.new(mountain_params)
  #   if @mountain.save
  #     redirect_to mountains_path, notice: "山情報を作成しました"
  #   else
  #     flash.now[:notice] = "山情報の作成に失敗しました"
  #     render :new
  #   end
  # end

  def show
    @mountain = Mountain.find(params[:id])
    @courses = @mountain.courses.all.order(created_at: :desc)
  end

  def destroy
    mountain = current_user.mountains.find(params[:id])
    mountain.destroy!
    redirect_to mountains_path, notice: "山情報を削除しました"
  end

  private

   def mountain_params
    params.require(:mountain).permit(:name, :mountain_id, prefecture_ids: [] )
  end

  # def mountain_params
  #   params.require(:mountain_form)
  #     .permit(:name, :mountain_id, prefecture_ids: []  )
  #     .merge(user_id: current_user.id)
  # end
end

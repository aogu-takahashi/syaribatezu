class Admin::PrefectureController < Admin::BaceController
  before_action :set_prefecture, only: %i[show edit update destroy]

  def index
    @prefectures = Prefecture.all.order(:id)
  end

  def new
    @prefecture = Prefecture.new
  end

  def create
    @prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to admin_prefecture_index_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  def update
    if @prefecture.update(prefecture_params)
      redirect_to admin_prefecture_index_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @prefecture.destroy
    redirect_to admin_prefecture_index_path, success: t('.success')
  end

  private
  
  def set_prefecture
    @prefecture = Prefecture.find(params[:id])
  end

  def prefecture_params
    params.require(:prefecture).permit(:id, :name)
  end
end

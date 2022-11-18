class Admin::RationController < Admin::BaceController
  before_action :set_ration, only: %i[show edit update destroy]

  def index
    @rations = Ration.all.order(:id)
  end

  def new
    @ration = Ration.new
  end

  def create
    @ration = Ration.new(ration_params)
    if @ration.save
      redirect_to admin_ration_index_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  def update
    if @ration.update(ration_params)
      redirect_to admin_ration_index_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @ration.destroy
    redirect_to admin_ration_index_path, success: t('.success')
  end

  private

  def set_ration
    @ration = Ration.find(params[:id])
  end

  def ration_params
    params.require(:ration).permit(:id, :name, :energy)
  end
end

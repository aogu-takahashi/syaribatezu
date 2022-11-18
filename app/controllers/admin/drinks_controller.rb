class Admin::DrinksController < Admin::BaceController
  before_action :set_drink, only: %i[show edit update destroy]

  def index
    @drinks = Drink.all.order(:id)
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      redirect_to admin_drinks_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit; end

  def update
    if @drink.update(drink_params)
      redirect_to admin_drinks_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @drink.destroy
    redirect_to admin_drinks_path, success: t('.success')
  end

  private

  def set_drink
    @drink = Drink.find(params[:id])
  end

  def drink_params
    params.require(:drink).permit(:id, :name, :energy)
  end
end

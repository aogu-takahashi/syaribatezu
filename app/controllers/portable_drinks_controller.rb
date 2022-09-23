class PortableDrinksController < ApplicationController
  def new
    @portable_drink = PortableDrink.new
    set_memo
  end

  def create
    @portable_drink = PortableDrink.new(portable_drink_params)

    if @portable_drink.save
      redirect_to memo_path(@portable_drink.memo_id)
    else
      render :new
    end
  end

  def edit
    set_portable_drink
    set_memo
  end

  def update
    set_portable_drink

    if @portable_drink.update(portable_drink_params)
      redirect_to memo_path(@portable_drink.memo_id)
    else
      render :edit
    end
  end

  def destroy
    set_portable_drink
    @portable_drink.destroy
    redirect_to memo_path(@portable_drink.memo_id)
  end

  private

  def portable_drink_params
    params.require(:portable_drink).permit(:volume, :drink_id).merge(memo_id: params[:memo_id])
  end

  def set_portable_drink
    @portable_drink = PortableDrink.find(params[:id])
  end

  def set_memo
    @memo = Memo.find(params[:memo_id])
  end
end

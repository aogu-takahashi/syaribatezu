class PortableFoodsController < ApplicationController
  def new
    @portable_food = PortableFood.new
    set_memo
  end

  def create
    @portable_food = PortableFood.new(portable_food_params)

    if @portable_food.save
      redirect_to memos_path
    else
      render :new
    end
  end

  def edit
    set_portable_food
    set_memo
  end

  def update
    set_portable_food

    if @portable_food.update(portable_food_params)
      redirect_to memo_path(@portable_food.memo_id)
    else
      render :edit
    end
  end

  def destroy
    set_portable_food
    @portable_food.destroy
    redirect_to memo_path(@portable_food.memo_id)
  end

  private

  def portable_food_params
    params.require(:portable_food).permit(:volume, :ration_id).merge(memo_id: params[:memo_id])
  end

  def set_portable_food
    @portable_food = PortableFood.find(params[:id])
  end

  def set_memo
    @memo = Memo.find(params[:memo_id])
  end
end

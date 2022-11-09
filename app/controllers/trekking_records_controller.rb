class TrekkingRecordsController < ApplicationController
  def index
    @trekking_records = Memo.where(done: 1).order(created_at: :desc)
  end

  def show
    @trekking_record = Memo.find(params[:id])
    @portable_drinks = @trekking_record.portable_drinks
    @portable_foods = @trekking_record.portable_foods
  end

  def edit
    @trekking_record = Memo.find(params[:id])
  end

  def update
    @trekking_record = Memo.find(params[:id])
    if @trekking_record.update(trekking_record_params)
      flash[:success] = "記録を更新しました"
      redirect_to trekking_record_path(@trekking_record)
    else
      render :edit
    end
  end

  def destroy
    @trekking_record = Memo.find(params[:id])
    @trekking_record.destroy
    flash[:success] = "記録を削除しました"
    redirect_to trekking_records_path
  end

  private

  def trekking_record_params
    params.require(:memo).permit(:description)
  end
end

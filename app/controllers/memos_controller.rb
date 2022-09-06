class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def get_courses
    render partial: "select_corse", locals: { mountain_id: params[:mountain_id] }
  end

  def create
    @memo = Memo.new(memo_params)

    if @memo.save
      redirect_to memos_path
    else
      render :new
    end
  end

  private

  def memo_params
    params.require(:memo).permit(:date, :temperature, :description ,:done, :user_id, :course_id)
  end
end

class MemosController < ApplicationController
  def index
    @memos = current_user.memos.where(done: false).includes(course: :mountain).order(date: :desc)
  end

  def new
    @memo = Memo.new
  end

  def get_courses
    render partial: "select_course", locals: { mountain_id: params[:mountain_id] }
  end

  def create
    @memo = current_user.memos.new(memo_params)

    if @memo.save
      redirect_to memos_path, success: t(".create_success")
    else
      render :new
    end
  end

  def show
    @memo = current_user.memos.includes(course: :mountain).find(params[:id])
    @portable_foods = PortableFood.includes(:ration).where(memo_id: params[:id])
    @portable_drinks = PortableDrink.includes(:drink).where(memo_id: params[:id])
  end

  def edit
    if set_memo
    else
      redirect_to memos_path, danger: t(".edit_failure")
    end
  end

  def update
    set_memo

    if @memo.update(memo_params)
      redirect_to memos_path, success: t(".update_success")
    else
      flash.now[:danger] = t(".update_failure")
      render :edit
    end
  end

  def destroy
    set_memo
    @memo.destroy
    redirect_to memos_path, success: t(".destroy_success")
  end

  private

  def memo_params
    params.require(:memo).permit(:date, :temperature, :description ,:done, :user_id, :course_id)
  end

  def set_memo
    @memo = current_user.memos.find(params[:id])
  end
end

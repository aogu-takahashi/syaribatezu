class CoursesController < ApplicationController
  skip_before_action :require_login, only: [:index]
  
  def index
    render partial: "select_course", locals: { mountain_id: params[:mountain_id] }
  end

  def new
    @course = Course.new
    @mountain = Mountain.find(params[:mountain_id])
  end
  
  def create
    @course = current_user.courses.new(course_params)
    if @course.save
      redirect_to mountain_path(params[:mountain_id]), success:  t('.success')
    else
      flash.now[:danger] = "コースの作成に失敗しました"
      render :new
    end
  end

  def show
    set_course
    @mountain = Mountain.find(params[:mountain_id])
  end

  def edit
    set_course
    @mountain = Mountain.find(params[:mountain_id])
  end

  def update
    set_course
    if @course.update(course_params)
      redirect_to mountain_path(params[:mountain_id]), success:  t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit
    end
  end

  def destroy
    set_course
    @course.destroy
    redirect_to mountain_path(params[:mountain_id]), success: t('.success')
  end

  private

  def course_params
    params.require(:course).permit(:name, :days, :walking_time, :distance, :denivele_plus, :denivele_minus).merge(mountain_id: params[:mountain_id])
  end

  def set_course
    @course = current_user.courses.find(params[:id])
  end
end

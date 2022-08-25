class CoursesController < ApplicationController
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to mountain_path(params[:mountain_id]), notice:  "Course was successfully created."
    else
      flash.now[:notice] = "コースの作成に失敗しました"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
    params.require(:course).permit(:name, :days, :walking_time, :distance, :denivele_plus, :denivele_minus).merge(mountain_id: params[:mountain_id])
  end
end

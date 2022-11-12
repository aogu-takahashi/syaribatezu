class CoursesController < ApplicationController
  def new
    @course = Course.new
    @mountain = Mountain.find(params[:mountain_id])
  end
  
  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to mountain_path(params[:mountain_id]), success:  t('.success')
    else
      flash.now[:danger] = "コースの作成に失敗しました"
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
    @mountain = Mountain.find(params[:mountain_id])
  end

  def edit
    @course = Course.find(params[:id])
    @mountain = Mountain.find(params[:mountain_id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update(course_params)
      redirect_to mountain_path(params[:mountain_id]), notice:  "Course was successfully updated."
    else
      flash.now[:notice] = "コースの更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to mountain_path(params[:mountain_id]), notice:  "Course was successfully destroyed."
  end

  private

  def course_params
    params.require(:course).permit(:name, :days, :walking_time, :distance, :denivele_plus, :denivele_minus).merge(mountain_id: params[:mountain_id])
  end
end

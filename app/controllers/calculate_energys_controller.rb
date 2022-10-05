class CalculateEnergysController < ApplicationController
  def prefectures
    @prefectures = Prefecture.all
  end

  def mountains
    prefecture = Prefecture.find(params[:prefecture_id])
    @mountains = prefecture.mountains
  end

  def get_courses
    render partial: "select_course", locals: { mountain_id: params[:mountain_id] }
  end

  def set_user
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end

    @course = Course.find(course_params[:course_id])
  end

  # (1.8*行動時間(h) + 0.3*歩行距離(km) + 10*上りの累積標高差(km) + 0.6*下りの累積標高差(km)) * (体重(kg) + ザック重量(kg)) * 0.7 = kcal

  # 体重(kg) * 行動時間(h) * 5 = ml 
  # 気温が２５度以上の場合、上の5は7に変更する

  private

  def course_params
    params.require(:course).permit(:course_id)
  end
end

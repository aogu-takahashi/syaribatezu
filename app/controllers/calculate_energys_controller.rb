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

  def set_other
    @user = User.new
    @user.age = user_params[:age]
    @user.sex = user_params[:sex]
    @user.height = user_params[:height]
    @user.weight = user_params[:weight]
    @user.rucksack_weight = user_params[:rucksack_weight]
    @course = Course.find(user_params[:course_id])
  end

  def create
    course = Course.find(data_params[:course_id])

    @amount_of_energy = ((course.walking_time * 1.8 + course.distance * 0.3 + course.denivele_plus * 10.0 + course.denivele_minus * 0.6) * (data_params[:weight].to_i + data_params[:rucksack_weight].to_i) * 0.7).round

    coefficient_of_water =  if data_params[:temperature].to_i >= 25
                              7
                            else
                              5
                            end

    @amount_of_water = data_params[:weight].to_i * course.walking_time * coefficient_of_water

    @pocari = @amount_of_water.round(-2)

    @yokan = (@amount_of_energy - @pocari/100 * Drink.find_by(name: "ポカリ").energy) / Ration.find_by(name: "羊羹").energy
  end


  # 体重(kg) * 行動時間(h) * 5 = ml 
  # 気温が２５度以上の場合、上の5は7に変更する

  private

  def course_params
    params.require(:course).permit(:course_id)
  end

  def user_params
    params.require(:user).permit(:age, :sex, :height, :weight, :rucksack_weight, :course_id)
  end

  def data_params
    params.permit(:date, :temperature, :age, :sex, :height, :weight, :rucksack_weight, :course_id)
  end
end

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

    @amount_of_water = (data_params[:weight].to_i * course.walking_time * coefficient_of_water).round

    @pocari = @amount_of_water.round(-2)


    ration_energy = @amount_of_energy - @pocari/100 * Drink.find_by(name: "ポカリ").energy

    # 必要エネルギー量　/ (ﾁｮｺ + 羊羹 + ﾄﾞﾗｲﾌﾙｰﾂ)
    bace = ration_energy / 550

    a = ration_energy - bace * 550

    case a
      when 1..50
        @choco = bace
        @yokan = bace
        @dried_fruit = bace

      when 51..130
        @choco = bace
        @yokan = bace
        @dried_fruit = bace + 1
      
      when 131..200
        @choco = bace
        @yokan = bace + 1
        @dried_fruit = bace

      when 201..330
        @choco = bace + 1
        @yokan = bace 
        @dried_fruit = bace 

      when 331..430
        @choco = bace + 1
        @yokan = bace 
        @dried_fruit = bace + 1

      else
        @choco = bace + 1
        @yokan = bace + 1
        @dried_fruit = bace
    end

    @choco_energy = @choco * Ration.find_by(name: "チョコレート").energy
    @yokan_energy = @yokan * Ration.find_by(name: "羊羹").energy
    @dried_fruit_energy = @dried_fruit * Ration.find_by(name: "ドライフルーツ").energy
    @pocari_energy = @pocari/100 * Drink.find_by(name: "ポカリ").energy
    @total_energy = @choco_energy + @yokan_energy + @dried_fruit_energy + @pocari_energy

    @save_data = data_params
  end

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

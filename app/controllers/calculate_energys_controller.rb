class CalculateEnergysController < ApplicationController
  skip_before_action :require_login

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

    # エネルギー量 (ﾁｮｺ + 羊羹 + ﾄﾞﾗｲﾌﾙｰﾂ)
    bace_set = Ration.find_by(name: "チョコレート").energy + Ration.find_by(name: "羊羹").energy + Ration.find_by(name: "ドライフルーツ").energy

    basic_quantity = ration_energy / bace_set

    differencial_energy = ration_energy - basic_quantity * bace_set

    case differencial_energy
      when 1..50
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity

      when 51..130
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity + 1
      
      when 131..200
        @choco = basic_quantity
        @yokan = basic_quantity + 1
        @dried_fruit = basic_quantity

      when 201..330
        @choco = basic_quantity + 1
        @yokan = basic_quantity 
        @dried_fruit = basic_quantity 

      when 331..430
        @choco = basic_quantity + 1
        @yokan = basic_quantity 
        @dried_fruit = basic_quantity + 1

      when 431..549
        @choco = basic_quantity + 1
        @yokan = basic_quantity + 1
        @dried_fruit = basic_quantity

      else
        @choco = basic_quantity
        @yokan = basic_quantity
        @dried_fruit = basic_quantity
    end

    @choco_energy = @choco * Ration.find_by(name: "チョコレート").energy
    @yokan_energy = @yokan * Ration.find_by(name: "羊羹").energy
    @dried_fruit_energy = @dried_fruit * Ration.find_by(name: "ドライフルーツ").energy
    @pocari_energy = @pocari/100 * Drink.find_by(name: "ポカリ").energy
    @total_energy = @choco_energy + @yokan_energy + @dried_fruit_energy + @pocari_energy

    @save_data = data_params
  end

  def save_memo
    if logged_in?
      memo = Memo.new(memo_data_params)
      memo.user_id = current_user.id
      memo.save

      if ration_data_params[:choco].to_i > 0
        choco = PortableFood.new(volume: ration_data_params[:choco], ration_id: Ration.find_by(name: "チョコレート").id, memo_id: memo.id)
        choco.save
      end

      if ration_data_params[:yokan].to_i > 0
        yokan = PortableFood.new(volume: ration_data_params[:yokan], ration_id: Ration.find_by(name: "羊羹").id, memo_id: memo.id)
        yokan.save
      end

      if ration_data_params[:dried_fruit].to_i > 0
        dried_fruit = PortableFood.new(volume: ration_data_params[:dried_fruit], ration_id: Ration.find_by(name: "ドライフルーツ").id, memo_id: memo.id)
        dried_fruit.save
      end

      if drink_data_params[:pocari].to_i > 0
        pocari = PortableDrink.new(volume: drink_data_params[:pocari], drink_id: Drink.find_by(name: "ポカリ").id, memo_id: memo.id)
        pocari.save
      end

      redirect_to root_path
    else
      redirect_to login_path
    end
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

  def memo_data_params
    params.permit(:temperature, :course_id, :date)
  end

  def ration_data_params
    params.permit(:choco, :yokan, :dried_fruit)
  end

  def drink_data_params
    params.permit(:pocari)
  end
end

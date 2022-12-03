class TemperatureController < ApplicationController
  skip_before_action :require_login

  def edit
    @user = User.new
    @user.age = user_params[:age]
    @user.sex = user_params[:sex]
    @user.height = user_params[:height]
    @user.weight = user_params[:weight]
    @user.rucksack_weight = user_params[:rucksack_weight]
    @course = Course.find(user_params[:course_id])
  end

  private

  def user_params
    params.require(:user).permit(:age, :sex, :height, :weight, :rucksack_weight, :course_id)
  end
end

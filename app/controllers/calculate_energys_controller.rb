class CalculateEnergysController < ApplicationController
  skip_before_action :require_login

  include CalculateActions

  def create
    course = Course.find(data_params[:course_id])
  
    calculate(course, data_params)
  end

  private

  def data_params
    params.permit(:date, :temperature, :age, :sex, :height, :weight, :rucksack_weight, :course_id)
  end
end

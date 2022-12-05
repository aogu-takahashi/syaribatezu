class ResultsController < ApplicationController
  skip_before_action :require_login

  include CalculateResultsSave

  def create
    if logged_in?
      results_save(memo_data_params, ration_data_params, drink_data_params)

      flash[:success] = "メモを保存しました"
      redirect_to memos_path
    else
      redirect_to login_path
    end
  end

  private

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

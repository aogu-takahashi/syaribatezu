class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create edit]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def edit
    if logged_in?
      @user = current_user
    else
      @user = User.new
    end

    @course = Course.find(course_params[:course_id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :sex, :height, :weight, :rucksack_weight)
  end

  def course_params
    params.require(:course).permit(:course_id)
  end
end

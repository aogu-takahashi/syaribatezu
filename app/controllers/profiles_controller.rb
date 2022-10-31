class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: "プロフィールを更新しました"
    else
      flash.now[:alert] = "プロフィールの更新に失敗しました"
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :age, :sex, :height, :weight, :rucksack_weight)
  end
end

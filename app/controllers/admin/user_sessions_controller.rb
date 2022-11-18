class Admin::UserSessionsController < Admin::BaceController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :check_admin, only: [:new, :create]
  layout 'admin/layouts/application'

  def new; end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to admin_root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def destroy
    logout
    redirect_to admin_login_path, success: t('.success')
  end
end

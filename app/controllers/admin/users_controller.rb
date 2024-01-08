class Admin::UsersController < Admin::ApplicationController
  before_action :only_my_ppage_can_be_accessible!

  def show
    @projects = current_user.projects
  end

  private

  def only_my_ppage_can_be_accessible!
    @user = User.find(params[:id])
    redirect_to admin_user_path(current_user) if @user != current_user
  end
end

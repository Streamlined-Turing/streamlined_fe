class UsersController < ApplicationController
  before_action :fetch_user, only: %i[show edit]

  def show; end

  def edit; end

  def update
    user = UserFacade.edit_user(current_user, params[:username])
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
    UserFacade.delete(current_user)
    session[:user_id] = nil
    redirect_to root_path
    flash[:alert] = 'Account successfully deleted'
  end

  private

  def fetch_user
    @user = UserFacade.get(current_user)
  end
end

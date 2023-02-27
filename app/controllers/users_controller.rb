class UsersController < ApplicationController
  def show; end

  def edit; end

  def update
    user = UserFacade.edit_user(current_user, params[:username])
    session[:user] = user
    redirect_to dashboard_path
  end
end

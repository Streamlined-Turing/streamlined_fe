class UsersController < ApplicationController
  before_action :fetch_user, only: %i[show]

  def show; end

  def edit; end

  def update
    user = UserFacade.edit_profile(current_user, params[:username])

    redirect_to dashboard_path
  end

  private

  def fetch_user
    @user = session[:user]
  end
end

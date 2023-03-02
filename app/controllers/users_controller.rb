class UsersController < ApplicationController
  before_action :fetch_user, only: %i[show edit]

  def show
    if params[:list] == 'Want to Watch'
      @media_list = MediaFacade.list_results(current_user, params[:list])
    elsif params[:list] == 'Watched'
      @media_list = MediaFacade.list_results(current_user, params[:list])
    else
      params[:list] = 'Currently Watching'
      @media_list = MediaFacade.list_results(current_user, params[:list])
    end

    @list = params[:list]
  end

  def edit; end

  def update
    user = UserFacade.edit_user(current_user, params[:username])

    if user.try(:id)
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:alert] = user
      redirect_back(fallback_location: dashboard_path)
    end
  end

  def destroy
    UserFacade.delete(current_user)
    session[:user_id] = nil
    redirect_to root_path
    flash[:alert] = 'Account successfully deleted'
  end

  private

  def fetch_user
    if current_user.nil?
      flash[:alert] = 'Must be logged in to access the dashboard'
      redirect_to root_path
    else
      @user = UserFacade.get(current_user)
    end
  end
end
